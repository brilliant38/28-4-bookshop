<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberService" %>
<%@ page import="service.Member" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Member</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
		
			String memberId = request.getParameter("memberId");
			String memberPw = request.getParameter("memberPw");
			String memberName = request.getParameter("memberName");
			String memberAddr = request.getParameter("memberAddr");
			int memberPoint = Integer.parseInt(request.getParameter("memberPoint"));
			
			Member member = new Member();
			member.setMemberId(memberId);
			member.setMemberPw(memberPw);
			member.setMemberName(memberName);
			member.setMemberAddr(memberAddr);
			member.setMemberPoint(memberPoint);
			
			MemberService memberservice = new MemberService();
			memberservice.insertMember(member);
		%>
	</body>
</html>