package pxu.edu.vn.dao;

import java.security.PublicKey;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection dbConnection;

	public DBConnection() {

	}

	public DBConnection(String dbServer, String dbAddress, String dbPort, String database, String username,
			String password) {

		String dbURL = "jdbc: Mysql:// " + dbAddress + ":" + dbPort + "/" + database + "/" + dbServer;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			if (dbConnection == null) {
				dbConnection = DriverManager.getConnection(dbURL, username, password);
				System.out.println("connect successfully!");
			}
		} catch (ClassNotFoundException | SQLException e) {
			dbConnection = null;
		}
	}

	public static Connection getDbConnection() {
		return dbConnection;
	}
}
