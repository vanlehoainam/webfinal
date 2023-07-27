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
String Ten_QA = request.getParameter("Ten_QA");
String Size = request.getParameter("Size");
Double GiaBan = Double.parseDouble(request.getParameter("GiaBan"));
int SoLuong = Integer.parseInt(request.getParameter("SoLuong"));
String MoTa = request.getParameter("MoTa");

try {
	pstmt = DBConnection.dbConnection.prepareStatement("UPDATE quanao SET Ten_QA = ?, Size = ?, GiaBan = ?, SoLuong = ?, MoTa = ? WHERE ID_QA = ?");
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


/* private void editSanPham(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    int ID_QA = Integer.parseInt(request.getParameter("ID_QA"));
    String Ten_QA = request.getParameter("Ten_QA");
    String Size = request.getParameter("Size");
    Double GiaBan = Double.parseDouble(request.getParameter("GiaBan"));
    int SoLuong = Integer.parseInt(request.getParameter("SoLuong"));
    String MoTa = request.getParameter("MoTa");

    try {
        sanPhamModel.updateQuanAoByID(ID_QA, Ten_QA, Size, GiaBan, SoLuong, MoTa);
        response.sendRedirect("sanpham?action=list");
    } catch (SQLException e) {
        e.printStackTrace();
        request.setAttribute("message", "Lỗi: Không thể cập nhật sản phẩm");
        RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
        dispatcher.forward(request, response);
    }
} */


/* public void updateQuanAoByID(int ID_QA, String Ten_QA, String Size, Double GiaBan, int SoLuong, String MoTa) throws SQLException {
    // Replace the following with your actual database connection parameters
    String jdbcURL = "jdbc:mysql://localhost:3306/db_shopthoitrang";
    String dbUsername = "root";
    String dbPassword = "123456";

    try (Connection con = DriverManager.getConnection(jdbcURL, dbUsername, dbPassword)) {
        String sql = "UPDATE quanao SET Ten_QA = ?, Size = ?, GiaBan = ?, SoLuong = ?, MoTa = ? WHERE ID_QA = ?";
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
} */
%>