package com.tgzzzxweb.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.tgzzzxweb.util.HibernateUtils;

public class HibernateListener implements ServletContextListener {

    public void contextDestroyed(ServletContextEvent arg0) {
        HibernateUtils.getSessionFactory().close();
    }

    public void contextInitialized(ServletContextEvent arg0) {

    }

}
