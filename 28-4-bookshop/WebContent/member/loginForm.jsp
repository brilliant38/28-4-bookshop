<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>loginForm</title>
	</head>
	<body>
		<form action="<%= request.getContextPath() %>/member/loginAction.jsp" method="post">
			���̵� : <input type="text" name="memberId"><br>
			��й�ȣ : <input type="password" name="memberPw"><br>
			<input type="submit" value="�α���">
		</form>
	</body>
</html>