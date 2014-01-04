package com.qimeng.bs.market.user.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.qimeng.common.Constants;
import com.qimeng.common.tools.ImagesUtils;
import com.qimeng.common.tools.SFTPClient;
import com.qimeng.bs.common.service.DcSystemConfigService;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.login.service.UserLoginService;
import com.qimeng.bs.market.user.service.DmUserService;

@SuppressWarnings("unchecked")
public class UploadUserPic extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public UploadUserPic() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		// 工程绝对路径 如：C:\Program Files\Apache Software Foundation\Tomcat6.0\webapps\DataMarket
		String realPath = request.getSession().getServletContext().getRealPath("");

		// 要传送文件上下文路径
		String contextPath = File.separator + "market" + File.separator + "user" + File.separator + "picture" + File.separator;

		String img_url = ""; // 图片展示url
		PrintWriter out = response.getWriter();
		try {
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			if (!isMultipart) {
				out.println("{\"result\":false,\"message\":\"\",\"oldFileName\":\"\"}");
			} else {
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				String finalimage = "";
				List items = null;
				try {
					items = upload.parseRequest(request);
				} catch (FileUploadException e) {
					e.printStackTrace();
					out.println("{\"result\":false,\"message\":\"" + e.getMessage() + "\"}");
				}
				Iterator itr = items.iterator();
				while (itr.hasNext()) {
					FileItem item = (FileItem) itr.next();
					if (item.isFormField()) {
					} else {
						try {
							String itemName = item.getName();
							Pattern pattern = Pattern.compile("[.*]");
							Matcher matcher = pattern.matcher(itemName);
							StringBuffer buffer = new StringBuffer();
							while (matcher.find()) {
								matcher.appendReplacement(buffer, "");
							}
							String suffix = itemName.substring(itemName.indexOf("."));
							String uuid = UUID.randomUUID().toString().replaceAll("-", "");
							finalimage = uuid + suffix;
							File dir = new File(realPath + contextPath);
							File savedFile = new File(realPath + contextPath + finalimage);
							if (!dir.exists()) {
								dir.mkdirs();
							}
							//等比缩放图像
							ImagesUtils.compressPic(item.getInputStream(), savedFile, 160, 160, true);
							
							//上传到FTP
							ApplicationContext appCtx = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
							DcSystemConfigService dcSystemConfigService = (DcSystemConfigService) appCtx.getBean("dcSystemConfigService");
							String ftp_hostname = dcSystemConfigService.getSystemParamValue("FTP_HOSTNAME");
							String ftp_username = dcSystemConfigService.getSystemParamValue("FTP_USERNAME");
							String ftp_password = dcSystemConfigService.getSystemParamValue("FTP_PASSWORD");
							int ftp_port = Integer.parseInt(dcSystemConfigService.getSystemParamValue("FTP_PORT"));
							SFTPClient sftpClient = openSFTPConnection(ftp_hostname, ftp_username, ftp_password, ftp_port);
							if (!sftpClient.changeDir("user")) {
								sftpClient.createDirectory("user");
								sftpClient.changeDir("user");
							}
							img_url = "/photos" + sftpClient.getWorkingDirectory() + "/" + finalimage;
							sftpClient.uploadFile(new FileInputStream(savedFile), sftpClient.getWorkingDirectory(), "/" + finalimage);
							closeSFTPConnection(sftpClient);
							savedFile.delete();
							
							//更新用户信息
							LoginInfo loginInfo = (LoginInfo) request.getSession().getAttribute(Constants.LOGIN_INFO);
							DmUserService dmUserService = (DmUserService) appCtx.getBean("dmUserService");
							Map sqlParams = new HashMap();
							sqlParams.put("userId", loginInfo.getUserId());
							sqlParams.put("headImage", img_url);
							dmUserService.updateUser(sqlParams);
							
							//刷新登录信息
							UserLoginService userLoginService = (UserLoginService) appCtx.getBean("userLoginService");
							userLoginService.refreshLoginInfo(loginInfo.getUserId());
						} catch (Exception e) {
							e.printStackTrace();
							out.println("{\"result\":false,\"message\":\"" + e.getMessage() + "\"}");
						}
					}
				}
				out.print("{\"result\":true,\"img_url\":\"" + img_url + "\"}");
			}
		} finally {
			out.close();
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

	public SFTPClient openSFTPConnection(String ftp_hostname, String ftp_username,
			String ftp_password, int ftp_port) throws Exception {
		SFTPClient sftpClient = new SFTPClient();
		try {
			sftpClient.connect(ftp_hostname, ftp_username, ftp_password, ftp_port);
		} catch (Exception e) {
			throw e;
		}
		return sftpClient;
	}
	
	public void closeSFTPConnection(SFTPClient sftpClient) throws Exception {
		sftpClient.disconnect();
	}
}
