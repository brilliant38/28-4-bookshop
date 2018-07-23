<!-- 김호순, 김준영 2018.7.23 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>loginAction</title>
	</head>
	<body>
		<%
			Member member = new Member();
			member.setMemberId(request.getParameter("memberId"));
			member.setMemberPw(request.getParameter("memberPw"));
			
			PublicMemberService publicMemberService = new PublicMemberService();
			String result = publicMemberService.loginMember(member);
			
			if(result.equals("로그인 성공")){
				System.out.println("로그인 성공");
				session.setAttribute("sessionId", member.getMemberId());
			}else if(result.equals("로그인 실패")){
				System.out.println("로그인 실패");
			}
			response.sendRedirect(request.getContextPath()+"/ex.jsp");
		%>
	</body>
</html>