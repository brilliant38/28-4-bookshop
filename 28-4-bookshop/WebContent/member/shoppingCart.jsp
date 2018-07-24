<!-- 2018-07-23 이응빈 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberService" %>
<%@ page import="service.Book" %>
<%@ page import="service.Member" %>
<%@ page import="service.ShoppingCart" %>
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
		
			Book book = request.getParameter("Book");
			int bookNo = book.getBookNo();
			int bookAmount = book.getBookAmount();
			int bookPrice = book.getBookAmount();
			
			ShoppingCart shoppingCart = new ShoppingCart();
			shoppingCart.setBookNo(bookNo);
			shoppingCart.setShoppingcartAmount(bookAmount);
			shoppingCart.setShoppingcartPrice(bookPrice);
			
			MemberService memberservice = new MemberService();
			memberservice.insertShoppingCart(shoppingCart, sessionId);
			
			response.sendRedirect(request.getContextPath()+"/shoppingCartList.jsp");
		%>
	</body>
</html>