<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String u = (String)request.getParameter("username");
	String p = (String)request.getParameter("password");
	if(u.equals("admin") && p.equals("1234")){
		session.setAttribute("user", u);
		response.sendRedirect("../login/admin.jsp");
	}else{
		request.setAttribute("message", "SAI USERNAME va MAT KHAU");
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		if (dispatcher != null) {
			dispatcher.forward(request, response);
		}
	}
	%>
</body>
</html>