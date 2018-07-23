<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>loginAdminForm</title>
	</head>
	<body>
	<h3>관리자 로그인</h3>
		<form action="<%= request.getContextPath() %>//loginAdminAction.jsp" method="post">
			아이디 : <input type="text" name="adminId"><br>
			비밀번호 : <input type="password" name="adminPw"><br>
			<input type="submit" value="관리자 로그인">
		</form>
	</body>
</html>