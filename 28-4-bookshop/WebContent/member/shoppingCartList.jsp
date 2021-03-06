<!-- 2018-07-23 이응빈 -->
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
		<h1>장바구니</h1>
		<table border="1">
			<tr>
				<th>책 번호</th>
				<th>수량</th>
				<th>가격</th>
				<th>쇼핑카트에 담은 날짜</th>
				<th>삭제</th>
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
										<button type="submit">변경</button>
									</form>
								</div>
							</td>
							<td><%= shoppingcartPrice %>원</td>
							<td><%= shoppingcartDate %></td>
							<td>
								<a href="<%= request.getContextPath() %>/member/deleteShoppingCartAction.jsp?shoppingcartNo=<%= shoppingcartNo %>">삭제</a>
							</td>
						</tr>
			<%
				}
			%>
					<tr>
						<td>총 상품가격</td>
						<td colspan="5" align="center"><%= sum %>원</td>
					</tr>
			<%
			}
			%>
		</table>
		<br>
		<div><a href="<%= request.getContextPath() %>/member/insertOrders.jsp?memberNo=<%= memberNo %>"><img src = "<%= request.getContextPath() %>/img/order.png"></a> <a href="<%= request.getContextPath() %>/member/bookList.jsp"><img src = "<%= request.getContextPath() %>/img/shopping.png"></a></div>
	</body>
</html>