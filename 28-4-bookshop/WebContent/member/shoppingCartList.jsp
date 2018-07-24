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
		<table border="1">
				<tr>
					<th>책 번호</th>
					<th>회원 번호</th>
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
			
			if(list != null) {
				for(int i=0; i<list.size(); i++) {
					ShoppingCart shoppingCart = list.get(i);
					shoppingcartNo = shoppingCart.getShoppingcartNo();
					bookNo = shoppingCart.getBookNo();
					memberNo = shoppingCart.getMemberNo();
					shoppingcartAmount = shoppingCart.getShoppingcartAmount();
					shoppingcartPrice = shoppingCart.getShoppingcartPrice();
					shoppingcartDate = shoppingCart.getShoppingcartDate();
		%>
					<tr>
						<td><%= shoppingCart.getShoppingcartNo() %></td>
						<td><%= memberNo %></td>
						<td>
							<div>
								<input type="text" name="shoppingcartAmount" value="<%= shoppingcartAmount %>">
								<a href="<%= request.getContextPath() %>/member/updateShoppingCartAmount.jsp?shoppingcartAmount=<%= shoppingcartAmount %>&shoppingcartNo=<%= shoppingcartNo %>"><button type="submit">변경</button></a>
							</div>
						</td>
						<td><%= shoppingcartPrice %></td>
						<td><%= shoppingcartDate %></td>
						<td>
							<a href="<%= request.getContextPath() %>/member/deleteShoppingCartAction.jsp?shoppingcartNo=<%= shoppingcartNo %>">삭제</a>
						</td>
					</tr>	
		<%
				}
			}
		%>
		</table>
	</body>
</html>