package com.tgzzzxweb.dao;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.tgzzzxweb.model.volunteer;

public interface StudentDao {
	void addStudent(volunteer volunteer);// 添加学生

	void deleteStudent(String name,int id, String path);// 根据学生姓名删除学生

	List<volunteer> selectStudentByName(String name);// 根据学生姓名查询学生

	List<volunteer> selectAllStudent();// 查询所有学生

	void updateStudent(volunteer volunteer, String id);// 更新学生信息

	boolean studentchek(String name);// 学生是否存在

	String selectStudentImg(String name);// 获取学生Img

	void deleteFile(String path, String name);// 删除学生头像文件

	void uploadFile(String filename, String path, File file);// 上传头像文件

	public volunteer selectStudentByUid(String Uid);
}
