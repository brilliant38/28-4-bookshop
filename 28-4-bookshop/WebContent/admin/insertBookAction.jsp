<!-- 구해성,이광재 2018.07.23 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Book Action</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			
			AdminService adminService = new AdminService();
			BookInfo bookInfo = new BookInfo();
			BookCode bookCode = new BookCode(); 
			Publisher publisher = new Publisher();
			Book book = new Book();
			
			bookInfo.setBook(book);
			bookInfo.setBookCode(bookCode);
			bookInfo.setPublisher(publisher);
			
			bookCode.setBookCodeNo(Integer.parseInt(request.getParameter("bookCode")));
			publisher.setPublisherNo(Integer.parseInt(request.getParameter("publisher")));
			book.setBookName(request.getParameter("bookName"));
			book.setBookAuthor(request.getParameter("bookAuthor"));
			book.setBookPrice(Integer.parseInt(request.getParameter("bookPrice")));
			book.setBookPoint(Integer.parseInt(request.getParameter("bookPoint")));
			book.setBookAmount(Integer.parseInt(request.getParameter("bookAmount")));
			book.setBookOut(request.getParameter("bookOut"));
			
			adminService.insertBook(bookInfo);
			
			response.sendRedirect(request.getContextPath()+"/bookList.jsp");

		%>
	</body>
</html>