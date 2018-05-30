package com.tgzzzxweb.action;

import java.util.List;
import com.tgzzzxweb.BaseAction;
import com.tgzzzxweb.model.User;
import com.tgzzzxweb.server.UserServer;
import com.tgzzzxweb.serverimp.UserServerImp;
import org.hibernate.sql.Delete;

@SuppressWarnings("serial")
public class UserAction extends BaseAction {
	private UserServer userServer = new UserServerImp();
	private User user = new User();
	List<User> list;

    public String upUser() {
	    //System.out.println("1");
        list = (List<User>) userServer.showAllUser();
        request.setAttribute("lists", list);
        return LOGIN;
    }

	public String showUser() {
		list = (List<User>) userServer.showAllUser();
		System.out.println(list);
		request.setAttribute("lists", list);
		return SUCCESS;
	}

    public String addUser() {
        System.out.println("1");
        System.out.println(user);
        if (userServer.UserSimpleChek(user)) {
            System.out.println("1");
            request.setAttribute("error", "用户已经存在");
            return INPUT;
        } else {
        	System.out.println("2");
            userServer.addUser(user);
            list = (List<User>) userServer.showAllUser();
            //System.out.println(list);
            request.setAttribute("lists", list);
            return SUCCESS;
        }
    }

	public String deleteUser() {
		String temp = request.getParameter("id");
		userServer.deleteUser(temp);
		list = (List<User>) userServer.showAllUser();
		request.setAttribute("lists", list);
		return SUCCESS;
	}

	public String updateUser() {
		String temp = request.getParameter("user.userid");
		//System.out.println(user);
		userServer.updateUser(user, temp);
		list = (List<User>) userServer.showAllUser();
		request.setAttribute("lists", list);
		return SUCCESS;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
