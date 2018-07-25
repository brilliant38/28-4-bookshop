<!-- 2018-07-23 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberService" %>
<%@ page import="service.ShoppingCart" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>��ٱ���</h1>
		<table border="1">
			<tr>
				<th>å ��ȣ</th>
				<th>����</th>
				<th>����</th>
				<th>����īƮ�� ���� ��¥</th>
				<th>����</th>
			</tr>
			<%
				String sessionId = (String)session.getAttribute("sessionId");
			
				MemberService memberservice = new MemberService();
				ArrayList<ShoppingCart> list = memberservice.selectShoppingCart(sessionId);
				
				int shoppingcartNo = 0;
				int bookNo = 0;
				int memberNo = 0;
				int shoppingcartAmount = 0;
				int shoppingcartPrice = 0;
				String shoppingcartDate = "0";
				int sum = 0;
				
				if(list != null) {
					for(int i=0; i<list.size(); i++) {
						ShoppingCart shoppingCart = list.get(i);
						shoppingcartNo = shoppingCart.getShoppingcartNo();
						bookNo = shoppingCart.getBookNo();
						memberNo = shoppingCart.getMemberNo();
						shoppingcartAmount = shoppingCart.getShoppingcartAmount();
						shoppingcartPrice = shoppingCart.getShoppingcartPrice();
						shoppingcartDate = shoppingCart.getShoppingcartDate();
						sum += shoppingcartPrice;
			%>
						<tr>
							<td><%= bookNo %></td>
							<td>
								<div>
									<form action="<%= request.getContextPath() %>/member/updateShoppingCartAmount.jsp?shoppingcartNo=<%= shoppingcartNo %>&bookNo=<%= bookNo%>" method="post">
										<input type="text" name="shoppingcartAmount" value="<%= shoppingcartAmount %>" size="1">
										<button type="submit">����</button>
									</form>
								</div>
							</td>
							<td><%= shoppingcartPrice %>��</td>
							<td><%= shoppingcartDate %></td>
							<td>
								<a href="<%= request.getContextPath() %>/member/deleteShoppingCartAction.jsp?shoppingcartNo=<%= shoppingcartNo %>">����</a>
							</td>
						</tr>
			<%
				}
			%>
					<tr>
						<td>�� ��ǰ����</td>
						<td colspan="5" align="center"><%= sum %>��</td>
					</tr>
			<%
			}
			%>
		</table>
		<br>
		<div><a href="<%= request.getContextPath() %>/member/insertOrders.jsp?memberNo=<%= memberNo %>"><img src = "<%= request.getContextPath() %>/img/order.png"></a> <a href="<%= request.getContextPath() %>/member/bookList.jsp"><img src = "<%= request.getContextPath() %>/img/shopping.png"></a></div>
	</body>
</html>