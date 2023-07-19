<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="pxu.edu.vn.dao.DBConnection"
    import="pxu.edu.vn.sanpham.SanPham"
    import="pxu.edu.vn.sanpham.SanPhamModel"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String user = (String)session.getAttribute("usser");
	if (user == null){
		request.setAttribute("message", "chua dang nhap ");
		RequestDispatcher dispatcher = request.getRequestDispatcher("../loginmvc/login.jsp");
	}
	
	
	//Lay du lieu tu form
	String Ten_QA = (String) request.getParameter("Ten_QA");
	String Size = (String) request.getParameter("Size");
	//int GiaBan = Integer.parseInt(request.getParameter("GiaBan"));
	//int SoLuong = Integer.parseInt(request.getParameter("SoLuong"));
	String MoTa = (String) request.getParameter("MoTa");
	String anhSP = (String) request.getParameter("anhSP");
	String Is_Alive = (String) request.getParameter("Is_Alive");
	//out.println(hoten + "; " + ngaysinh.toString() + "; " + gioitinh + "; " + sdt);
	//Goi StudentModel de luu doi tuong sv vao CSDL
	SanPham sp = new SanPham();
	sp.setTen_QA(Ten_QA);
	sp.setSize(Size);
	//sp.setGiaBan(GiaBan);
	//sp.setSoLuong(SoLuong);
	sp.setMoTa(MoTa);
	sp.setAnhSP(anhSP);
	sp.setIs_Alive(Is_Alive);
	
	// lấy kết nối csdl 
	if (DBConnection.getDbConnection()==null){
		// chua co ket noi den csdl
		String dbServer = application.getInitParameter("dbServer");
		String dbAddress = application.getInitParameter("dbAddress");
		String dbPort = application.getInitParameter("dbPort");
		String database = application.getInitParameter("database");
		String username = application.getInitParameter("username");
		String password = application.getInitParameter("password");
		String dbDriver = application.getInitParameter("dbDriver");
		DBConnection conn = new DBConnection  (dbServer,dbAddress,database,username,password,dbDriver);
		
		}
	else {
		//chi can su dung 
	}
	SanPhamModel myModel = new SanPhamModel();
	boolean kq = myModel.addStudent(sp,DBConnection.dbConnection);
	if (kq) {
		request.setAttribute("message", "THÊM SẢN PHẨM THÀNH CÔNG");
	} else {
		request.setAttribute("message", "THÊM SẢN PHẨM THẤT BẠI");
	}
	RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
	if (dispatcher != null) {
		dispatcher.forward(request, response);
	}
		
	%>
</body>
</html>