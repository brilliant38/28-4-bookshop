<!-- 김호순, 김준영 2018.7.23 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>loginAdminAction</title>
	</head>
	<body>
		<%
			Admin admin = new Admin();
			admin.setAdminID(request.getParameter("adminId"));
			admin.setAdminPw(request.getParameter("adminPw"));
				
			PublicAdminService publicAdminService = new PublicAdminService();
			String result = publicAdminService.loginAdmin(admin);
			
			if(result.equals("관리자 로그인 성공")){
				System.out.println("관리자 로그인 성공");
				session.setAttribute("sessionId", admin.getAdminID());
			}else if(result.equals("관리자 로그인 실패")){
				System.out.println("관리자 로그인 실패");
			}
			response.sendRedirect(request.getContextPath()+"/bookList.jsp");
		%>
	</body>
</html>