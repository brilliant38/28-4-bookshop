<!-- ��ȣ��, ���ؿ� 2018.7.23 -->
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
			
			if(result.equals("�α��� ����")){
				System.out.println("�α��� ����");
				session.setAttribute("sessionId", member.getMemberId());
			}else if(result.equals("�α��� ����")){
				System.out.println("�α��� ����");
			}
			response.sendRedirect(request.getContextPath()+"/ex.jsp");
		%>
	</body>
</html>