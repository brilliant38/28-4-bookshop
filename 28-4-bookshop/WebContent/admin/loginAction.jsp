<!-- ��ȣ��, ���ؿ� 2018.7.23 -->
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
				System.out.println("�α��� ����");
				response.sendRedirect(request.getContextPath()+"/admin/adminIndex.jsp");
			} else if (login == 0){
				System.out.println("�α����� �����߽��ϴ�. �ٽ� �Է����ֽʽÿ�.");
				response.sendRedirect(request.getContextPath()+"/admin/loginForm.jsp");
			}
			
			

		%>
	</body>
</html>