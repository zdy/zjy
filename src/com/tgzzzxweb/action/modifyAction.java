package com.tgzzzxweb.action;

import com.tgzzzxweb.BaseAction;
import com.tgzzzxweb.model.webconcept;
import com.tgzzzxweb.model.honor;
import com.tgzzzxweb.server.ConceptServer;
import com.tgzzzxweb.serverimp.ConceptServerImp;

public class modifyAction extends BaseAction{
    public String container;
    public webconcept web = new webconcept();
    public ConceptServer dao = new ConceptServerImp();

     public String shoudai()
     {
         System.out.println("2");
         String content = container;
         /*System.out.println(content);*/
         if(content != null){
             request.setAttribute("content",content);
             web = dao.showallconcept();
             web.setStart(content);
             dao.updateConcept(web,1);
         }
         return SUCCESS;
     }
     public String xudai()
     {
         String content = container;
         /*System.out.println(content);*/
         if(content != null){
             request.setAttribute("content",content);
             web = dao.showallconcept();
             web.setWcontinue(content);
             dao.updateConcept(web,1);
         }
         return SUCCESS;
     }

     public String huankuan()
     {
         String content = container;
         System.out.println(content);
         if(content != null){
             request.setAttribute("content",content);
             web = dao.showallconcept();
             web.setWreturn(content);
             dao.updateConcept(web,1);
         }
         return SUCCESS;
     }

     public String showshoudai()
     {
         web = dao.showallconcept();
         request.setAttribute("shoudai",web.getStart());
         //System.out.println(web.getStart());
         return "showshoudai";
     }

     public String showxudai()
     {
         web = dao.showallconcept();
         request.setAttribute("xudai",web.getWcontinue());
         //System.out.println(web.getWcontinue());
         return "showxudai";
     }

     public String showhuankuan()
     {
        web = dao.showallconcept();
        request.setAttribute("huankuan",web.getWreturn());
        //System.out.println(web.getWreturn());
         return "showhuankuan";
     }

    public String ishowshoudai()
    {
        web = dao.showallconcept();
        request.setAttribute("shoudai",web.getStart());
        //System.out.println(web.getStart());
        return "ishowshoudai";
    }

    public String ishowxudai()
    {
        web = dao.showallconcept();
        request.setAttribute("xudai",web.getWcontinue());
        //System.out.println(web.getWcontinue());
        return "ishowxudai";
    }

    public String ishowhuankuan()
    {
        web = dao.showallconcept();
        request.setAttribute("huankuan",web.getWreturn());
        //System.out.println(web.getWreturn());
        return "ishowhuankuan";
    }

    public String getContainer() {
        return container;
    }

    public void setContainer(String container) {
        this.container = container;
    }

    public void setWeb(webconcept web) {
        this.web = web;
    }

    public webconcept getWeb() {
        return web;
    }
}
