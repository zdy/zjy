package com.tgzzzxweb.serverimp;

import com.tgzzzxweb.dao.ConceptDao;
import com.tgzzzxweb.impldao.ConceptDaoImp;
import com.tgzzzxweb.model.webconcept;
import com.tgzzzxweb.server.ConceptServer;

import java.util.List;

public class ConceptServerImp implements ConceptServer {
	private final ConceptDao dao = new ConceptDaoImp();
	public webconcept showallconcept()
	{
		return dao.showallconcept();
	}
	public void updateConcept(webconcept concept, int id)
	{
		dao.updateConcept(concept,id);
	}

}
