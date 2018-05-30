package com.tgzzzxweb.server;

import java.io.File;
import java.util.ArrayList;
import java.util.*;
import com.tgzzzxweb.model.volunteer;

public interface StudentServet {
	boolean addStudent(volunteer volunteer);// 添加学生

	void deleteStudent(String name,int id, String path);// 根据学生姓名删除学生

	List<volunteer> selectStudentByName(String name);// 根据学生姓名查询学生

	List<volunteer> selectAllStudent();// 查询所有学生

	void updateStudent(volunteer volunteer, String name);// 更新学生信息

	boolean studentchek(String name);// 学生是否存在

	String selectStudentImg(String name);// h获取学生Img

	void deletefile(String path, String name);

	void uploadFile(String filename, File file, String path);

	public volunteer selectStudentByUid(String Uid);
}
