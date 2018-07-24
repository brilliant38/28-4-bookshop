<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Book Review Action</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			
			BookReview bookReview = new BookReview();
			bookReview.setBookNo(Integer.parseInt(request.getParameter("bookNo")));
			bookReview.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
			bookReview.setBookReviewContent(request.getParameter("bookReviewContent"));
			
			AdminService adminService = new AdminService();
			adminService.insertReviewService(bookReview);
			
			response.sendRedirect(request.getContextPath()+"/bookDetail.jsp");
		%>
	</body>
</html>