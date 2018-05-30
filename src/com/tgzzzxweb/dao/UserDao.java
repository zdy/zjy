package com.tgzzzxweb.dao;

import java.util.List;

import com.tgzzzxweb.model.User;

public interface UserDao {
	boolean UserChek(User user);
	List<User> showAllUser();// 显示所有管理

	void deleteUer(String id);// 删除管理员

	void updateUser(User user, String id);// 修改管理员信息

	boolean addUser(User user);// add管理员

	public User selectByName(String userid);

	public boolean UserSimpleChek(User user);
}
