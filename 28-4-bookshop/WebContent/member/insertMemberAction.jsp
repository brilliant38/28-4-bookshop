<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberService" %>
<%@ page import="service.MemberInter" %>
<%@ page import="service.Member" %>
<%@ page import="java.util.ArrayList" %>
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
			String[] bookCodeInter = request.getParameterValues("inter");
			int memberPoint = Integer.parseInt(request.getParameter("memberPoint"));
			
			Member member = new Member();
			member.setMemberId(memberId);
			member.setMemberPw(memberPw);
			member.setMemberName(memberName);
			member.setMemberAddr(memberAddr);
			member.setMemberPoint(memberPoint);
			
			ArrayList<MemberInter> memberInterList = new ArrayList<MemberInter>();
			
			
			int countForMemberInter = 0; 
			if(bookCodeInter != null){
				countForMemberInter = bookCodeInter.length;
			}
		
			for(int i = 0; i < countForMemberInter; i++){
				MemberInter memberInter = new MemberInter();
				
				memberInter.setBookcodeNo(Integer.parseInt(bookCodeInter[i]));
			
				memberInterList.add(memberInter);
			}
	
			MemberService memberservice = new MemberService();
			int checkId = memberservice.insertMember(member, memberInterList);
			
			if(checkId==0) {
				response.sendRedirect(request.getContextPath()+"/member/insertMemberFail.jsp");
			}
		%>
	</body>
</html>