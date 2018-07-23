<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberService" %>
<%@ page import="service.MemberInter" %>
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
			String[] inter = request.getParameterValues("inter");
			int memberPoint = Integer.parseInt(request.getParameter("memberPoint"));
			
			Member member = new Member();
			member.setMemberId(memberId);
			member.setMemberPw(memberPw);
			member.setMemberName(memberName);
			member.setMemberAddr(memberAddr);
			member.setMemberPoint(memberPoint);
			
			MemberInter memberinter = new MemberInter();
			memberinter.setBookcodeNo(Integer.parseInt(inter[0]));
			System.out.println(memberinter.getBookcodeNo()+ "북코드넘버");
			
			
			MemberService memberservice = new MemberService();
			int checkId = memberservice.insertMember(member);
			
			if(checkId==0) {
				response.sendRedirect(request.getContextPath()+"/member/insertMemberFail.jsp");
			}
		%>
	</body>
</html>