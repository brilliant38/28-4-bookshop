<!-- 구해성,이광재 2018.07.23 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Book Form</title>
	</head>
	<body>
		<h1>판매도서추가</h1>
		<form action="<%=request.getContextPath() %>/admin/insertBookAction.jsp" method="post">
			<table border="1">
				<tr>
					<th>도서코드</th>
					<td><select name="bookCode">
							<option> ▼ 종류</option>
							<option value="1">01.소설</option>
							<option value="2">02.과학/공학</option>
							<option value="3">03.시/에세이</option>
							<option value="4">04.경제/경영</option>
							<option value="5">05.자기계발</option>
							<option value="6">06.인문</option>
							<option value="7">07.역사/문화</option>
							<option value="8">08.사회</option>
							<option value="9">09.예술/대중문화</option>
							<option value="10">10.종교</option>
							<option value="11">11.유아</option>
							<option value="12">12.어린이</option>
							<option value="13">13.가정/생활/요리</option>
							<option value="14">14.건강</option>
							<option value="15">15.취미/레저</option>
							<option value="16">16.여행/지도</option>
							<option value="17">17.국어/외국어</option>
							<option value="18">18.사전</option>
							<option value="19">19.컴퓨터/IT</option>
							<option value="20">20.청소년</option>
							<option value="21">21.학습/참고서</option>
							<option value="22">22.취업/수험서</option>
							<option value="23">23.만화</option>
							<option value="24">24.잡지</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>출판사</th>
					<td><select name="publisher">
							<option> ▼ 출판사명</option>
							<option value="1">01.동아출판사</option>
							<option value="2">02.길벗출판사</option>
							<option value="3">03.삼성출판사</option>
							<option value="4">04.교원출판사</option>
							<option value="5">05.미래엔</option>
							<option value="6">06.금성출판사</option>
							<option value="7">07.와이비엠</option>
							<option value="8">08.비상교육</option>
							<option value="9">09.천재교과서</option>
							<option value="10">10.프린피아</option>
							<option value="11">11.좋은책신사고</option>
							<option value="12">12.엔이능률</option>
						</select></td>
				</tr>
				<tr>
					<th>도서명</th>
					<td>
						<input type="text" name="bookName">
					</td>
				</tr>
				<tr>
					<th>저자</th>
					<td><input type="text" name="bookAuthor"></td>
				</tr>
				<tr>
					<th>도서가격</th>
					<td><input type="text" name="bookPrice"></td>
				</tr>
				<tr>
					<th>도서포인트</th>
					<td><input type="text" name="bookPoint"></td>
				</tr>
				<tr>
					<th>도서수량</th>
					<td><input type="text" name="bookAmount"></td>
				</tr>
				<tr>
					<th>도서절판</th>
					<td><select name="bookOut">
							<option>판매중</option>
							<option>절판</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>도서정보입력</th>
					<td><input type="submit" value="도서정보입력"></td>
				</tr>
			</table>
		</form>
	</body>
</html>