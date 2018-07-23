<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Member</title>
	</head>
	<body>
		<form action="<%= request.getContextPath() %>/member/insertMemberAction.jsp" method="post">
			아이디 : <input type="text" name="memberId"><br>
			비밀번호 : <input type="password" name="memberPw"><br>
			이름 : <input type="text" name="memberName"><br>
			주소 : <input type="text" name="memberAddr"><br>
			관심 장르 : 
			<input type="checkbox" value="1" name="inter"> 소설
			<input type="checkbox" value="2" name="inter"> 과학/공학
			<input type="checkbox" value="3" name="inter"> 시/에세이
			<input type="checkbox" value="4" name="inter"> 경제/경영
			<input type="checkbox" value="5" name="inter"> 자기계발
			<input type="checkbox" value="6" name="inter"> 인문
			<input type="checkbox" value="7" name="inter"> 역사/문화
			<input type="checkbox" value="8" name="inter"> 사회
			<input type="checkbox" value="9" name="inter"> 예술/대중문화
			<input type="checkbox" value="10" name="inter"> 종교
			<input type="checkbox" value="11" name="inter"> 유아
			<input type="checkbox" value="12" name="inter"> 어린이
			<input type="checkbox" value="13" name="inter"> 가정/생활/요리
			<input type="checkbox" value="14" name="inter"> 건강
			<input type="checkbox" value="15" name="inter"> 취미/레저
			<input type="checkbox" value="16" name="inter"> 여행/지도
			<input type="checkbox" value="17" name="inter"> 국어/외국어
			<input type="checkbox" value="18" name="inter"> 사전
			<input type="checkbox" value="19" name="inter"> 컴퓨터/IT
			<input type="checkbox" value="20" name="inter"> 청소년
			<input type="checkbox" value="21" name="inter"> 학습/참고서
			<input type="checkbox" value="22" name="inter"> 취업/수험서
			<input type="checkbox" value="23" name="inter"> 만화
			<input type="checkbox" value="24" name="inter"> 잡지
			<input type="hidden" name="memberPoint" value=0>
			<input type="submit" value="회원가입">
		</form>
	</body>
</html>