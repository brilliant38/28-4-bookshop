<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.BookCodeService" %>
<%@ page import="service.BookCode" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Member</title>
	</head>
	<body>
		<form action="<%= request.getContextPath() %>/member/insertMemberAction.jsp" method="post">
			아이디 : <input type="text" name="memberId"><br>
			비밀번호 : <input type="password" name="memberPw"><br>
			이름 : <input type="text" name="memberName"><br>
			주소 : <input type="text" name="memberAddr"><br>
			관심 장르 : <br>
			<%
				BookCodeService bookcodeservice = new BookCodeService();
				ArrayList<BookCode> bookCodeList = bookcodeservice.bookCode();
				for(int i=0; i<bookCodeList.size(); i++){
			%>
				<input type="checkbox" name="inter" value="<%= bookCodeList.get(i).getBookCodeNo()%>"><%= bookCodeList.get(i).getBookCodeName() %><br>
			<%
				}
			%>
			<input type="hidden" name="memberPoint" value=0><br>
			<input type="submit" value="회원가입">
		</form>
	</body>
</html>