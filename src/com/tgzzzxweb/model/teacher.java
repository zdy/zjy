package com.tgzzzxweb.model;

public class teacher {
    public int id;
    public String name;
    public String introduction;
    public String Cname;
    public int Wid;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public void setCname(String cname) {
        Cname = cname;
    }

    public String getCname() {
        return Cname;
    }

    public void setWid(int wid) {
        Wid = wid;
    }

    public int getWid() {
        return Wid;
    }

    @Override
    public String toString() {
        return "[teacher:" + ",name = " + name + ",introduction" + introduction + "]";
    }
}
