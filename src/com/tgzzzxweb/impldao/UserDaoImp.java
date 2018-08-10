package com.tgzzzxweb.impldao;

import java.util.List;

import org.hibernate.Session;

import com.tgzzzxweb.dao.UserDao;
import com.tgzzzxweb.model.User;
import com.tgzzzxweb.util.HibernateUtils;
import com.tgzzzxweb.util.MysqlConnection;

import javax.jws.soap.SOAPBinding;

public class UserDaoImp extends MysqlConnection implements UserDao {
	private Session session;

	@Override
	public boolean UserChek(User user) {
		List<User> list = showAllUser();
		for (User temp : list) {
			if (temp.getUserid().equals(user.getUserid()) && temp.getPassword().equals(user.getPassword())) {
				return true;
			}
		}
		return false;
	}

	public boolean UserSimpleChek(User user) {
		List<User> list = showAllUser();
		for (User temp : list) {
			if (temp.getUserid().equals(user.getUserid())) {
				return true;
			}
		}
		return false;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<User> showAllUser() {
		session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		try{
			List<User> list;
        	list = session.createQuery("from User").list();
       	    session.getTransaction().commit();
        	return list;
		}catch (Exception e){
			session.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		}
	}

	public User selectByName(String userid){
	    session = HibernateUtils.getSessionFactory().getCurrentSession();
	    session.getTransaction().begin();
	    try{
	        User user;
	        user = (User)session.createQuery("from User as us where us.userid = ?").setParameter(0,userid).uniqueResult();
	        session.getTransaction().commit();
	        return user;
        }catch (Exception e){
            session.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        }
    }

	@Override
	public void deleteUer(String id) {
		session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		try {
            User temp = new User();
            temp.setUserid(id);
            session.delete(temp);
            session.getTransaction().commit();
        }catch (Exception e){
            session.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        }
	}

	@Override
	public void updateUser(User user, String id) {
		session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		try{
		    User temp = (User) session.get(User.class, id);
		// temp.setId(user.getId());
		    temp.setName(user.getName());
		    temp.setPassword(user.getPassword());
		    temp.setUserid(user.getUserid());
		    temp.setBool(user.getBool());
            session.update(temp);
            session.getTransaction().commit();
        }catch (Exception e){
            session.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        }
	}

	@Override
	public boolean addUser(User user) {
		session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		System.out.println(user);
		try {
            session.save(user);
            session.getTransaction().commit();
            return false;
        }catch (Exception e){
            session.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        }
	}

}
