package com.tgzzzxweb.server;

import java.util.List;

import com.tgzzzxweb.model.User;

public interface UserServer {
	boolean UserChek(User user);

	List<User> showAllUser();// 显示所有管理

	void deleteUser(String id);// 删除管理员

	void updateUser(User user, String id);// 修改管理员信息
	
	boolean addUser(User user);//AddUser;

	public User selectByName(String userid);

	public boolean UserSimpleChek(User user);
}
