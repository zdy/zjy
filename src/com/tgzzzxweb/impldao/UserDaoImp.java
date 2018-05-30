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
		session.beginTransaction();
		List<User> list;
        list = session.createQuery("from User").list();
        session.getTransaction().commit();
        return list;
	}

	public User selectByName(String userid){
	    session = HibernateUtils.getSessionFactory().getCurrentSession();
	    session.beginTransaction();
	    User user;
	    user = (User)session.createQuery("from User as us where us.userid = ?").setParameter(0,userid).uniqueResult();
	    session.getTransaction().commit();
	    return user;
    }

	@Override
	public void deleteUer(String id) {
		session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		User temp = new User();
		temp.setUserid(id);
		session.delete(temp);
		session.getTransaction().commit();
	}

	@Override
	public void updateUser(User user, String id) {
		session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		User temp = (User) session.get(User.class, id);
		// temp.setId(user.getId());
		temp.setName(user.getName());
		temp.setPassword(user.getPassword());
		temp.setUserid(user.getUserid());
		temp.setBool(user.getBool());
		session.update(temp);
		session.getTransaction().commit();
	}

	@Override
	public boolean addUser(User user) {
		session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		System.out.println(user);
		session.save(user);
		session.getTransaction().commit();
		return false;
	}

}
