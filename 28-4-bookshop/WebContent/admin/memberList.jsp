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
		<h1>ȸ�� ���</h1>
		<form>
			<table border="1">
				<tr>
					<th>ȸ����ȣ</th>
					<th>ȸ�����̵�</th>
					<th>ȸ���̸�</th>
					<th>ȸ���ּ�</th>
					<th>ȸ������</th>
					<th>ȸ�������帣</th>
					<th>��������</th>
					<th>ȸ������Ż��</th>
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
					<td><a href="<%=request.getContextPath()%>/admin/memberInterForm.jsp?memberNo=<%=arraylist.get(i).getMemberNo() %>">ȸ�������帣</a></td>
					<td><%=arraylist.get(i).getMemberDate() %></td>
					<td><a href = "<%=request.getContextPath()%>/admin/deleteMemberAction.jsp?memberNo=<%=arraylist.get(i).getMemberNo() %>">ȸ������Ż��</a>
				</tr>
		<%
			}
		%>
			</table>
		</form>
		<br>
		<div>
			<a href = "<%=request.getContextPath() %>/member/insertMemberForm.jsp" >ȸ������</a>
		</div>
		<br>
		<div>
			<a href = "<%=request.getContextPath() %>/admin/adminIndex.jsp" >����ȭ��</a>
		</div>
	</body>
</html>