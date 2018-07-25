<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Book Form</title>
	</head>
	<body>
		<%
			
			AdminService adminService = new AdminService();
			BookInfo bookInfo = adminService.updateFormBook(Integer.parseInt(request.getParameter("bookNo")));
			
		%>
		<form action="<%=request.getContextPath() %>/admin/updateBookAction.jsp" method="post">
			<table border="1">
				<tr>
					<th>å ��ȣ</th>
					<td>
						<input type="text" name="bookNo" value="<%=Integer.parseInt(request.getParameter("bookNo"))%>" readonly>
					</td>
				<tr>
				<tr>
					<th>�����ڵ�</th>
					<td><select name="bookCode">
							<option value="<%=bookInfo.getBook().getBookCodeNo() %>" >�����ڵ� ����Ұ�</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>���ǻ�</th>
					<td><select name="publisher">
							<option value="<%=bookInfo.getBook().getPublisherNo() %>">���ǻ�� ����Ұ�</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>������</th>
					<td>
						<input type="text" name="bookName" value="<%=bookInfo.getBook().getBookName() %>">
					</td>
				</tr>
				<tr>
					<th>����</th>
					<td><input type="text" name="bookAuthor" value="<%=bookInfo.getBook().getBookAuthor() %>"></td>
				</tr>
				<tr>
					<th>��������</th>
					<td><input type="text" name="bookPrice" value="<%=bookInfo.getBook().getBookPrice() %>"></td>
				</tr>
				<tr>
					<th>��������Ʈ</th>
					<td><input type="text" name="bookPoint" value="<%=bookInfo.getBook().getBookPoint() %>"></td>
				</tr>
				<tr>
					<th>��������</th>
					<td><input type="text" name="bookAmount" value="<%=bookInfo.getBook().getBookAmount() %>"></td>
				</tr>
				<tr>
					<th>��������</th>
					<td><select name="bookOut">
							<option>�Ǹ���</option>
							<option>����</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>������������</th>
					<td><input type="submit" value="������������"></td>
				</tr>
			</table>
		</form>
	</body>
</html>