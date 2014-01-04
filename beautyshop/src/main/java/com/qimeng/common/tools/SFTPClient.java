package com.qimeng.common.tools;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Vector;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.vfs2.FileSystemException;
import org.apache.commons.vfs2.FileSystemOptions;
import org.apache.commons.vfs2.provider.sftp.SftpClientFactory;
import org.apache.commons.vfs2.provider.sftp.SftpFileSystemConfigBuilder;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;
import com.jcraft.jsch.ChannelSftp.LsEntry;

/**
 * SFTP 
 * @author zhou.peiyuan 
 *
 */
public class SFTPClient{

	private ChannelSftp command;

	private Session session;

	public SFTPClient() {
		command = null;
	}

	public boolean connect(String host, String login, String password, int port) throws JSchException {

		//If the client is already connected, disconnect
		if (command != null) {
			disconnect();
		}
		FileSystemOptions fso = new FileSystemOptions();
		try {
			SftpFileSystemConfigBuilder.getInstance().setStrictHostKeyChecking(fso, "no");
			session = SftpClientFactory.createConnection(host, port, login.toCharArray(), password.toCharArray(), fso);
			Channel channel = session.openChannel("sftp");
			session.setServerAliveInterval(1000 * 10);
			channel.connect();
			command = (ChannelSftp) channel;

		} catch (FileSystemException e) {
			e.printStackTrace();
			return false;
		}
		return command.isConnected();
	}

	public void disconnect() {
		if (command != null) {
			command.exit();
		}
		if (session != null) {
			session.disconnect();
		}
		command = null;
	}
	
