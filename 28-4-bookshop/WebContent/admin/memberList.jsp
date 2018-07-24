<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Member List</title>
	</head>
	<body>
		<%
			AdminService adminService = new AdminService();
			ArrayList<Member> arraylist = adminService.memberList();
			
		%>
		<h1>회원 목록</h1>
		<form>
			<table border="1">
				<tr>
					<th>회원번호</th>
					<th>회원아이디</th>
					<th>회원이름</th>
					<th>회원주소</th>
					<th>회원점수</th>
					<th>회원관심장르</th>
					<th>가입일자</th>
					<th>회원강제탈퇴</th>
				</tr>
		<%
			for(int i=0; i<arraylist.size(); i++) {
		%>
				<tr>
					<td><%=arraylist.get(i).getMemberNo() %></td>
					<td><%=arraylist.get(i).getMemberId() %></td>
					<td><%=arraylist.get(i).getMemberName() %></td>
					<td><%=arraylist.get(i).getMemberAddr() %></td>
					<td><%=arraylist.get(i).getMemberPoint() %></td>
					<td><a href="<%=request.getContextPath()%>/admin/memberInterForm.jsp?memberNo=<%=arraylist.get(i).getMemberNo() %>">회원관심장르</a></td>
					<td><%=arraylist.get(i).getMemberDate() %></td>
					<td><a href = "<%=request.getContextPath()%>/admin/deleteMemberAction.jsp?memberNo=<%=arraylist.get(i).getMemberNo() %>">회원강제탈퇴</a>
				</tr>
		<%
			}
		%>
			</table>
		</form>
		<br>
		<div>
			<a href = "<%=request.getContextPath() %>/member/insertMemberForm.jsp" >회원가입</a>
		</div>
		<br>
		<div>
			<a href = "<%=request.getContextPath() %>/admin/adminIndex.jsp" >메인화면</a>
		</div>
	</body>
</html>