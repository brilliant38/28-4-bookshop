<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Book Review Form</title>
	</head>
	<body>
		<h1>���� �ۼ�</h1>
		<%
			if(session.getAttribute("sessionId") == null) {
		%>
				<div>
					<a href = "<%=request.getContextPath() + "/member/loginForm.jsp" %>">�α���</a>
				</div>
		<%
			}
		%>
		
		<%
			request.setCharacterEncoding("euc-kr");
			
			AdminService adminService = new AdminService();
			int memberNo = adminService.selectMemberNoService((String)session.getAttribute("sessionId"));
			if(session.getAttribute("sessionId") == null){
				response.sendRedirect(request.getContextPath() + "/member/loginForm.jsp");
			}
			
		%>
		<form action="<%=request.getContextPath() %>/admin/insertBookReviewAction.jsp" method="post">
			<table border="1">
				<tr>
					<th>å ��ȣ</th>
					<td><%=request.getParameter("bookNo")%><input type="hidden" name="bookNo" value="<%=request.getParameter("bookNo")%>"></td>
				</tr>
				<tr>
					<th>ȸ�����̵�</th>
					<td><%=(String)session.getAttribute("sessionId") %><input type="hidden" name="memberNo" value="<%=memberNo%>"></td>
					
				</tr>
				<tr>
					<th>���䳻��</th>
					<td><input type="text" name="bookReviewContent"></td>
				</tr>
				<tr>
					<th>�����ۼ�<th>
					<button type="submit">�����ۼ�</button>
				</tr>
			</table>
		</form>
		<br>
			<a href="<%=request.getContextPath() %>/admin/reviewList.jsp">������</a>
	</body>
</html>