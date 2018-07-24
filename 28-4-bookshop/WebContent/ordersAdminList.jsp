<!-- 김호순 2018.7.24 -->
<%@page import="java.util.*"%>
<%@page import="service.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ordersAdminList</title>
	</head>
	<body>
	<body>
		<h1><a href="<%=request.getContextPath()%>/ordersList.jsp">주문 리스트</a></h1>
		<table border = "1">
			<tr>
				<td>도서 번호</td>
				<td>회원 번호</td>
				<td>주문 수량</td>
				<td>주문 가격</td>
				<td>주문 일자</td>
				<td>주문 받는 주소</td>
				<td>주문 상태</td>
			</tr>
			<%
				PublicService publicService = new PublicService();
				
				ArrayList<Orders> ordersList = publicService.ordersList();
				System.out.println(ordersList+"<<<list");
				
				for(int i=0; i<ordersList.size(); i++){
					Orders orders = ordersList.get(i);
					System.out.println(orders.getBookNo() + " <---orders.getBookNo()");
			%>
			<tr>
				<td><%=orders.getBookNo() %></td>
				<td><%=orders.getMemberNo() %></td>
				<td><%=orders.getOrdersAmount() %></td>
				<td><%=orders.getOrdersPrice() %></td>
				<td><%=orders.getOrdersDate() %></td>
				<td><%=orders.getOrdersAddr() %></td>
				<td><%=orders.getOrdersState() %></td>
			</tr>
			<%
				}
			%>
		</table>
	</body>
</html>