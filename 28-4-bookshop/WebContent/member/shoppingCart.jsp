<!-- 2018-07-23 이응빈 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberService" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			
			String sessionId = (String)session.getAttribute("sessionId");
		
			int bookNo = Integer.parseInt(request.getParameter("bookNo"));
			
			MemberService memberservice = new MemberService();
			int login = memberservice.insertShoppingCart(bookNo, sessionId);
			
			if(login == 1) {
				response.sendRedirect(request.getContextPath()+"/member/shoppingCartList.jsp");
			} else {
				response.sendRedirect(request.getContextPath()+"/member/loginForm.jsp");
			}
		%>
	</body>
</html>