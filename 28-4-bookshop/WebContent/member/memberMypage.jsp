<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberService" %>
<%@ page import="service.Member" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<table>
			<tr>
				<th>���̵�</th>
				<th>���</th>
				<th>�̸�</th>
				<th>�ּ�</th>
				<th>����Ʈ</th>
				<th>��¥</th>
				<th>����</th>
				<th>����</th>
			</tr>
		<%
			String sessionId = (String)session.getAttribute("sessionId");
		
			MemberService memberservice = new MemberService();
			Member member = memberservice.memberMypage(sessionId);
		%>
		<button type="submit">����</button>
			<tr>
				<td><%= member.getMemberId() %></td>
				<td><%= member.getMemberPw() %></td>
				<td><%= member.getMemberName() %></td>
				<td><%= member.getMemberAddr() %></td>
				<td><%= member.getMemberPoint() %></td>
				<td><%= member.getMemberDate() %></td>
				<td>
					<a href="<%= request.getContextPath() %>/member/updateMemberForm.jsp">����</a>
				</td>
				<td>
					<a href="<%= request.getContextPath() %>/member/deleteMemberAction.jsp">����</a>
				</td>
			</tr>
		</table>
	</body>
</html>