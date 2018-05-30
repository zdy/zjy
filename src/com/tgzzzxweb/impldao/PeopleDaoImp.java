package com.tgzzzxweb.impldao;

import com.tgzzzxweb.dao.PeopleDao;
import com.tgzzzxweb.model.People;
import com.tgzzzxweb.util.MysqlConnection;
import org.hibernate.Session;
import com.tgzzzxweb.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import com.tgzzzxweb.model.time;

public class PeopleDaoImp implements PeopleDao{
    private Session session;


    @Override
    public void deletePeople(int id) {
        session = HibernateUtils.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        People people = new People();
        people.setId(id);
        session.delete(people);
        session.getTransaction().commit();
    }

    @Override
    public boolean peoplechek(String phone, String name) {
        boolean flag = false;
        session = HibernateUtils.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List<People> lists = session.createQuery("from People").list();
        int len = lists.size();
        for(int i = 0;i < len;++i)
        {
            People people = lists.get(i);
            String pho = people.getPhone();
            String nam = people.getName();
            if(phone == pho && nam == name){
                flag = true;
                break;
            }
        }
        session.getTransaction().commit();
        return flag;
    }

    @Override
    public List<People> selectAllPeople() {
        session = HibernateUtils.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List<People> peopleList = session.createQuery("from People").list();
        session.getTransaction().commit();
        return peopleList;
    }

    @Override
    public List<People> selectPeopleByDate(String date) {
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date d = null;
            d = format.parse(date);
            java.sql.Date date1 = new java.sql.Date(d.getTime());
            session = HibernateUtils.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            List<People> peopleList = session.createQuery("from People as peo where peo.date = ?").setParameter(0, date1).list();
            session.getTransaction().commit();
            return peopleList;
        }
        catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<People> selectPeopleByedu(String edu) {
        session= HibernateUtils.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List<People> peopleList = session.createQuery("from People as peo where peo.edu = ?").setParameter(0,edu).list();
        session.getTransaction().commit();
        return peopleList;
    }

    @Override
    public List<People> selectPeopleByName(String name) {
        session= HibernateUtils.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List<People> peopleList = session.createQuery("from People as peo where peo.name like ?").setParameter(0,"%" + name + "%").list();
        session.getTransaction().commit();
        return peopleList;
    }

    @Override
    public void updatePeople(People people, String id) {
        session = HibernateUtils.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        People temp = (People) session.get(People.class,Integer.parseInt(id));
        temp.setId(people.getId());
        temp.setAge(people.getAge());
        temp.setBool(people.getBool());
        temp.setCredit(people.getCredit());
        temp.setDate(people.getDate());
        temp.setEdu(people.getEdu());
        temp.setName(people.getName());
        temp.setPhone(people.getPhone());
        temp.setSex(people.getSex());
        temp.setUid(people.getUid());
        temp.setTime(people.getTime());
        temp.setNdate(people.getNdate());
        System.out.println(temp);
        session.update(temp);
        session.getTransaction().commit();
    }

    public People selectStudentByUid(String Uid){
        session = HibernateUtils.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        People vol = (People)session.createQuery("from People as vl where vl.Uid = ?").setParameter(0,Uid).uniqueResult();
        session.getTransaction().commit();
        return vol;
    }

    public boolean studentchek(String Uid) {
        List<People> list = selectAllPeople();
        System.out.println(list);
        for (People temp : list) {
            if (temp.getUid().equals(Uid)) {
                return true;
            }
        }
        return false;
    }

    public void addpeople(People peo) {
        session = HibernateUtils.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Timestamp d = new Timestamp(System.currentTimeMillis());
        peo.setNdate(d);
        session.save(peo);
        session.getTransaction().commit();
    }

    public List<time> order()
    {
        session = HibernateUtils.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        try {
            List<time> times = new ArrayList<>();
            SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
            Calendar calendar = new GregorianCalendar();
            java.util.Date date = sdFormat.parse("2018-08-01");
            //System.out.println(date);
            List<Time> time = new ArrayList<>();
            java.util.Date date1 = null;
            date1 = sdf.parse("08:30:00");
            Time x = new Time(date1.getTime());
            time.add(x);
            date1 = sdf.parse("09:00:00");
            x = new Time(date1.getTime());
            time.add(x);
            date1 = sdf.parse("09:30:00");
            x = new Time(date1.getTime());
            time.add(x);
            date1 = sdf.parse("10:00:00");
            x = new Time(date1.getTime());
            time.add(x);
            date1 = sdf.parse("10:30:00");
            x = new Time(date1.getTime());
            time.add(x);
            date1 = sdf.parse("11:00:00");
            x = new Time(date1.getTime());
            time.add(x);
            for(int i = 0;i <= 45;++i)
            {
                calendar.setTime(date);
                // calendar的time转成java.util.Date格式日期
                java.util.Date utilDate = (java.util.Date)calendar.getTime();
                calendar.add(calendar.DATE, i);
                utilDate = (java.util.Date)calendar.getTime();
                //java.util.Date日期转换成转成java.sql.Date格式
                java.sql.Date newDate =new java.sql.Date(utilDate.getTime());
                for(int j = 0;j < time.size();++j)
                {
                    time tmp = new time();
                    tmp.setDate(newDate);
                    tmp.setTime(time.get(j));
                    //System.out.println(tmp.getDate() + " " + tmp.getTime());
                    List<People> lists = session.createQuery("from People as peo where peo.date = ? and peo.time = ?")
                            .setParameter(0,newDate)
                            .setParameter(1,time.get(j)).list();
                    tmp.setNum(lists.size());
                    System.out.println(tmp);
                    times.add(tmp);
                }
            }
            session.getTransaction().commit();
            return times;
        }
        catch (ParseException ex){
            ex.printStackTrace();
        }
        return null;
    }

    public int jisuanrenshu(java.sql.Date date,Time time)
    {
        session = HibernateUtils.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List<People> lists = session.createQuery("from People as peo where peo.date = ? and peo.time = ?")
                .setParameter(0,date)
                .setParameter(1,time).list();
        session.getTransaction().commit();
        return lists.size();
    }
}
