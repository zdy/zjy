package com.tgzzzxweb.model;

import java.sql.*;
public class People {
    public String name;
    public int age;
    public String sex;
    public String edu;
    public int id;
    public String phone;
    public String credit;
    public Date date;
    public Time time;
    public String Uid;
    public Timestamp ndate;
    public int bool;

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

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEdu() {
        return edu;
    }

    public void setEdu(String edu) {
        this.edu = edu;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCredit() {
        return credit;
    }

    public void setCredit(String credit) {
        this.credit = credit;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getDate() {
        return date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public String getUid() {
        return Uid;
    }

    public void setUid(String uid) {
        Uid = uid;
    }

    public void setBool(int bool) {
        this.bool = bool;
    }

    public int getBool() {
        return bool;
    }

    public Timestamp getNdate() {
        return ndate;
    }

    public void setNdate(Timestamp ndate) {
        this.ndate = ndate;
    }

    @Override
    public String toString() {
        return "People [id=" + id + ", Uid=" + Uid + ", name=" + name + ", bool=" + bool + ",date="+ date +",time=" + time + "]";
    }
}