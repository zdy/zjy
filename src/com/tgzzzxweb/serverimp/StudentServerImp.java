package com.tgzzzxweb.serverimp;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tgzzzxweb.dao.StudentDao;
import com.tgzzzxweb.impldao.StudentDaoImp;
import com.tgzzzxweb.model.volunteer;
import com.tgzzzxweb.server.StudentServet;

public class StudentServerImp implements StudentServet {
	StudentDao dao = new StudentDaoImp();

	@Override
	public boolean addStudent(volunteer volunteer) {

		if (dao.studentchek(volunteer.getName())) {
			return false;
		} else {
			dao.addStudent(volunteer);
			return true;
		}
	}

	@Override
	public void deleteStudent(String name, int id ,String path) {
		dao.deleteStudent(name, id,path);
	}

	@Override
	public List<volunteer> selectStudentByName(String name) {
		List<volunteer> studnet = dao.selectStudentByName(name);
		return studnet;
	}

	@Override
	public List<volunteer> selectAllStudent() {
		List<volunteer> lists = dao.selectAllStudent();
		return lists;
	}

	@Override
	public void updateStudent(volunteer volunteer, String name) {
		dao.updateStudent(volunteer, name);
	}

	@Override
	public boolean studentchek(String name) {
		return dao.studentchek(name);
	}

	public volunteer getFile(HttpServletRequest request,
                             HttpServletResponse response) {
		return null;

	}

	public volunteer selectStudentByUid(String Uid){
		return dao.selectStudentByUid(Uid);
	}

	@Override
	public String selectStudentImg(String name) {
		return dao.selectStudentImg(name);
	}

	@Override
	public void deletefile(String path, String name) {
		dao.deleteFile(path, name);
	}

	@Override
	public void uploadFile(String filename, File file, String path) {
		dao.uploadFile(filename, path, file);
	}

}
