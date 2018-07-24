<!-- ��ȣ��,���ؿ� 2018.7.18.-->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="service.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<h1><a href = "<%= request.getContextPath() %>/bookList.jsp">���� ����Ʈ</a></h1>
		<table border="1">
			<tr>
				<td>���� ��ȣ</td>
				<td>���ǻ� ��ȣ</td>
				<td>���� �̸�</td>
				<td>����</td>
				<td>����</td>
				<td>����Ʈ</td>
				<td>���� ����</td>
				<td>���� ����</td>
				<td>���� ��� ����</td>
				<td>��ٱ��� ���</td>
			</tr>
			<%
				request.setCharacterEncoding("euc-kr");
			
				int currentPage = 1; //���� ������
				if(request.getParameter("currentPage") != null) { //�޾� ���� currentPage�� ���� null�� �ƴ� �� ����˴ϴ�.
					currentPage = Integer.parseInt(request.getParameter("currentPage")); //String currentPage�� ����ȯ �Ͽ� �����մϴ�.
					System.out.println(request.getParameter("currentPage") + "current");
				}
				
				String sel = "";
				if(request.getParameter("sel") != null) { //�޾� ���� sel�� ���� null�� �ƴ� �� ����˴ϴ�.
					sel = request.getParameter("sel"); //String sle�� ����ȯ �Ͽ� �����մϴ�.
				}
				
				String word = "";
				if(request.getParameter("word") != null) { //�޾� ���� word�� ���� null�� �ƴ� �� ����˴ϴ�.
					word = request.getParameter("word"); //String word�� ����ȯ �Ͽ� �����մϴ�.
				}
				
				PublicService publicService = new PublicService();
				BookInfo bookInfo = new BookInfo();
				Book book = new Book();
				book.setSearchWord(word);
				bookInfo.setBook(book);
				ArrayList<BookInfo> bookList = publicService.bookList(currentPage, 5, bookInfo, sel);
				
			
				for(int i=0; i<bookList.size(); i++) {
					bookInfo = bookList.get(i);
			%>
				
				<tr>
					<td><%=bookInfo.getBook().getBookCodeNo()%></td>
					<td><%=bookInfo.getBook().getPublisherNo()%></td>
					<td><a href="<%= request.getContextPath() %>/bookDetail.jsp?no=<%=bookInfo.getBook().getBookNo()%>"><%=bookInfo.getBook().getBookName()%></a></td>
					<td><%=bookInfo.getBook().getBookAuthor()%></td>
					<td><%=bookInfo.getBook().getBookPrice()%></td>
					<td><%=bookInfo.getBook().getBookPoint()%></td>
					<td><%=bookInfo.getBook().getBookAmount()%></td>
					<td><%=bookInfo.getBook().getBookOut()%></td>
					<td><%=bookInfo.getBook().getBookDate()%></td>
					<td><a href="<%= request.getContextPath() %>/admin/updateBookForm.jsp?bookNo=<%=bookInfo.getBook().getBookNo()%>">��ٱ��� ���</a></td>
				</tr>
			<%
				}
			%>
		</table>
		<div> 
			<%
				if(currentPage > 1) {
			%>
					<a href="<%= request.getContextPath() %>/bookList.jsp?currentPage=<%=currentPage-1%>">������</a>
			<%
				}
			
				bookInfo = bookList.get(0);
				System.out.println(bookList.get(0) + " bookInfo");
				if(currentPage < bookInfo.getBook().getLastPage())	{
			%>
					<a href="<%= request.getContextPath() %>/bookList.jsp?currentPage=<%=currentPage+1%>">������</a>
			<%
				}
			%>
		</div>
		<form action = "<%= request.getContextPath() %>/bookList.jsp" method="post">
			<div>
				<select name = "sel">
					<option value = "all">��ü</option>
					<option value = "book_name">���� ��</option>
					<option value = "book_author">����</option>
				</select>
				<input type="text" name="word">
				<button type="submit">���� �˻�</button>
			</div>
		</form>
	</body>
</html>