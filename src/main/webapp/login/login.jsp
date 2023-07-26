<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="../css/login.css">
<body>
	 <%@ include file="../template/header.jsp" %>
	<%
	String msg = (String) request.getAttribute("message");
	if (msg != null) {
		out.print(msg);
	}
	%>
	<form action="LoginController.jsp" method="POST">
		<h1 style="text-align: center "> Đăng Nhập </h1>	
		Username: <input type="text" name="username"><br>
		Password: <input type="password" name="password"><br> <input
			type="submit" value="LOGIN">
	</form>
	<%@ include file="../template/footer.jsp" %>
</body>
</html>