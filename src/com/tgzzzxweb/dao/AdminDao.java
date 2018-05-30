package com.tgzzzxweb.dao;

import java.util.List;

import com.tgzzzxweb.model.admin;

public interface AdminDao {
        boolean adminChek(admin ad);
        List<admin> showAlladmin();// 显示所有管理
    }
