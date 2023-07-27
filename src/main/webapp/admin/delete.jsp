<%@page import="pxu.edu.vn.dao.DBConnection"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="pxu.edu.vn.sanpham.*"%>
<%@ page import="pxu.edu.vn.sanpham.SanPhamModel"%>
<%@ page import="pxu.edu.vn.dao.DBConnection"%>
<%
if (DBConnection.dbConnection == null) {
	//Chua co ket noi toi CSDL nen phai khoi tao
	String dbServer = application.getInitParameter("dbServer");
	String dbAddress = application.getInitParameter("dbAddress");
	String dbPort = application.getInitParameter("dbPort");
	String database = application.getInitParameter("database");
	String username = application.getInitParameter("username");
	String password = application.getInitParameter("password");
	String dbDriver = application.getInitParameter("dbDriver");
	DBConnection conn = new DBConnection(dbServer, dbAddress, dbPort, database, username, password, dbDriver);
	//out.println(dbServer + "; " +dbAddress + "; " + dbPort + "; " +database+ "; " + username+ "; " + password);

}

PreparedStatement pstmt = null;
int idsp = Integer.parseInt(request.getParameter("idsp"));
System.out.print(idsp);
try {
	pstmt = DBConnection.dbConnection.prepareStatement("DELETE FROM quanao WHERE ID_QA = ?");
	pstmt.setInt(1, idsp);
	pstmt.executeUpdate();

	out.print("BẠN ĐÃ XOÁ THÀNH CÔNG");
} catch (Exception e) {
	e.printStackTrace();
	out.print("BẠN ĐÃ XOÁ THẤT BẠI");
} finally {
	try {
		if (pstmt != null)
	pstmt.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}

}  
%>