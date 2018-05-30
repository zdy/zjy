package com.tgzzzxweb.action;

import java.util.List;
import com.tgzzzxweb.BaseAction;
import com.tgzzzxweb.util.HibernateUtils;
import com.tgzzzxweb.util.MysqlConnection;
import com.tgzzzxweb.model.User;
import com.tgzzzxweb.dao.UserDao;
import com.tgzzzxweb.server.UserServer;
import com.tgzzzxweb.serverimp.UserServerImp;

public class indexAction extends BaseAction{
        private UserServer userServer = new UserServerImp();
        private User user = new User();

        public String userlogin(){
            user.setUserid((String)request.getParameter("Userid"));
            user.setPassword((String)request.getParameter("Password"));
            System.out.println(user.getUserid());
            if(userServer.UserChek(user)){
                System.out.println(user.getUserid());
                user = userServer.selectByName(user.getUserid());
                System.out.println(user);
                session.setAttribute("name",user.getName());
                session.setAttribute("bool",user.getBool());
                session.setAttribute("userid",user.getUserid());
                return SUCCESS;
            }
            else{
                request.setAttribute("uerror","该用户名或密码错误");
                return "Failed";
            }
        }
        public String exit(){
            System.out.println("exit");
            session.removeAttribute("name");
            session.removeAttribute("bool");
            session.removeAttribute("userid");
            session.removeAttribute("people");
            session.removeAttribute("volunteer");
            System.out.println(request.getAttribute("name"));
            System.out.println(session.getAttribute("volunteer"));
            return SUCCESS;
        }
        public String userregister(){
           if(userServer.UserSimpleChek(user)){
               request.setAttribute("rerror","注册用户已存在,请重新注册");
               return "Failed";
           }
           if(userServer.addUser(user)){
               session.setAttribute("name",user.getName());
               session.setAttribute("bool",user.getBool());
               session.setAttribute("userid",user.getUserid());
               return SUCCESS;
           }
           return "Error";
        }
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
