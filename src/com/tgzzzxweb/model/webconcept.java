package com.tgzzzxweb.model;

public class webconcept {
    public int id;
    public String start;
    public String Wcontinue;
    public String Wreturn;
    public String introduction;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getWcontinue() {
        return Wcontinue;
    }

    public void setWcontinue(String wcontinue) {
        Wcontinue = wcontinue;
    }

    public String getWreturn() {
        return Wreturn;
    }

    public void setWreturn(String wreturn) {
        Wreturn = wreturn;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getIntroduction() {
        return introduction;
    }

    @Override
    public String toString() {
        return "[webconcept:" + ",首贷=" + start +",续贷" + Wcontinue + "]";
    }
}
