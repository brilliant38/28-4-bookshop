<!-- 2018-07-24 이응빈 -->
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
			int shoppingcartNo = Integer.parseInt(request.getParameter("shoppingcartNo"));
			
			MemberService memberservice = new MemberService();
			memberservice.deleteShoppingCart(shoppingcartNo);
			
			response.sendRedirect(request.getContextPath()+"/member/shoppingCartList.jsp");
		%>
	</body>
</html>