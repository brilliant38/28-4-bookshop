<!-- 2018-07-25 이응빈 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberService" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			String sessionId = (String)session.getAttribute("sessionId");
		
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));
			
			MemberService memberservice = new MemberService();
			memberservice.insertOrders(memberNo);
			
			response.sendRedirect(request.getContextPath()+"/member/ordersForm.jsp");
		%>
	</body>
</html>