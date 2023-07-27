<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="pxu.edu.vn.dao.*"
    import="pxu.edu.vn.sanpham.SanPham"
    import="pxu.edu.vn.sanpham.SanPhamModel"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Convert String to Float - JSP</title>
</head>
<% 	String dbServer = application.getInitParameter("dbServer");
String dbAddress = application.getInitParameter("dbAddress");
String dbPort = application.getInitParameter("dbPort");
String database = application.getInitParameter("database");
String username = application.getInitParameter("username");
String password = application.getInitParameter("password");
String dbDriver = application.getInitParameter("dbDriver");
DBConnection conn = new DBConnection(dbServer, dbAddress, dbPort, database,
										username, password, dbDriver);
out.println(dbServer + "; " +dbAddress + "; " + dbPort + "; " +database+ "; " + username+ "; " + password);
		%>
</body>
</html>