package com.tgzzzxweb.server;

import java.sql.Time;
import java.util.ArrayList;
import java.util.*;
import com.tgzzzxweb.model.People;
import com.tgzzzxweb.model.time;

public interface PeopleServer {
    void deletePeople(int id);// 根据预约用户姓名删除

    List<People> selectPeopleByName(String name);// 根据用户姓名查找

    List<People> selectPeopleByDate(String date);//根据预约日期查找

    List<People> selectPeopleByedu(String edu);//更据学历查找

    List<People> selectAllPeople();// 查询所有用户

    void updatePeople(People people, String id);// 更新用户信息

    boolean peoplechek(String phone,String name);// 是用户否存在

    public People selectPeopleByUid(String Uid);

    public boolean studentchek(String Uid);

    public void addpeople(People peo);

    public List<time> order();

    public int jisuanrenshu(java.sql.Date date,Time time);
}
