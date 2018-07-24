<!-- 김호순,김준영 2018.7.23 -->
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
		<input type = "submit" value="뒤로가기"> 
		<h1>도서 상세정보</h1>
		<table border="1">
			<tr>
				<td>번호</td>
				<td>도서 번호</td>
				<td>출판사 번호</td>
				<td>출판사</td>	<!-- publisher -->
				<td>출판사 사이트</td>	<!-- publisher -->
				<td>도서 장르</td>	
				<td>도서 이름</td>	<!-- book -->
				<td>도서 내용</td>	<!-- bookintro -->
				<td>저자</td>
				<td>소개글 작성자</td>	<!-- bookintro -->
				<td>가격</td>
				<td>포인트</td>
				<td>남은 수량</td>
				<td>절판 여부</td>
				<td>도서 등록 일자</td>
				<td>수정</td>
				<td>삭제</td>
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
			
			<td><a href="<%= request.getContextPath() %>/admin/updateBookForm.jsp?bookNo=<%=bookInfo.getBook().getBookNo()%>">수정</a></td>
			<td><a href="<%= request.getContextPath() %>/admin/deleteBookAction.jsp?bookNo=<%=bookInfo.getBook().getBookNo()%>">삭제</a></td>
			</tr>
		</table>
		</form>
	</body>
</html>