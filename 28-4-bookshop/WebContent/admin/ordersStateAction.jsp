<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>orders State Action</title>
	</head>
	<body>
		<%
			AdminService adminService = new AdminService();
			adminService.updateOrdersState(request.getParameter("state"));
			
			response.sendRedirect(request.getContextPath() + "/ordersList.jsp");
		%>
	</body>
</html>