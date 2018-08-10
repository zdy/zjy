package com.tgzzzxweb.impldao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.Date;
import java.util.List;

import com.tgzzzxweb.dao.StudentDao;
import com.tgzzzxweb.model.People;
import com.tgzzzxweb.model.volunteer;
import com.tgzzzxweb.util.MysqlConnection;
import org.hibernate.Session;
import com.tgzzzxweb.util.*;

public class StudentDaoImp implements StudentDao {
    private Session session;
    private MysqlConnection myConnection = new MysqlConnection();
    private Connection conn = null;
	@Override
	public void addStudent(volunteer volunteer) {
		session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
        Timestamp d = new Timestamp(System.currentTimeMillis());
        volunteer.setDate(d);
        try {
            session.save(volunteer);
            session.getTransaction().commit();
        }
        catch (Exception e){
            session.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        }
	}

	@Override
	public void deleteStudent(String name,int id ,String path) {
		/*PreparedStatement ps = null;
		conn = myConnection.getConnction();
		String sql = "select Vpicture from volunteers where Vname=?";
		//System.out.println("0");
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			while (rs.next()) {
				String url = rs.getString(1);
				File file = new File(path+url);
				file.delete();
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		System.out.println("1");
		session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		volunteer vol = new volunteer();
		vol.setId(id);
		try {
            session.delete(vol);
            session.getTransaction().commit();
        }
        catch (Exception e){
            session.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        }
	}

	@Override
	public List<volunteer> selectStudentByName(String name) {
		session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		try {
            List<volunteer> volunteerList = session.createQuery("from volunteer as vol where vol.name like ?").setParameter(0, "%" + name + "%").list();
            session.getTransaction().commit();
            return volunteerList;
        }catch (Exception e){
            session.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        }
	}

	public volunteer selectStudentByUid(String Uid){
	    session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
	    System.out.println(Uid);
	    try{
	        volunteer vol = (volunteer)session.createQuery("from volunteer as vl where vl.Uid = ?").setParameter(0,Uid).uniqueResult();
	        session.getTransaction().commit();
	        return vol;
        }catch (Exception e){
            session.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        }
    }

	@Override
	public List<volunteer> selectAllStudent() {
	    session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
        try {
            List<volunteer> volunteerList = session.createQuery("from volunteer").list();
            session.getTransaction().commit();
            return volunteerList;
        }catch (Exception e){
            session.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        }
	}

	@Override
	public void updateStudent(volunteer vol,String id) {
		SimpleDateFormat f = new SimpleDateFormat("yyyy");
		session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		volunteer temp = (volunteer) session.get(volunteer.class,Integer.parseInt(id));
		temp.setPicture(vol.getPicture());
		temp.setAddress(vol.getAddress());
		temp.setAge(vol.getAge());
		temp.setDate(vol.getDate());
		temp.setId(vol.getId());
		temp.setMotto(vol.getMotto());
		temp.setName(vol.getName());
		temp.setNotes(vol.getNotes());
		temp.setPhone(vol.getPhone());
		temp.setSex(vol.getSex());
		temp.setYear(vol.getYear());
		temp.setUid(vol.getUid());
		Timestamp d = new Timestamp(System.currentTimeMillis());
		temp.setDate(d);
		System.out.println(temp);
		try{
		    session.update(temp);
		    session.getTransaction().commit();
        }catch (Exception e){
            session.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        }
	}

	public String selectStudentImg(String name) {
		String path = null;
		session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		try{
		    volunteer vol = (volunteer) session.createQuery("from volunteer as vol where vol.name = ?").setParameter(0,name).uniqueResult();
		    path = vol.getPicture();
		    session.getTransaction().commit();
		    return path;
        }catch (Exception e){
            session.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        }
	}

	@Override
	public boolean studentchek(String Uid) {
		List<volunteer> list = selectAllStudent();
        for (volunteer temp : list) {
            if (temp.getUid().equals(Uid)) {
                return true;
            }
        }
        return false;
	}

	public void deleteFile(String path, String name) {
		PreparedStatement ps = null;
		conn = myConnection.getConnction();
		String sql = "select Vpicture from volunteers where Vname=?";
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			while (rs.next()) {
				String url = rs.getString(1);
				File file = new File(path + url);
				file.delete();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void uploadFile(String fileFileName, String root, File file) {
		fileFileName = "/" + fileFileName;
		File saveFile = new File(root, fileFileName);
		InputStream in;
		OutputStream os;
		try {
			in = new FileInputStream(file);
			os = new FileOutputStream(saveFile);// 保存文件到本地
			byte[] bytes = new byte[512];
			int len = 0;
			while ((len = in.read(bytes)) != -1) {// 写入文件到本地
				os.write(bytes, 0, len);
			}
			os.close();
			in.close();
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
