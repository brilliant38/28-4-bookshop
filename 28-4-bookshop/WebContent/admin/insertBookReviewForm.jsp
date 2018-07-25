<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Book Review Form</title>
	</head>
	<body>
		<h1>리뷰 작성</h1>
		<%
			if(session.getAttribute("sessionId") == null) {
		%>
				<div>
					<a href = "<%=request.getContextPath() + "/member/loginForm.jsp" %>">로그인</a>
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
					<th>책 번호</th>
					<td><%=request.getParameter("bookNo")%><input type="hidden" name="bookNo" value="<%=request.getParameter("bookNo")%>"></td>
				</tr>
				<tr>
					<th>회원아이디</th>
					<td><%=(String)session.getAttribute("sessionId") %><input type="hidden" name="memberNo" value="<%=memberNo%>"></td>
					
				</tr>
				<tr>
					<th>리뷰내용</th>
					<td><input type="text" name="bookReviewContent"></td>
				</tr>
				<tr>
					<th>리뷰작성<th>
					<button type="submit">리뷰작성</button>
				</tr>
			</table>
		</form>
		<br>
			<a href="<%=request.getContextPath() %>/admin/reviewList.jsp">리뷰목록</a>
	</body>
</html>