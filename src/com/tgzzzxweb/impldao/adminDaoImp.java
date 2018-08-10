package com.tgzzzxweb.impldao;

import java.util.List;

import com.tgzzzxweb.dao.AdminDao;
import com.tgzzzxweb.model.User;
import org.hibernate.Session;

import com.tgzzzxweb.dao.UserDao;
import com.tgzzzxweb.model.admin;
import com.tgzzzxweb.util.HibernateUtils;
import com.tgzzzxweb.util.MysqlConnection;
public class adminDaoImp implements AdminDao{
    private Session session;
    public boolean adminChek(admin ad)
    {
        List<admin> list = showAlladmin();
        for (admin temp : list) {
            if (temp.getAid().equals(ad.getAid()) && temp.getPassword().equals(ad.getPassword())) {
                return true;
            }
        }
        return false;
    }
    public List<admin> showAlladmin()// 显示所有管理
    {
        session = HibernateUtils.getSessionFactory().getCurrentSession();
        session.getTransaction().begin();
        try {
            List<admin> list = session.createQuery("FROM admin").list();
            session.getTransaction().commit();
            return list;
        }catch (Exception e){
            session.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        }
    }
}
