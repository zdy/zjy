package com.tgzzzxweb.dao;

import com.tgzzzxweb.model.webconcept;

import java.util.List;

public interface ConceptDao {
	public webconcept showallconcept();
	public void updateConcept(webconcept concept, int id);
}
