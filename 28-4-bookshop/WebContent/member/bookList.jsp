<!-- 김호순,김준영 2018.7.18.-->
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
		<h1>도서 리스트</h1>
		<table border="1">
			<tr>
				<td>도서 번호</td>
				<td>출판사 번호</td>
				<td>도서 이름</td>
				<td>저자</td>
				<td>가격</td>
				<td>포인트</td>
				<td>남은 수량</td>
				<td>절판 여부</td>
				<td>도서 등록 일자</td>
				<td>장바구니 담기</td>
			</tr>
			<%
				request.setCharacterEncoding("euc-kr");
			
				int currentPage = 1; //현재 페이지
				if(request.getParameter("currentPage") != null) { //받아 오는 currentPage의 값이 null이 아닐 때 실행됩니다.
					currentPage = Integer.parseInt(request.getParameter("currentPage")); //String currentPage를 형변환 하여 대입합니다.
					System.out.println(request.getParameter("currentPage") + "current");
				}
				
				String word = "";
				if(request.getParameter("word") != null) { //받아 오는 word의 값이 null이 아닐 때 실행됩니다.
					word = request.getParameter("word"); //String word를 형변환 하여 대입합니다.
				}
				
				PublicService publicService = new PublicService();
				BookInfo bookInfo = new BookInfo();
				Book book = new Book();
				book.setSearchWord(word);
				bookInfo.setBook(book);
				ArrayList<BookInfo> bookList = publicService.bookList(currentPage, 5, bookInfo);
				
			
				for(int i=0; i<bookList.size(); i++) {
					bookInfo = bookList.get(i);
			%>
				
				<tr>
					<td><%=bookInfo.getBook().getBookCodeNo()%></td>
					<td><%=bookInfo.getBook().getPublisherNo()%></td>
					<td><a href="<%= request.getContextPath() %>/member/bookDetail.jsp?no=<%=bookInfo.getBook().getBookNo()%>"><%=bookInfo.getBook().getBookName()%></a></td>
					<td><%=bookInfo.getBook().getBookAuthor()%></td>
					<td><%=bookInfo.getBook().getBookPrice()%></td>
					<td><%=bookInfo.getBook().getBookPoint()%></td>
					<td><%=bookInfo.getBook().getBookAmount()%></td>
					<td><%=bookInfo.getBook().getBookOut()%></td>
					<td><%=bookInfo.getBook().getBookDate()%></td>
					<td><a href="<%= request.getContextPath() %>/member/shoppingCart.jsp?bookNo=<%=bookInfo.getBook().getBookNo()%>">장바구니 담기</a></td>
				</tr>
			<%
				}
			%>
		</table>
		<div> 
			<%
				if(currentPage > 1) {
			%>
					<a href="<%= request.getContextPath() %>/member/bookList.jsp?currentPage=<%=currentPage-1%>">◀이전</a>
			<%
				}
			
				bookInfo = bookList.get(0);
				System.out.println(bookList.get(0) + " bookInfo");
				if(currentPage < bookInfo.getBook().getLastPage())	{
			%>
					<a href="<%= request.getContextPath() %>/member/bookList.jsp?currentPage=<%=currentPage+1%>">다음▶</a>
			<%
				}
			%>
		</div>
		<form action = "<%= request.getContextPath() %>/member/bookList.jsp" method="post">
			<div>
				이름 :
				<input type="text" name="word">
				<button type="submit">도서 검색</button>
			</div>
		</form>
	</body>
</html>