<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Review List</title>
	</head>
	<body>
		<h1>책 리뷰 목록</h1>
		<%
			AdminService adminService = new AdminService();
			ArrayList<Review> arrayList = adminService.reviewListService();
			System.out.println(arrayList.size());
		%>
		<table border="1">
			<tr>
				<th>책 제목</th>
				<th>작성자아이디</th>
				<th>리뷰 내용</th>
			</tr>
		<%
			for(int i=0; i<arrayList.size(); i++) {
		%>
			<tr>
				<td><%=arrayList.get(i).getBook().getBookName() %></td>
				<td><%=arrayList.get(i).getMember().getMemberId() %></td>
				<td><%=arrayList.get(i).getBookReview().get(i).getBookReviewContent() %></td>
			</tr>
		<%
			}
		%>
		</table>
		<br>
		<div>
			<a href = "<%=request.getContextPath() %>/admin/insertBookReviewForm.jsp" >리뷰작성</a>
		</div>
		<br>
		<div>
			<a href = "<%=request.getContextPath() %>/index.jsp" >메인화면</a>
		</div>
	</body>
</html>