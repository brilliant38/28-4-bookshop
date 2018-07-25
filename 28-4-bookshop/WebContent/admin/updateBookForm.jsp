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
					<th>책 번호</th>
					<td>
						<input type="text" name="bookNo" value="<%=Integer.parseInt(request.getParameter("bookNo"))%>" readonly>
					</td>
				<tr>
				<tr>
					<th>도서코드</th>
					<td><select name="bookCode">
							<option value="<%=bookInfo.getBook().getBookCodeNo() %>" >도서코드 변경불가</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>출판사</th>
					<td><select name="publisher">
							<option value="<%=bookInfo.getBook().getPublisherNo() %>">출판사명 변경불가</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>도서명</th>
					<td>
						<input type="text" name="bookName" value="<%=bookInfo.getBook().getBookName() %>">
					</td>
				</tr>
				<tr>
					<th>저자</th>
					<td><input type="text" name="bookAuthor" value="<%=bookInfo.getBook().getBookAuthor() %>"></td>
				</tr>
				<tr>
					<th>도서가격</th>
					<td><input type="text" name="bookPrice" value="<%=bookInfo.getBook().getBookPrice() %>"></td>
				</tr>
				<tr>
					<th>도서포인트</th>
					<td><input type="text" name="bookPoint" value="<%=bookInfo.getBook().getBookPoint() %>"></td>
				</tr>
				<tr>
					<th>도서수량</th>
					<td><input type="text" name="bookAmount" value="<%=bookInfo.getBook().getBookAmount() %>"></td>
				</tr>
				<tr>
					<th>도서절판</th>
					<td><select name="bookOut">
							<option>판매중</option>
							<option>절판</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>도서정보수정</th>
					<td><input type="submit" value="도서정보수정"></td>
				</tr>
			</table>
		</form>
	</body>
</html>