/**
 * 
 */
package com.qimeng.common.web;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.jcraft.jsch.JSchException;
import com.qimeng.common.tools.SFTPClient;
import com.qimeng.bs.common.service.DcSystemConfigService;

/**
 * 图片从ftp上获取并返回页面
 * 
 * @author zhong.jianrong
 * 
 */
public class PhotosServlet extends HttpServlet {

	private final Logger logger = Logger.getLogger(PhotosServlet.class);
	SFTPClient sftpClient = new SFTPClient();

	@Override
	public void init() throws ServletException {

		super.init();
		this.initSFTPConnection();
	}

	private void initSFTPConnection() {
		ServletContext sc = this.getServletContext();
		WebApplicationContext wac = WebApplicationContextUtils
				.getRequiredWebApplicationContext(sc);
		DcSystemConfigService dcSystemConfigService = (DcSystemConfigService) wac
				.getBean("dcSystemConfigService");

		String host = dcSystemConfigService.getSystemParamValue("FTP_HOSTNAME");
		String login = dcSystemConfigService
				.getSystemParamValue("FTP_USERNAME");
		String password = dcSystemConfigService
				.getSystemParamValue("FTP_PASSWORD");
		int port = Integer.parseInt(dcSystemConfigService
				.getSystemParamValue("FTP_PORT"));
		try {
			sftpClient.connect(host, login, password, port);
		} catch (JSchException e) {
			logger.error("存储图片的FTP服务器连接失败！！");
			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		synchronized (PhotosServlet.class) {
			doRequest(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		synchronized (PhotosServlet.class) {
			doRequest(req, resp);
		}
	}

	/**
	 * 处理图片请求
	 */
	void doRequest(HttpServletRequest req, HttpServletResponse resp) {

		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();

		// ftp文件路径：“/photos”后面的字符串
		String remotePath = uri.substring(contextPath.length()
				+ "/photos".length());

		OutputStream outputStream = null;

		try {
			resp.setContentType("image/*");
			outputStream = resp.getOutputStream();
			sftpClient.downloadFile(remotePath, outputStream);

		} catch (Exception e) {
			e.printStackTrace();
			PrintWriter toClient = null;
			try {
				toClient = new PrintWriter(outputStream);
				resp.setContentType("text/html;charset=gb2312");
				toClient.write("无法打开图片!");

			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} finally {
				if (toClient != null) {
					toClient.close();
				}
			}

		} finally {
			if (outputStream != null) {
				try {
					outputStream.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}
}
