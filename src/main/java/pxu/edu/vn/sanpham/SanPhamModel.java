package pxu.edu.vn.sanpham;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SanPhamModel {
	static Connection conn = null;

	public SanPhamModel() {

		conn = connnectDB();
	}

	

	public boolean addQuanAo(String Ten_QA, String Size, Double GiaBan, int SoLuong, String MoTa) throws SQLException {
		// Replace the following with your actual database connection parameters
		String jdbcURL = "jdbc:mysql://localhost:3306/db_shopthoitrang";
		String dbUsername = "root";
		String dbPassword = "123456";

		try (Connection con = DriverManager.getConnection(jdbcURL, dbUsername, dbPassword)) {
			String sql = "INSERT INTO quanao (Ten_QA, Size, GiaBan, SoLuong,MoTa) VALUES (?, ?, ?, ?,?)";
			try (PreparedStatement pst = con.prepareStatement(sql)) {
				pst.setString(1, Ten_QA);
				pst.setString(2, Size);
				pst.setDouble(3, GiaBan);
				pst.setInt(4, SoLuong);
				pst.setString(5, MoTa);
				pst.executeUpdate();
				 return true;
			}
			catch (SQLException e) {
		        e.printStackTrace();
		        return false; // Thêm thất bại
		    }
		}
	}
	public boolean updateSanPham(int ID_QA, String Ten_QA, String Size, Double GiaBan, int SoLuong, String MoTa) throws SQLException {
		// Replace the following with your actual database connection parameters
		String jdbcURL = "jdbc:mysql://localhost:3306/db_shopthoitrang";
		String dbUsername = "root";
		String dbPassword = "123456";
			try (Connection con = DriverManager.getConnection(jdbcURL, dbUsername, dbPassword)) {
				String sql = "UPDATE sanpham SET Ten_QA = ?, 2, Size = ?, GiaBan = ?, SoLuong = ?, MoTa = ? WHERE ID_QA = ?";
				try (PreparedStatement pst = con.prepareStatement(sql)) {
					pst.setString(1, Ten_QA);
					pst.setString(2, Size);
					pst.setDouble(3, GiaBan);
					pst.setInt(4, SoLuong);
					pst.setString(5, MoTa);
					pst.executeUpdate();
					 return true;
				}
			}catch (SQLException e) {
		        e.printStackTrace();
		        return false; // Thêm thất bại
		    }
		}
	public void deleteNhaSanXuat(int maNhaSanXuat) throws SQLException {
        // Replace the following with your actual database connection parameters
    	String jdbcURL = "jdbc:mysql://localhost:3306/db_shopthoitrang";
		String dbUsername = "root";
		String dbPassword = "123456";

        try (Connection con = DriverManager.getConnection(jdbcURL, dbUsername, dbPassword)) {
            String sql = "DELETE FROM NhaSanXuat WHERE MaNhaSanXuat = ?";
            try (PreparedStatement pst = con.prepareStatement(sql)) {
                pst.setInt(1, maNhaSanXuat);
                pst.executeUpdate();
            }
        }
    }

	public void deleteQuanAo(int id) throws SQLException {
	    // Replace the following with your actual database connection parameters
	    String jdbcURL = "jdbc:mysql://localhost:3306/db_shopthoitrang";
	    String dbUsername = "root";
	    String dbPassword = "123456";

	    try (Connection con = DriverManager.getConnection(jdbcURL, dbUsername, dbPassword)) {
	        String sql = "DELETE FROM quanao WHERE ID_QA=?";
	        try (PreparedStatement pst = con.prepareStatement(sql)) {
	            pst.setInt(1, id);
	            pst.executeUpdate();
	        }
	    }
	}
	
	private Connection connnectDB() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/db_shopthoitrang";
			String userName = "root";
			String password = "123456";
			Class.forName("com.mysql.jdbc.Driver");
			if (conn == null) {
				conn = DriverManager.getConnection(dbURL, userName, password);
				System.out.println("connect successfully!");
			}
		} catch (Exception ex) {
			System.out.println("connect failure!");
			ex.printStackTrace();
		}
		return conn;
	}
}
