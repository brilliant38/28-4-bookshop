<!-- 2018-07-23 ������ -->
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
			
			MemberService memberservice = new MemberService();
			memberservice.deleteMember(sessionId);
		%>
	</body>
</html>