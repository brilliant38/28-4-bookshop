<!-- ��ȣ�� 2018.7.24 -->
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
		<h1><a href="<%=request.getContextPath()%>/ordersList.jsp">�ֹ� ����Ʈ</a></h1>
		<table border = "1">
			<tr>
				<td>���� ��ȣ</td>
				<td>ȸ�� ��ȣ</td>
				<td>�ֹ� ����</td>
				<td>�ֹ� ����</td>
				<td>�ֹ� ����</td>
				<td>�ֹ� �޴� �ּ�</td>
				<td>�ֹ� ����</td>
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