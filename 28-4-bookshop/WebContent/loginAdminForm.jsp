<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>loginAdminForm</title>
	</head>
	<body>
	<h3>������ �α���</h3>
		<form action="<%= request.getContextPath() %>//loginAdminAction.jsp" method="post">
			���̵� : <input type="text" name="adminId"><br>
			��й�ȣ : <input type="password" name="adminPw"><br>
			<input type="submit" value="������ �α���">
		</form>
	</body>
</html>