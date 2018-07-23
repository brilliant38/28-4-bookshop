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
				<th>아이디</th>
				<th>비번</th>
				<th>이름</th>
				<th>주소</th>
				<th>포인트</th>
				<th>날짜</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		<%
			String sessionId = (String)session.getAttribute("sessionId");
		
			MemberService memberservice = new MemberService();
			Member member = memberservice.memberMypage(sessionId);
		%>
		<button type="submit">변경</button>
			<tr>
				<td><%= member.getMemberId() %></td>
				<td><%= member.getMemberPw() %></td>
				<td><%= member.getMemberName() %></td>
				<td><%= member.getMemberAddr() %></td>
				<td><%= member.getMemberPoint() %></td>
				<td><%= member.getMemberDate() %></td>
				<td>
					<a href="<%= request.getContextPath() %>/member/updateMemberForm.jsp">수정</a>
				</td>
				<td>
					<a href="<%= request.getContextPath() %>/member/deleteMemberAction.jsp">삭제</a>
				</td>
			</tr>
		</table>
	</body>
</html>