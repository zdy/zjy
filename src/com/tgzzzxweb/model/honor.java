package com.tgzzzxweb.model;
import java.sql.*;
public class honor {
    public int id;
    public java.sql.Date date;
    public String introduction;
    public int Wid;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getDate() {
        return date;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public int getWid() {
        return Wid;
    }

    public void setWid(int wid) {
        Wid = wid;
    }

    @Override
    public String toString() {
        return "[honor:" + ",date=" + date + ",introduction=" + introduction +"]";
    }
}
