package com.tgzzzxweb.model;

import java.sql.*;
import java.time.Year;
import java.util.Date;

public class volunteer {
	private String name;
	private int age;
	private String motto;
	private String year;
	private String phone;
	private String address;
	private String Uid;
	private String notes;
	private String sex;
	private String picture;
	private int id;
	private Timestamp date;
	public volunteer(String name, int age, String motto,String year,String phone,String address,String Uid,String notes,String sex, String picture, Timestamp date,int id) {
		super();
		this.name = name;this.address = address;this.age = age;
		this.year = year;this.phone = phone;this.Uid = Uid;this.notes = notes;this.sex = sex;
		this.picture = picture;
		this.date = date;
		this.id = id;
	}
	public volunteer(String name, int age, String motto,String year,String phone,String address,String Uid,String notes,String sex, String picture,Timestamp date) {
		super();
        this.name = name;this.address = address;this.age = age;
        this.year = year;this.phone = phone;this.Uid = Uid;this.notes = notes;this.sex = sex;
        this.picture = picture;
        this.date = date;
	}
	public volunteer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getMotto() { return motto; }
	public void setMotto(String motto) { this.motto = motto; }
	public String getYear() { return year; }
	public void setYear(String year) { this.year = year.substring(0,4); }
	public String getPhone() { return phone; }
	public void setPhone(String phone) { this.phone = phone; }
	public String getAddress() { return address; }
	public void setAddress(String address) { this.address = address; }
	public String getUid() { return Uid; }
	public void setUid(String Uid) {this.Uid = Uid; }
	public String getNotes() { return notes; }
	public void setNotes(String notes) { this.notes = notes; }
    public String getSex() {
		return sex;
	}
	public void setSex(String sex) { this.sex = sex; }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    @Override
	public String toString() {
		return "volunteer [name=" + name + ", age=" + age + ", sex=" + sex + ", picture=" + picture
				+ ",year=" + year + ", id=" + id + "]";
	}
	
}