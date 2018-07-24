<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Delete Member Action</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			AdminService adminService = new AdminService();
			adminService.deleteMemberService(Integer.parseInt(request.getParameter("memberNo")));
			
			response.sendRedirect(request.getContextPath()+"/admin/memberList.jsp");
		%>
	</body>
</html>