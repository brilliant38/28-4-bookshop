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
			
		int bookno = Integer.parseInt(request.getParameter("no")); 
		BookDetailService bookdetailservice = new BookDetailService();
		BookInfo bookinfo = bookdetailservice.selectBookDetail(bookno);
		System.out.println(bookinfo.getBook() + " : 북 주소 체크");
		
		

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
			
			<td><a href="<%= request.getContextPath() %>/admin/updateBookForm.jsp?bookNo=<%=bookinfo.getBook().getBookNo()%>">수정</a></td>
			<td><a href="<%= request.getContextPath() %>/admin/deleteBookAction.jsp?bookNo=<%=bookinfo.getBook().getBookNo()%>">삭제</a></td>
			</tr>
		</table>
		</form>
	</body>
</html>