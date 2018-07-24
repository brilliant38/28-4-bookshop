<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Administrator Index</title>
	</head>
	<body>
		<h1>관리자 메인화면</h1>
		<div>
			<a href ="<%=request.getContextPath() %>/admin/memberList.jsp" >회원목록</a>
		</div>
		<div>
			<a href ="<%=request.getContextPath() %>/ordersList.jsp" >주문목록</a>
		</div>
		<div>
			<a href ="<%=request.getContextPath() %>/loginForm.jsp" >로그인</a>
		</div>
		<div>
			<a href ="<%=request.getContextPath() %>/logout.jsp" >로그아웃</a>
		</div>
		<div>
			<a href ="<%=request.getContextPath() %>/bookList.jsp" >도서목록</a>
		</div>
		<div>
			<a href ="<%=request.getContextPath() %>/admin/insertBookForm.jsp" >판매도서추가</a>
		</div>
	</body>
</html>