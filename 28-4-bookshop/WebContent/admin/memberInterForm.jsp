<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Member Inter Form</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));
			AdminService adminService = new AdminService();
			ArrayList<BookCode> arraylist = adminService.selectMemberInter(memberNo);
					
		%>
		<h1>회원관심장르</h1>
		<table border="1">
			<tr>
				<th>장르명<th>
			</tr>
		<%
			for(int i=0;i<arraylist.size();i++) {
		%>
				<tr>
					<td><%=arraylist.get(i).getBookCodeName() %><td>
				</tr>
		<%
			}
		%>
		</table>
		<br>
		<div>
			<a href = "<%=request.getContextPath() %>/admin/memberList.jsp" >회원목록화면</a>
		</div>
	</body>
</html>