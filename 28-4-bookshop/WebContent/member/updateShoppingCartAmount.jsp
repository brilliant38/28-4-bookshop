<!-- 2018-07-23 ������ -->
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
			int shoppingcartAmount = Integer.parseInt(request.getParameter("shoppingcartAmount"));
			int bookNo = Integer.parseInt(request.getParameter("bookNo"));
		
			MemberService memberservice = new MemberService();
			memberservice.updateShoppingCartAmount(shoppingcartNo, shoppingcartAmount, bookNo);
			
			response.sendRedirect(request.getContextPath()+"/member/shoppingCartList.jsp");
		%>
	</body>
</html>