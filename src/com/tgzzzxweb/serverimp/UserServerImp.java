package com.tgzzzxweb.serverimp;

import java.util.List;

import com.tgzzzxweb.dao.UserDao;
import com.tgzzzxweb.impldao.UserDaoImp;
import com.tgzzzxweb.model.User;
import com.tgzzzxweb.server.UserServer;

public class UserServerImp implements UserServer {
	private final UserDao dao = new UserDaoImp();
	private User user;
	@Override
	public boolean UserChek(User user) {
		return dao.UserChek(user);
	}

	@Override
	public List<User> showAllUser() {

		return dao.showAllUser();
	}

	public User selectByName(String userid){
		return dao.selectByName(userid);
	}

    public boolean UserSimpleChek(User user){
	    return dao.UserSimpleChek(user);
    }
	@Override
	public void deleteUser(String id) {
		dao.deleteUer(id);
	}

	@Override
	public void updateUser(User user, String id) {
		dao.updateUser(user, id);
	}

	@Override
	public boolean addUser(User user) {
		dao.addUser(user);
		return true;
	}

}
