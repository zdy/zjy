package com.tgzzzxweb.action;

import com.tgzzzxweb.BaseAction;
import com.tgzzzxweb.model.User;
import com.tgzzzxweb.model.volunteer;
import com.tgzzzxweb.model.People;
import com.tgzzzxweb.server.UserServer;
import com.tgzzzxweb.server.StudentServet;
import com.tgzzzxweb.server.PeopleServer;
import com.tgzzzxweb.serverimp.UserServerImp;
import com.tgzzzxweb.serverimp.StudentServerImp;
import com.tgzzzxweb.serverimp.PeopleServerImp;
import com.tgzzzxweb.model.time;
import com.tgzzzxweb.util.FileUtil;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.util.List;

public class personalAction extends BaseAction{
       //在这里放的类在request里面都会有，像request.getAttribute("people")
        //从表单往这里传值，就要往vol里，而不是volunteer
        //如果对类里的参数没有set，get方法，那么这里将收不到前台发过来的值
        private UserServer userServer = new UserServerImp();
        private User user = new User();
        private StudentServet volunteerServer = new StudentServerImp();
        private volunteer vol = new volunteer();
        private PeopleServer peopleServer = new PeopleServerImp();
        private People peo = new People();
        private FileUtil fileUtil = new FileUtil();
        // file上传
        public File file; // 上传文件内容保存到此临时文件中
        public String fileFileContenttype;
        private String fileFileName;

        public String vgerenjilu()
        {
            if(session.getAttribute("volunteer") != null)
                session.removeAttribute("volunteer");
            if(volunteerServer.studentchek((String) session.getAttribute("userid"))){
                vol = volunteerServer.selectStudentByUid((String) session.getAttribute("userid"));
                session.setAttribute("volunteer",vol);
                System.out.println(vol);
            }
            return "vgeren";
        }

        public String pgerenjilu()
        {
            System.out.println((String)session.getAttribute("userid"));
            if(session.getAttribute("people") != null)
                session.removeAttribute("people");
            if(peopleServer.studentchek((String)session.getAttribute("userid"))) {
                peo = peopleServer.selectPeopleByUid((String) session.getAttribute("userid"));
                session.setAttribute("people", peo);
                System.out.println(peo);
                System.out.println("1");
            }
            return "pgeren";
        }

        public String addvolunteer()
        {
            System.out.println(vol);
            System.out.println(file);
            System.out.println(fileFileName);
            if (fileFileName != null) {
                    String root = ServletActionContext.getServletContext().getRealPath("/upload");
                    File create = new File(root);
                    fileUtil.createFile(create);// 文件夹不存在则创建
                    volunteerServer.uploadFile(fileFileName, file, root);
                    vol.setPicture("/upload/" + fileFileName);
                    System.out.println(fileFileName);
                    System.out.println(vol.getPicture());
            }
            volunteerServer.addStudent(vol);
            return "vaddsuccess";
        }

        public String addpeople()
        {
            System.out.println(peo);
            if(peopleServer.jisuanrenshu(peo.getDate(),peo.getTime()) == 8){
                request.setAttribute("error","预约时间人数已满");
                return "padderror";
            }
            peopleServer.addpeople(peo);
            return "paddsuccess";
        }
        public String vjudge()
        {
            if(volunteerServer.studentchek((String) session.getAttribute("userid"))){
                request.setAttribute("vcunzai",1);
            }
            return "vadd";
        }

        public String pjudge()
        {
            if(peopleServer.studentchek((String)session.getAttribute("userid"))){
                request.setAttribute("pcunzai",1);
            }
            return "padd";
        }

        public String modifyvolunteer()
        {
            System.out.println("3");
            System.out.println(vol);
            System.out.println("0");
            System.out.println(fileFileName);
            System.out.println(file);
            if (fileFileName == null || (volunteerServer.selectStudentImg(vol.getName()) != null && volunteerServer.selectStudentImg(vol.getName()).equals(fileFileName))) {
                System.out.println(fileFileName);
                fileFileName = volunteerServer.selectStudentImg(vol.getName());
                System.out.println(fileFileName);
                vol.setPicture(fileFileName);
                volunteerServer.updateStudent(vol, request.getParameter("vol.id"));
                return "vsuccess";
            }
            System.out.println("1");
            String root = ServletActionContext.getServletContext().getRealPath("/upload");
            volunteerServer.uploadFile(fileFileName, file, root);
            vol.setPicture("/upload/" + fileFileName);
            root = ServletActionContext.getServletContext().getRealPath("");
            volunteerServer.deletefile(root, vol.getName());
            System.out.println("0");
            volunteerServer.updateStudent(vol, request.getParameter("vol.id"));
            return "vsuccess";
        }

        public String uppeople()
        {
            System.out.println(peo);
            People x = (People) session.getAttribute("people");
            if(peopleServer.jisuanrenshu(peo.getDate(),peo.getTime()) == 8 && (peo.getDate() != x.getDate() || (peo.getDate() == x.getDate() && peo.getTime() != x.getTime()))){
                request.setAttribute("error","预约时间人数已满");
                return "uperror";
            }
            peopleServer.updatePeople(peo,request.getParameter("peo.id"));
            return "psuccess";
        }

        public String editxinxi()
        {
            user = userServer.selectByName((String) session.getAttribute("userid"));
            String oldpassword = request.getParameter("oldpassword");
            user.setPassword(oldpassword);
            if(!userServer.UserChek(user)){
                request.setAttribute("error","旧密码错误");
                return "error";
            }
            String newpassword = request.getParameter("newpassword");
            user.setPassword(newpassword);
            userServer.updateUser(user,user.getUserid());
            return "edit";
        }

        public String order()
        {
            List<time> lists =  peopleServer.order();
            System.out.println(lists);
            request.setAttribute("lists",lists);
            return "order";
        }

        public String showallvol()
        {
            List<volunteer> lists = volunteerServer.selectAllStudent();
            request.setAttribute("lists",lists);
            return "showallvol";
        }
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public volunteer getVol() {
        return vol;
    }

    public void setVol(volunteer vol) {
        this.vol = vol;
    }

    public People getPeo() {
        return peo;
    }

    public void setPeo(People peo) {
        this.peo = peo;
    }

    public File getFile() {
        return file;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public String getFileFileContenttype() {
        return fileFileContenttype;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public void setFileFileContenttype(String fileFileContenttype) {
        this.fileFileContenttype = fileFileContenttype;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }
}
