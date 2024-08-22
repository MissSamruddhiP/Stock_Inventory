package com.connection1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcConnection1 {
static Connection con;
public static Connection getConnection1 () throws ClassNotFoundException {
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3307/java_project","root","root");
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
			return con;
			
}
}
