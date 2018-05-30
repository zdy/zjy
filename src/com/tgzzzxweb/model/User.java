package com.tgzzzxweb.model;

public class User {
	private String userid;
	private String password;
	private String name;
	private int bool;
	public User(String userid, String password, String name, int bool) {
		super();
		this.userid = userid;
		this.password = password;
		this.name = name;
		this.bool = bool;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBool() {
		return bool;
	}
	public void setBool(int bool) {
		this.bool = bool;
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", password=" + password + ", name=" + name + ", id=" + bool + "]";
	}
	
}