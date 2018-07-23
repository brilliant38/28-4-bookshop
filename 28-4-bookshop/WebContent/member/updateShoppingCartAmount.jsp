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
			int shoppingcartNo = Integer.parseInt(request.getParameter("shoppingcartNo"));
			int shoppingcartAmount = Integer.parseInt(request.getParameter("shoppingcartAmount"));
		
			MemberService memberservice = new MemberService();
			memberservice.updateShoppingCartAmount(shoppingcartNo, shoppingcartAmount);
		%>
		
		response.sendRedirect(request.getContextPath()+"/shoppingCart.jsp");
	</body>
</html>