<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="pxu.edu.vn.dao.*"
	import="pxu.edu.vn.sanpham.SanPham"
	import="pxu.edu.vn.sanpham.SanPhamModel" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	public StudentController() { super(); myView = new StudentView();
	myModel = new StudentModel(); }
	<%
//Lay du lieu tu form

String Ten_QA = (String) request.getParameter("tensp");
String Size = (String) request.getParameter("size");
double GiaBan = Double.parseDouble(request.getParameter("giaban"));
int SoLuong = Integer.parseInt(request.getParameter("soluong"));
String MoTa = (String) request.getParameter("mota");
//out.println(Ten_QA + "; " + Size + "; " + GiaBan + "; " + SoLuong + "; " + MoTa);
//Goi StudentModel de luu doi tuong sv vao CSDL
SanPham sp = new SanPham();
sp.setTen_QA(Ten_QA);
sp.setSize(Size);
sp.setGiaBan(GiaBan);
sp.setSoLuong(SoLuong);
sp.setMoTa(MoTa);

// lấy kết nối csdl 
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
	//out.println(dbServer + "; " + dbAddress + "; " + dbPort + "; " + database + "; " + username + "; " + password + "; "
	//+ dbDriver)
	;
	SanPhamModel model = new SanPhamModel();

	boolean kq = model.addQuanAo(Ten_QA, Size, GiaBan, SoLuong, MoTa);

	if (kq) {
		request.setAttribute("message", "Thêm Sản Phẩm Thành Công");
	} else {
		request.setAttribute("message", "Thêm Sản Phẩm Thất Bại");
	}
	RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
	if (dispatcher != null) {
		dispatcher.forward(request, response);

	}
}
%>





</body>
</html>