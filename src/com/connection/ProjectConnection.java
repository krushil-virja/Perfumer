package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ProjectConnection {
	
public static Connection getConnection(){
		
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/perfumer","root","" );
		} catch (Exception e) {
			// TODO: handle exception
		}
		return con;
	}
	
}
 