<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Delete Book Action</title>
	</head>
	<body>
		<%
			AdminService adminService = new AdminService();
			adminService.deleteBook(Integer.parseInt(request.getParameter("bookNo")));
			
			response.sendRedirect(request.getContextPath()+"/bookList.jsp");
		%>
	</body>
</html>