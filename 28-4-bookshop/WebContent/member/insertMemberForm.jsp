<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Member</title>
	</head>
	<body>
		<form action="<%= request.getContextPath() %>/member/insertMemberAction.jsp" method="post">
			���̵� : <input type="text" name="memberId"><br>
			��й�ȣ : <input type="password" name="memberPw"><br>
			�̸� : <input type="text" name="memberName"><br>
			�ּ� : <input type="text" name="memberAddr"><br>
			<input type="hidden" name="memberPoint" value=0>
			<input type="submit" value="ȸ������">
		</form>
	</body>
</html>