<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberService" %>
<%@ page import="service.Member" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
			<%
				String sessionId = session.getAttribute("sessionId");
				
				MemberService memberservice = new MemberService();
				Member member = memberservice.updateFormMember(sessionId);
			%>
		<form action="<%= request.getContextPath() %>/member/updateMemberAction.jsp" method="post">
			���̵� : <input type="text" name="memberId" value=<%= member.getMemberId() %> readonly="readonly"><br>
			��й�ȣ : <input type="password" name="memberPw"><br>
			�̸� : <input type="text" name="memberName" value=<%= member.getMemberName() %>><br>
			�ּ� : <input type="text" name="memberAddr" value=<%= member.getMemberAddr() %>><br>
			<input type="submit" value="����">
		</form>
	</body>	
</html>