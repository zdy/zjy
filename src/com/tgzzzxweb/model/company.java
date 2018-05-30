package com.tgzzzxweb.model;

public class company {
    public String name;
    public String phone;
    public String address;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "[conpany:" + "name=" + name + "phone="+phone + ",address="+address + "]";
    }
}
