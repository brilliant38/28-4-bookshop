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
			
		int bookno = Integer.parseInt(request.getParameter("no")); 
		BookDetailService bookdetailservice = new BookDetailService();
		BookInfo bookinfo = bookdetailservice.selectBookDetail(bookno);
		System.out.println(bookinfo.getBook() + " : �� �ּ� üũ");
		
		

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
			
			<td><%=bookinfo.getBook().getBookNo()%></td>
			<td><%=bookinfo.getBook().getBookCodeNo()%></td>
			<td><%=bookinfo.getBook().getPublisherNo()%></td>
			<td><%=bookinfo.getPublisher().getPublisherName()%></td>
			<td><%=bookinfo.getPublisher().getPublisherWebsite()%></td>
			<td><%=bookinfo.getBookCode().getBookCodeName()%></td>
			<td><%=bookinfo.getBook().getBookName()%></td>
			<td><%=bookinfo.getBookIntro().getBookIntroContent()%></td>
			<td><%=bookinfo.getBook().getBookAuthor()%></td>
			<td><%=bookinfo.getBookIntro().getBookIntroWriter()%></td>
			<td><%=bookinfo.getBook().getBookPrice()%></td>
			<td><%=bookinfo.getBook().getBookPoint()%></td>
			<td><%=bookinfo.getBook().getBookAmount()%></td>
			<td><%=bookinfo.getBook().getBookOut()%></td>
			<td><%=bookinfo.getBook().getBookDate()%></td>
			
			<td><a href="<%= request.getContextPath() %>/admin/updateBookForm.jsp?bookNo=<%=bookinfo.getBook().getBookNo()%>">����</a></td>
			<td><a href="<%= request.getContextPath() %>/admin/deleteBookAction.jsp?bookNo=<%=bookinfo.getBook().getBookNo()%>">����</a></td>
			</tr>
		</table>
		</form>
	</body>
</html>