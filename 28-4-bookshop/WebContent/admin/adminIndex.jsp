<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Administrator Index</title>
	</head>
	<body>
		<h1>������ ����ȭ��</h1>
		<div>
			<a href ="<%=request.getContextPath() %>/admin/logout.jsp" >�α׾ƿ�</a>
		</div>
		<br>
		<div>
			<a href ="<%=request.getContextPath() %>/admin/memberList.jsp" >ȸ�����</a>
			<a href ="<%=request.getContextPath() %>/ordersList.jsp" >�ֹ����</a>
			<a href ="<%=request.getContextPath() %>/admin/bookAdminList.jsp" >�������</a>
			<a href ="<%=request.getContextPath() %>/admin/insertBookForm.jsp" >�Ǹŵ����߰�</a>
		</div>
	</body>
</html>