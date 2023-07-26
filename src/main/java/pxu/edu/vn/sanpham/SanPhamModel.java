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

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/db_shopthoitrang", "root", "123456");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public List<SanPham> getAllQuanAo() throws SQLException {
		List<SanPham> quanaoList = new ArrayList<>();
		PreparedStatement pst = conn.prepareStatement("SELECT * FROM quanao");
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			SanPham sp = new SanPham();
			sp.setID_QA(rs.getInt("ID_QA"));
			sp.setTen_QA(rs.getString("Ten_QA"));
			sp.setSize(rs.getString("Size"));
			sp.setGiaBan(rs.getDouble("GiaBan"));
			sp.setSoLuong(rs.getInt("SoLuong"));
			sp.setMoTa(rs.getString("MoTa"));
			quanaoList.add(sp);
		}
		rs.close();
		pst.close();
		return quanaoList;
	}

	public void insertQuanAo(String Ten_QA, String Size, Double GiaBan, int SoLuong, String MoTa) throws SQLException {
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
			}
		}
	}

	public void updateQuanAo(int ID_QA, String Ten_QA, String Size, Double GiaBan, int SoLuong, String MoTa)
			throws SQLException {
		// Replace the following with your actual database connection parameters
		String jdbcURL = "jdbc:mysql://localhost:3306/db_shopthoitrang";
		String dbUsername = "root";
		String dbPassword = "123456";

		try (Connection con = DriverManager.getConnection(jdbcURL, dbUsername, dbPassword)) {
			String sql = "UPDATE quanao SET Ten_QA = ?, Size = ?, GiaBan = ?, SoLuong = ?,MoTa=?  WHERE ID_QA = ?";
			try (PreparedStatement pst = con.prepareStatement(sql)) {
				pst.setString(1, Ten_QA);
				pst.setString(2, Size);
				pst.setDouble(3, GiaBan);
				pst.setInt(4, SoLuong);
				pst.setString(5, MoTa);
				pst.setInt(6, ID_QA);
				pst.executeUpdate();
			}
		}
	}

	// Helper method to delete data from the database
	public void deleteQuanAo(int ID_QA) throws SQLException {
		// Replace the following with your actual database connection parameters
		String jdbcURL = "jdbc:mysql://localhost:3306/db_shopthoitrang";
		String dbUsername = "root";
		String dbPassword = "123456";

		try (Connection con = DriverManager.getConnection(jdbcURL, dbUsername, dbPassword)) {
			String sql = "DELETE FROM aoquan WHEREID_QA = ?";
			try (PreparedStatement pst = con.prepareStatement(sql)) {
				pst.setInt(1, ID_QA);
				pst.executeUpdate();
			}
		}
	}

}
