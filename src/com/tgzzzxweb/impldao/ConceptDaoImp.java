package com.tgzzzxweb.impldao;

import com.tgzzzxweb.dao.ConceptDao;
import com.tgzzzxweb.model.webconcept;
import com.tgzzzxweb.util.HibernateUtils;
import com.tgzzzxweb.util.MysqlConnection;
import org.hibernate.Session;

import java.util.List;

public class ConceptDaoImp extends MysqlConnection implements ConceptDao{
	private Session session;

	@SuppressWarnings("unchecked")
	@Override
	public webconcept showallconcept(){
		session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		try {
			webconcept concept;
			concept = (webconcept) session.createQuery("from webconcept").uniqueResult();
			session.getTransaction().commit();
			return concept;
		}catch (Exception e){
			session.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateConcept(webconcept concept, int id) {
		session = HibernateUtils.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		try {
            webconcept temp = (webconcept) session.get(webconcept.class, id);
            temp.setStart(concept.getStart());
            temp.setWcontinue(concept.getWcontinue());
            temp.setWreturn(concept.getWreturn());
            temp.setIntroduction(concept.getIntroduction());
            session.update(temp);
            session.getTransaction().commit();
        }catch (Exception e){
            session.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        }
	}


}
