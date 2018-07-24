<!-- 2018-07-23 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberService" %>
<%@ page import="service.ShoppingCart" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			String sessionId = (String)session.getAttribute("sessionId");
		
			MemberService memberservice = new MemberService();
			ShoppingCart shoppingCart = memberservice.selectShoppingCart(sessionId);
			
			int shoppingcartNo = 0;
			int bookNo = 0;
			int memberNo = 0;
			int shoppingcartAmount = 0;
			int shoppingcartPrice = 0;
			String shoppingcartDate = "0";
			
			if(shoppingCart != null) {
				shoppingcartNo = shoppingCart.getShoppingcartNo();
				bookNo = shoppingCart.getBookNo();
				memberNo = shoppingCart.getMemberNo();
				shoppingcartAmount = shoppingCart.getShoppingcartAmount();
				shoppingcartPrice = shoppingCart.getShoppingcartPrice();
				shoppingcartDate = shoppingCart.getShoppingcartDate();
			}
		%>
		<table>
			<tr>
				<th>å ��ȣ</th>
				<th>ȸ�� ��ȣ</th>
				<th>����</th>
				<th>����</th>
				<th>����īƮ�� ���� ��¥</th>
				<th>����</th>
			</tr>
			
			<tr>
				<td><%= bookNo %></td>
				<td><%= memberNo %></td>
				<td>
					<div>
						<input type="text" name="shoppingcartAmount" value="<%= shoppingcartAmount %>">
						<a href="<%= request.getContextPath() %>/updateShoppingCartAmount.jsp?shoppingcartAmount=<%= shoppingcartAmount %>&shoppingcartNo=<%= shoppingcartNo %>"><button type="submit">����</button></a>
					</div>
				</td>
				<td><%= shoppingcartPrice %></td>
				<td><%= shoppingcartDate %></td>
				<td>
					<a href="<%= request.getContextPath() %>/member/deleteShoppingCartAction.jsp?shoppingcartNo=<%= shoppingcartNo %>">����</a>
				</td>
			</tr>
		</table>
	</body>
</html>