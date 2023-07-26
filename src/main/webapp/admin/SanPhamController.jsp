<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="pxu.edu.vn.dao.*"
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
	String user = (String) session.getAttribute("usser");
	if (user == null) {
		request.setAttribute("message", "chua dang nhap ");
		RequestDispatcher dispatcher = request.getRequestDispatcher("../loginmvc/login.jsp");
	}

	//Lay du lieu tu form

	String Ten_QA = (String) request.getParameter("Ten_QA");
	String Size = (String) request.getParameter("Size");
	String GiaBan = (String) request.getParameter("GiaBan");;
	int SoLuong = Integer.parseInt(request.getParameter("SoLuong"));
	String MoTa = (String) request.getParameter("MoTa");
	String anhSP = (String) request.getParameter("anhSP");
	//out.println(Ten_QA + "; " + Size + "; " + GiaBan + "; " + SoLuong + "; " + MoTa + "; " + anhSP);
	//Goi StudentModel de luu doi tuong sv vao CSDL
	SanPham sp = new SanPham();
	sp.setTen_QA(Ten_QA);
	sp.setSize(Size);
	sp.setGiaBan(GiaBan);
	sp.setSoLuong(SoLuong);
	sp.setMoTa(MoTa);
	sp.setAnhSP(anhSP);



	
	%>
</body>
</html>