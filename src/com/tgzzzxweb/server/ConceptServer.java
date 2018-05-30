package com.tgzzzxweb.server;

import com.tgzzzxweb.model.webconcept;

import java.util.List;

public interface ConceptServer {
	public webconcept showallconcept();
	public void updateConcept(webconcept concept, int id);
}
