<!-- 김호순 2018.7.24 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ordersList</title>
	</head>
	<body>
		<h1><a href="<%=request.getContextPath()%>/ordersList.jsp">주문 리스트</a></h1>
		<form>
			<table>
				<tr>
					<td>도서 번호</td>
					<td>회원 번호</td>
					<td>주문 수량</td>
					<td>주문 가격</td>
					<td>주문 일자</td>
					<td>주문 받는 주소</td>
					<td>주문 상태</td>
				</tr>
			</table>
		</form>
	</body>
</html>