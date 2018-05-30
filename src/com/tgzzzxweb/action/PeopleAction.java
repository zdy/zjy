package com.tgzzzxweb.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.tgzzzxweb.BaseAction;
import com.tgzzzxweb.model.People;
import com.tgzzzxweb.model.volunteer;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import com.tgzzzxweb.server.PeopleServer;
import com.tgzzzxweb.serverimp.PeopleServerImp;

public class PeopleAction extends BaseAction{
    public People people = new People();
    public List<People> lists;
    public PeopleServer serverImp = new PeopleServerImp();
    public String deletePeople() {
        serverImp.deletePeople(Integer.parseInt(request.getParameter("id")));
        lists = serverImp.selectAllPeople();
        request.setAttribute("lists", lists);
        return SUCCESS;
    }
    public String showallpeople() {
        lists = (List<People>) serverImp.selectAllPeople();
        System.out.println(lists);
        request.setAttribute("lists", lists);
        return SUCCESS;
    }
    public String upPeople(){
        System.out.println(people);
        serverImp.updatePeople(people,request.getParameter("people.id"));
        lists = serverImp.selectAllPeople();
        request.setAttribute("lists", lists);
        return SUCCESS;
    }
    public String selectPeople(){
        System.out.println(3);
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String edu = request.getParameter("edu");
        System.out.println(name);
        System.out.println(date);
        System.out.println(edu);
        if(name != ""){
            System.out.println('0');
            List<People> lists = serverImp.selectPeopleByName(name);
            request.setAttribute("lists",lists);
        }
        if(date != ""){
            System.out.println(1);
            List<People> lists = serverImp.selectPeopleByDate(date);
            request.setAttribute("lists",lists);
        }
        if(edu != ""){
            System.out.println(2);
            List<People> lists = serverImp.selectPeopleByedu(edu);
            request.setAttribute("lists",lists);
        }
        return "selectPeople";
    }
    public People getPeople() {
        return people;
    }

    public void setPeople(People people) {
        this.people = people;
    }
}
