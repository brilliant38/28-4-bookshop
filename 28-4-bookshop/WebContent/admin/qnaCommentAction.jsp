<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>qna Comment Action</title>
	</head>
	<body>
	<%
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		int adminNo =	Integer.parseInt(request.getParameter("adminNo"));
		String commentContent = request.getParameter("commentContent");
		AdminService adminService = new AdminService();
		QnaComment qnaComment = new QnaComment();
		qnaComment.setQnaNo(qnaNo);		
		qnaComment.setAdminNo(adminNo);
		qnaComment.setCommentContent(commentContent);
		adminService.insertQnaComment(qnaComment);
		
		response.sendRedirect(request.getContextPath() + "/book.Detail.jsp");
		
		
	%>
	
	</body>
</html>