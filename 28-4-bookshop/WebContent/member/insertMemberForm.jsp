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
			���� �帣 : 
			<input type="checkbox" value="1" name="inter"> �Ҽ�
			<input type="checkbox" value="2" name="inter"> ����/����
			<input type="checkbox" value="3" name="inter"> ��/������
			<input type="checkbox" value="4" name="inter"> ����/�濵
			<input type="checkbox" value="5" name="inter"> �ڱ���
			<input type="checkbox" value="6" name="inter"> �ι�
			<input type="checkbox" value="7" name="inter"> ����/��ȭ
			<input type="checkbox" value="8" name="inter"> ��ȸ
			<input type="checkbox" value="9" name="inter"> ����/���߹�ȭ
			<input type="checkbox" value="10" name="inter"> ����
			<input type="checkbox" value="11" name="inter"> ����
			<input type="checkbox" value="12" name="inter"> ���
			<input type="checkbox" value="13" name="inter"> ����/��Ȱ/�丮
			<input type="checkbox" value="14" name="inter"> �ǰ�
			<input type="checkbox" value="15" name="inter"> ���/����
			<input type="checkbox" value="16" name="inter"> ����/����
			<input type="checkbox" value="17" name="inter"> ����/�ܱ���
			<input type="checkbox" value="18" name="inter"> ����
			<input type="checkbox" value="19" name="inter"> ��ǻ��/IT
			<input type="checkbox" value="20" name="inter"> û�ҳ�
			<input type="checkbox" value="21" name="inter"> �н�/����
			<input type="checkbox" value="22" name="inter"> ���/���輭
			<input type="checkbox" value="23" name="inter"> ��ȭ
			<input type="checkbox" value="24" name="inter"> ����
			<input type="hidden" name="memberPoint" value=0>
			<input type="submit" value="ȸ������">
		</form>
	</body>
</html>