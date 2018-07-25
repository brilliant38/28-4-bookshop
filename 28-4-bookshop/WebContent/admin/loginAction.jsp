<!-- 김호순, 김준영 2018.7.23 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>loginAction</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			Admin admin = new Admin();
			admin.setAdminID(request.getParameter("memberId"));
			admin.setAdminPw(request.getParameter("memberPw"));
			
			AdminService adminService = new AdminService();
			int login = adminService.loginAdminService(admin);
			
			if (login == 1) {
				System.out.println("로그인 성공");
				response.sendRedirect(request.getContextPath()+"/admin/adminIndex.jsp");
			} else if (login == 0){
				System.out.println("로그인이 실패했습니다. 다시 입력해주십시오.");
				response.sendRedirect(request.getContextPath()+"/admin/loginForm.jsp");
			}
			
			

		%>
	</body>
</html>