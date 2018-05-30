package com.tgzzzxweb.model;

import java.sql.*;

public class time {
    private Date date;
    private Time time;
    private int num;

    public void setTime(Time time) {
        this.time = time;
    }

    public Time getTime() {
        return time;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "[Date:" + date + "time:" + time + "num:" + num + "]";
    }
}
