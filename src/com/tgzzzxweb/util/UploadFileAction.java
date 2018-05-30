package com.tgzzzxweb.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class UploadFileAction extends ActionSupport {
	private Logger log = Logger.getLogger(UploadFileAction.class);
	private File file; // 上传文件内容保存到此临时文件中
	private String fileFileContenttype;
	private String fileFileName;

	public String execute() throws Exception {
		String root = ServletActionContext.getServletContext().getRealPath("/upload");
		File saveFile = null;
		try {
			saveFile = new File(root);
			log.info(root);
			log.info("fileContent" + fileFileContenttype);
			InputStream in = new FileInputStream(file);// 接收文件到临时文件夹
			OutputStream os = new FileOutputStream(saveFile);// 保存文件到本地
			byte[] bytes = new byte[512];
			int len = 0;
			while ((len = in.read(bytes)) != -1) {// 写入文件到本地
				os.write(bytes, 0, len);
			}
			log.info("fileName" + file.getName());
			os.close();
			in.close();
		} catch (NullPointerException e) {
		}
		return SUCCESS;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileContenttype() {
		return fileFileContenttype;
	}

	public void setFileFileContenttype(String fileFileContenttype) {
		this.fileFileContenttype = fileFileContenttype;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

}
