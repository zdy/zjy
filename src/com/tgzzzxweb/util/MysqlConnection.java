package com.tgzzzxweb.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MysqlConnection {
	private static String URL = "jdbc:mysql://localhost:3306/tgzzzx";
	private static String USER = "root";
	private static String PASSWORD = "13835472854";
	private static Connection conn = null;

	public MysqlConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	public Connection getConnction() {
		try {
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
}
