package com.tgzzzxweb.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.tgzzzxweb.model.volunteer;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.tgzzzxweb.BaseAction;
import com.tgzzzxweb.server.StudentServet;
import com.tgzzzxweb.serverimp.StudentServerImp;
import com.tgzzzxweb.util.FileUtil;

@SuppressWarnings("serial")
public class StudentAction extends BaseAction {
	private StudentServet serverImp = new StudentServerImp();
	private Logger logger = Logger.getLogger(StudentAction.class);
	private volunteer volunteer = new volunteer();
	private String name;
	private List<volunteer> lists;
	private FileUtil fileUtil = new FileUtil();
	// file上传
	private File file; // 上传文件内容保存到此临时文件中
	private String fileFileContenttype;
	private String fileFileName;

	@Override
	public String execute() throws Exception {
		logger.info("execute");
		return SUCCESS;
	}

	@SuppressWarnings("static-access")
	public String addStudent() {
	    System.out.println(volunteer);
		if (!serverImp.studentchek(volunteer.getUid())) {
		    if(fileFileName != null) {
                String root = ServletActionContext.getServletContext().getRealPath("/upload");
                File create = new File(root);
                fileUtil.createFile(create);// 文件夹不存在则创建
                serverImp.uploadFile(fileFileName, file, root);
                volunteer.setPicture("/upload/" + fileFileName);
                System.out.println(fileFileName);
                System.out.println(volunteer.getPicture());
            }
			serverImp.addStudent(volunteer);
			lists= serverImp.selectAllStudent();
			request.setAttribute("lists", lists);
			return SUCCESS;
		}
		request.setAttribute("error", "学生已经存在");
		return INPUT;
	}

	public String deleteStudent() {
		String root = ServletActionContext.getServletContext().getRealPath("");
		serverImp.deleteStudent(request.getParameter("name"),Integer.parseInt(request.getParameter("id")),root);
		lists = serverImp.selectAllStudent();
		request.setAttribute("lists", lists);
		return SUCCESS;
	}

	public String upStudent() {
		System.out.println(volunteer);
		if (fileFileName == null || (serverImp.selectStudentImg(volunteer.getName()) != null && serverImp.selectStudentImg(volunteer.getName()).equals(fileFileName))) {
			fileFileName = serverImp.selectStudentImg(volunteer.getName());
			volunteer.setPicture(fileFileName);
			serverImp.updateStudent(volunteer, request.getParameter("volunteer.id"));
			lists = serverImp.selectAllStudent();
			request.setAttribute("lists", lists);
			return SUCCESS;
		}
		String root = ServletActionContext.getServletContext().getRealPath("/upload");
		serverImp.uploadFile(fileFileName, file, root);
		volunteer.setPicture("/upload/" + fileFileName);
		root = ServletActionContext.getServletContext().getRealPath("");
		serverImp.deletefile(root, volunteer.getName());
		System.out.println("0");
		serverImp.updateStudent(volunteer, request.getParameter("volunteer.id"));
		lists = serverImp.selectAllStudent();
		request.setAttribute("lists", lists);
		return SUCCESS;
	}

	public String selectStudent() {
		List<volunteer> volunteer = serverImp.selectStudentByName(request.getParameter("name"));
		request.setAttribute("volunteer", volunteer);
		return "selectStudent";
	}

	public String showallStudent() {
		lists = (List<volunteer>) serverImp.selectAllStudent();
		System.out.println(lists);
		request.setAttribute("lists", lists);
		return SUCCESS;
	}

	public volunteer getVolunteer() {
		return volunteer;
	}

	public void setVolunteer(volunteer volunteer) {
		this.volunteer = volunteer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
