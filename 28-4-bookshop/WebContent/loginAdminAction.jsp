<!-- ��ȣ��, ���ؿ� 2018.7.23 -->
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
			
			if(result.equals("������ �α��� ����")){
				System.out.println("������ �α��� ����");
				session.setAttribute("sessionId", admin.getAdminID());
			}else if(result.equals("������ �α��� ����")){
				System.out.println("������ �α��� ����");
			}
			response.sendRedirect(request.getContextPath()+"/bookList.jsp");
		%>
	</body>
</html>