	public Vector<String> listFileInDir(String remoteDir) throws Exception {
		try {
			Vector<LsEntry> rs = command.ls(remoteDir);
			Vector<String> result = new Vector<String>();
			for (int i = 0; i < rs.size(); i++) {
				if (!isARemoteDirectory(rs.get(i).getFilename())) {
					result.add(rs.get(i).getFilename());
				}
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println(remoteDir);
			throw new Exception(e);
		}
	}

	public Vector<String> listSubDirInDir(String remoteDir) throws Exception {
		Vector<LsEntry> rs = command.ls(remoteDir);
		Vector<String> result = new Vector<String>();
		for (int i = 0; i < rs.size(); i++) {
			if (isARemoteDirectory(rs.get(i).getFilename())) {
				result.add(rs.get(i).getFilename());
			}
		}
		return result;
	}

	public boolean createDirectory(String dirName) {
		try {
			command.mkdir(dirName);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public boolean downloadFileAfterCheck(String remotePath, String localPath) throws Exception {
		FileOutputStream outputSrr = null;
		try {
			File file = new File(localPath);
			if (!file.exists()) {
				outputSrr = new FileOutputStream(localPath);
				command.get(remotePath, outputSrr);
			}
		} catch (SftpException e) {
            System.err.println(remotePath + " not found in " + command.pwd());
            e.printStackTrace();
			return false;
		} finally {
			if (outputSrr != null) {
				outputSrr.close();
			}
		}
		return true;
	}

	public boolean downloadFile(String remotePath, String localPath) throws Exception {
		FileOutputStream outputSrr = new FileOutputStream(localPath);
		try {
			command.get(remotePath, outputSrr);
		} catch (SftpException e) {
            System.err.println(remotePath + " not found in " + command.pwd());
            e.printStackTrace();
			return false;
		} finally {
			if (outputSrr != null) {
				outputSrr.close();
			}
		}
		return true;
	}
	
	public boolean downloadFile(String remotePath, OutputStream outputStream) throws Exception {
		try {
			command.get(remotePath, outputStream);
		} catch (SftpException e) {
            System.err.println(remotePath + " not found in " + command.pwd());
            e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean uploadFile(String localPath, String remotePath) throws IOException {
		FileInputStream inputSrr = new FileInputStream(localPath);
		try {
			command.put(inputSrr, remotePath);
		} catch (SftpException e) {
			e.printStackTrace();
			return false;
		} finally {
			if (inputSrr != null) {
				inputSrr.close();
			}
		}
		return true;
	}
	
	public boolean uploadFile(InputStream inputIo,String remotePath,String fileName)throws IOException {
		try {
			command.put(inputIo, remotePath + fileName);
		} catch (SftpException e) {
			e.printStackTrace();
			return false;
		} finally {
			if (inputIo != null) {
				inputIo.close();
			}
		}
		return true;
	}
	
	public void rmFile(String path){
		try {
			command.rm(path);
		} catch (SftpException e) {
		}
	}
	
	 public boolean checkAndCreateDir(String path) throws Exception 
	    {
	        System.out.println("crateDir: "+path);
	        if(path == null|| path == "" || command == null)
	        {
	            return false;
	        }
	    	System.out.println(command.getHome());
	        String[] paths = path.split("/");
//	        StringBuilder parentPath = new StringBuilder(command.getHome());
	        for (int i = 0; i < paths.length - 1; i++)
	        {
	        	if(StringUtils.isEmpty(paths[i])){
	        		paths[i] = "/";
	        	}
	        	Vector<String>  subDirs = listSubDirInDir(paths[i]);
	        	boolean is = false;
	            boolean f = true;
	            if(f)
	            {
	                for (String subDir : subDirs)
	                {
	                    if(subDir.equals(paths[i]))
	                    {
	                    	changeDir(paths[i]);
//	                        ftpConn.changeWorkingDirectory();
	                        is = true;
	                        break;
	                    }
	                }
	            }
	            if(!is)
	            {
	                f = false;
	                boolean a,x=false;
	                a = createDirectory(new String(paths[i].getBytes("UTF-8"),"iso-8859-1"));  //ftpConn.makeDirectory(new String(paths[i].getBytes("UTF-8"),"iso-8859-1"));
	                x = changeDir(paths[i]);//ftpConn.changeWorkingDirectory(paths[i]);
	                if(!a || !x) return false;
	            }
	        }
	        return true;
	    }
	
	
//	public boolean uploadFileBeforeCheck(String localPath,String remotePath,String fileName){
//		
//		
//	}
	
	public boolean renameOnly(String localPath,String ftpPath){
		boolean isExisted = false;
		
			try {
				
					command.rename(localPath, ftpPath);
			} catch (SftpException e) {
				try {
					Thread.currentThread().sleep(10000);
				} catch (InterruptedException ie) {
					ie.printStackTrace();
				}
//				throw new FtpException("删除FTP服务器文件IO异常,请检查网�?"+e.getMessage()+"|"+localPath+"|"+ftpPath+"|"+command.isClosed()+"|"+command.isConnected());
			
			}
			return isExisted ;
	}

	public boolean changeDir(String remotePath) throws Exception {
		try {
			command.cd(remotePath);
		} catch (SftpException e) {
			return false;
		}
		return true;
	}

	public boolean isARemoteDirectory(String path) {
		try {
			return command.stat(path).isDir();
		} catch (SftpException e) {
			//e.printStackTrace();
		}
		return false;
	}

	public String getWorkingDirectory() throws Exception{
        return command.pwd();
	}

	
	public static void main(String[] args) throws Exception{
		 SFTPClient sftpClient = new SFTPClient();
		 sftpClient.connect("10.45.47.152", "ftpuser", "zte5927", 22);
		 String catalogId = "1";
		 String goodId = "1";
		//在ftp服务器上创建当前文件存储目录
		 if (!sftpClient.changeDir("goods")) {
				sftpClient.createDirectory("goods");
				sftpClient.changeDir("goods");
			}
			if (!sftpClient.changeDir(catalogId)) {
				sftpClient.createDirectory(catalogId);
				sftpClient.changeDir(catalogId);
			}
			if (!sftpClient.changeDir(goodId)) {
				sftpClient.createDirectory(goodId);
				sftpClient.changeDir(goodId);
			}
			
			sftpClient.rmFile("660a3636f45545fd9bcf69eeae046e46.jpg");
			sftpClient.disconnect();
//		 sftpClient.checkAndCreateDir("/data_market_p/goods/"+10+"/"+1);
	}
}
