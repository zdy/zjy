package com.tgzzzxweb.serverimp;

import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tgzzzxweb.dao.PeopleDao;
import com.tgzzzxweb.impldao.PeopleDaoImp;
import com.tgzzzxweb.model.People;
import com.tgzzzxweb.server.PeopleServer;
import com.tgzzzxweb.model.time;

public class PeopleServerImp implements PeopleServer{
    public PeopleDao dao = new PeopleDaoImp();
    public void deletePeople(int id){
        dao.deletePeople(id);
    }

    public List<People> selectPeopleByName(String name){
        List<People> lists = dao.selectPeopleByName(name);
        return lists;
    }

    public List<People> selectPeopleByDate(String date){
        List<People> lists = dao.selectPeopleByDate(date);
        return lists;
    }

    public List<People> selectPeopleByedu(String edu){
        List<People> lists = dao.selectPeopleByedu(edu);
        return lists;
    }

    public List<People> selectAllPeople(){
        List<People> lists = dao.selectAllPeople();
        return lists;
    }

    public void addpeople(People peo){
        dao.addpeople(peo);
    }
    public void updatePeople(People people, String id){
        dao.updatePeople(people,id);
    }

    public boolean peoplechek(String phone,String name){
        return dao.peoplechek(phone,name);
    }

    public People selectPeopleByUid(String Uid){
        return dao.selectStudentByUid(Uid);
    }

    public boolean studentchek(String Uid){
        return dao.studentchek(Uid);
    }
    public List<time> order(){
        return dao.order();
    }
    public int jisuanrenshu(java.sql.Date date,Time time){
        return dao.jisuanrenshu(date,time);
    }
}
