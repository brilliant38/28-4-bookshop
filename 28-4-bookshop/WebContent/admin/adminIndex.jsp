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
			<a href ="<%=request.getContextPath() %>/admin/memberList.jsp" >ȸ�����</a>
		</div>
		<div>
			<a href ="<%=request.getContextPath() %>/ordersList.jsp" >�ֹ����</a>
		</div>
		<div>
			<a href ="<%=request.getContextPath() %>/loginForm.jsp" >�α���</a>
		</div>
		<div>
			<a href ="<%=request.getContextPath() %>/logout.jsp" >�α׾ƿ�</a>
		</div>
		<div>
			<a href ="<%=request.getContextPath() %>/bookList.jsp" >�������</a>
		</div>
		<div>
			<a href ="<%=request.getContextPath() %>/admin/insertBookForm.jsp" >�Ǹŵ����߰�</a>
		</div>
	</body>
</html>