<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Book Action</title>
	</head>
	<body>
		<%
			AdminService adminService = new AdminService();
			BookInfo bookInfo = new BookInfo();
			Book book = new Book();
			book.setBookCodeNo(Integer.parseInt(request.getParameter("bookCode")));
			book.setPublisherNo(Integer.parseInt(request.getParameter("publisher")));
			book.setBookName(request.getParameter("bookName"));
			book.setBookAuthor(request.getParameter("bookAuthor"));
			book.setBookPrice(Integer.parseInt(request.getParameter("bookPrice")));
			book.setBookPoint(Integer.parseInt(request.getParameter("bookPoint")));
			book.setBookAmount(Integer.parseInt(request.getParameter("bookAmount")));
			book.setBookOut(request.getParameter("bookOut"));
			
			adminService.updateBook(bookInfo);
			
			response.sendRedirect(request.getContextPath() + "/bookList.jsp");
		%>
	</body>
</html>