package com.tgzzzxweb.model;

public class admin {
    private String aid;
    private String password;
    private String cname;
    public admin(String aid,String password,String cname){
        super();
        this.aid = aid;this.password = password;this.cname = cname;
    }
    public admin() {
        super();
        // TODO Auto-generated constructor stub
    }

    public String getAid() {
        return aid;
    }
    public String getCname() {
        return cname;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "admin [aid=" + aid + ", password=" + password + ", cname=" + cname + "]";
    }
}
