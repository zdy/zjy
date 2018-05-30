package com.tgzzzxweb.serverimp;
import com.tgzzzxweb.dao.AdminDao;
import com.tgzzzxweb.impldao.adminDaoImp;
import com.tgzzzxweb.model.admin;
import com.tgzzzxweb.server.adminServer;

import java.util.List;

public class adminServerImp implements adminServer{
    private final AdminDao admin = new adminDaoImp();
    public boolean adminChek(admin ad)
    {
        return admin.adminChek(ad);
    }
    public List<admin> showAlladmin()// 显示所有管理
    {
        return admin.showAlladmin();
    }
}
