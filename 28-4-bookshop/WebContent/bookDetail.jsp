<!-- ��ȣ��,���ؿ� 2018.7.23 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>bookDetail</title>
	</head>
	<body>
		<body>
		<%
			
		
		PublicService publicService = new PublicService();
		
		BookInfo bookInfo = new BookInfo();
		Book book = new Book();
		
		

	%>
		<form action="<%=request.getContextPath()%>/bookList.jsp" method="post">
		<input type = "submit" value="�ڷΰ���"> 
		<h1>���� ������</h1>
		<table border="1">
			<tr>
				<td>��ȣ</td>
				<td>���� ��ȣ</td>
				<td>���ǻ� ��ȣ</td>
				<td>���ǻ�</td>	<!-- publisher -->
				<td>���ǻ� ����Ʈ</td>	<!-- publisher -->
				<td>���� �帣</td>	
				<td>���� �̸�</td>	<!-- book -->
				<td>���� ����</td>	<!-- bookintro -->
				<td>����</td>
				<td>�Ұ��� �ۼ���</td>	<!-- bookintro -->
				<td>����</td>
				<td>����Ʈ</td>
				<td>���� ����</td>
				<td>���� ����</td>
				<td>���� ��� ����</td>
				<td>����</td>
				<td>����</td>
			</tr>
			<tr>
			
			<td><%=bookInfo.getBook().getBookNo()%></td>
			<td><%=bookInfo.getBook().getBookCodeNo()%></td>
			<td><%=bookInfo.getBook().getPublisherNo()%></td>
			<td><%=bookInfo.getPublisher().getPublisherName()%></td>
			<td><%=bookInfo.getPublisher().getPublisherWebsite()%></td>
			<td><%=bookInfo.getBookCode().getBookCodeName()%></td>
			<td><%=bookInfo.getBook().getBookName()%></td>
			<td><%=bookInfo.getBookIntro().getBookIntroContent()%></td>
			<td><%=bookInfo.getBook().getBookAuthor()%></td>
			<td><%=bookInfo.getBookIntro().getBookIntroWriter()%></td>
			<td><%=bookInfo.getBook().getBookPrice()%></td>
			<td><%=bookInfo.getBook().getBookPoint()%></td>
			<td><%=bookInfo.getBook().getBookAmount()%></td>
			<td><%=bookInfo.getBook().getBookOut()%></td>
			<td><%=bookInfo.getBook().getBookDate()%></td>
			
			<td><a href="<%= request.getContextPath() %>/admin/updateBookForm.jsp?bookNo=<%=bookInfo.getBook().getBookNo()%>">����</a></td>
			<td><a href="<%= request.getContextPath() %>/admin/deleteBookAction.jsp?bookNo=<%=bookInfo.getBook().getBookNo()%>">����</a></td>
			</tr>
		</table>
		</form>
	</body>
</html>