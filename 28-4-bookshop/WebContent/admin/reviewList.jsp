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
		<h1>å ���� ���</h1>
		<%
			AdminService adminService = new AdminService();
			ArrayList<Review> arrayList = adminService.reviewListService();
			System.out.println(arrayList.size());
		%>
		<table border="1">
			<tr>
				<th>å ����</th>
				<th>�ۼ��ھ��̵�</th>
				<th>���� ����</th>
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
			<a href = "<%=request.getContextPath() %>/admin/insertBookReviewForm.jsp" >�����ۼ�</a>
		</div>
		<br>
		<div>
			<a href = "<%=request.getContextPath() %>/index.jsp" >����ȭ��</a>
		</div>
	</body>
</html>