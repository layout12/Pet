package com.spring.edu;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class oracleConnectionTest {

	private static final String DRIVER="oracle.jdbc.driver.OracleDriver";
	private static final String URL="jdbc:oracle:thin:@localhost:1521:orcl";
	private static final String USER="hr";
	private static final String PW="hr";
	
	@Test
	public void testConnection()throws Exception {
		Class.forName(DRIVER);
		try {
			Connection con = DriverManager.getConnection(URL, USER, PW);
			System.out.println(con);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}	
}
