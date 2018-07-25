<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Index</title>
	</head>
	<body>
		<h1>인터넷도서판매점</h1>
		<table border="1">
			<tr>
				<td><a href="<%=request.getContextPath()%>/member/loginForm.jsp">일반사용자용 로그인</a></td>
				<td><a href="<%=request.getContextPath()%>/admin/loginForm.jsp">관리자용 로그인</a></td>
			</tr>
		</table>
	</body>
</html>