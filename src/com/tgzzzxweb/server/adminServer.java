package com.tgzzzxweb.server;

import com.tgzzzxweb.model.admin;

import java.util.List;

public interface adminServer {
    boolean adminChek(admin ad);
    List<admin> showAlladmin();// 显示所有管理
}
