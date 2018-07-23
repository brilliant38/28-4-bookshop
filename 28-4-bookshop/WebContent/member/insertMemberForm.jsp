<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
			<input type="hidden" name="memberPoint" value=0>
			<input type="submit" value="회원가입">
		</form>
	</body>
</html>