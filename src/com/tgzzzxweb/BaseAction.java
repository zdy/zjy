package com.tgzzzxweb;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class BaseAction extends ActionSupport {
	public HttpServletRequest request;
	public HttpSession session;

	public BaseAction() {
		request = ServletActionContext.getRequest();
		session = request.getSession(true);
	}
}
