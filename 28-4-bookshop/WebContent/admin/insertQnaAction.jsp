<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insert Qna Action</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			Qna qna = new Qna();
			qna.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
			qna.setQnaTitle(request.getParameter("qnaTitle"));
			qna.setQnaContennt(request.getParameter("qnaContent"));
			
			AdminService adminService = new AdminService();
			adminService.insertQnaService(qna);
			
			response.sendRedirect(request.getContextPath()+"/bookDetail.jsp");
		%>
	</body>
</html>