package com.tgzzzxweb.action;

import java.util.List;

import com.tgzzzxweb.BaseAction;
import com.tgzzzxweb.model.User;
import com.tgzzzxweb.model.admin;
import com.tgzzzxweb.server.adminServer;
import com.tgzzzxweb.serverimp.adminServerImp;
@SuppressWarnings("serial")

public class UserLogin extends BaseAction {
	private admin ad = new admin();
	private final adminServerImp adserver = new adminServerImp();
	
	public String execute() throws Exception {
		//System.out.println("执行");
		ad.setAid((String)request.getParameter("user.username"));
		ad.setPassword((String) request.getParameter("user.password"));
		session.setAttribute("username",ad.getAid());
		session.setAttribute("password",ad.getPassword());
		//System.out.println(userServer.UserChek(user));
		List<admin> list = adserver.showAlladmin();
		System.out.println(list);
//		for (User temp : list) {
//			if (temp.getUsername().equals(user.getUsername()) && temp.getPassword().equals(user.getPassword())) {
//				session.setAttribute("user", "user");
//				session.setMaxInactiveInterval(60);
//				return SUCCESS;
//			}
//		}
		if (adserver.adminChek(ad)) {
			session.setAttribute("admin", "admin");
			session.setMaxInactiveInterval(60);
			//System.out.println("返回成功");
			return SUCCESS;
		}
		request.setAttribute("error","用户名或密码错误");
		return INPUT;
	}

	public String exeitLogin() {
		session.removeAttribute("admin");
		return "exeit";
	}

    public void setAd(admin ad) {
        this.ad = ad;
    }

    public admin getAd() {
        return ad;
    }
}
