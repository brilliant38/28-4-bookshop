<!-- ���ؼ�,�̱��� 2018.07.23 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Book Form</title>
	</head>
	<body>
		<h1>�Ǹŵ����߰�</h1>
		<form action="<%=request.getContextPath() %>/admin/insertBookAction.jsp" method="post">
			<table border="1">
				<tr>
					<th>�����ڵ�</th>
					<td><select name="bookCode">
							<option> �� ����</option>
							<option value="1">01.�Ҽ�</option>
							<option value="2">02.����/����</option>
							<option value="3">03.��/������</option>
							<option value="4">04.����/�濵</option>
							<option value="5">05.�ڱ���</option>
							<option value="6">06.�ι�</option>
							<option value="7">07.����/��ȭ</option>
							<option value="8">08.��ȸ</option>
							<option value="9">09.����/���߹�ȭ</option>
							<option value="10">10.����</option>
							<option value="11">11.����</option>
							<option value="12">12.���</option>
							<option value="13">13.����/��Ȱ/�丮</option>
							<option value="14">14.�ǰ�</option>
							<option value="15">15.���/����</option>
							<option value="16">16.����/����</option>
							<option value="17">17.����/�ܱ���</option>
							<option value="18">18.����</option>
							<option value="19">19.��ǻ��/IT</option>
							<option value="20">20.û�ҳ�</option>
							<option value="21">21.�н�/����</option>
							<option value="22">22.���/���輭</option>
							<option value="23">23.��ȭ</option>
							<option value="24">24.����</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>���ǻ�</th>
					<td><select name="publisher">
							<option> �� ���ǻ��</option>
							<option value="1">01.�������ǻ�</option>
							<option value="2">02.������ǻ�</option>
							<option value="3">03.�Ｚ���ǻ�</option>
							<option value="4">04.�������ǻ�</option>
							<option value="5">05.�̷���</option>
							<option value="6">06.�ݼ����ǻ�</option>
							<option value="7">07.���̺�</option>
							<option value="8">08.�����</option>
							<option value="9">09.õ�米����</option>
							<option value="10">10.�����Ǿ�</option>
							<option value="11">11.����å�Ż��</option>
							<option value="12">12.���̴ɷ�</option>
						</select></td>
				</tr>
				<tr>
					<th>������</th>
					<td>
						<input type="text" name="bookName">
					</td>
				</tr>
				<tr>
					<th>����</th>
					<td><input type="text" name="bookAuthor"></td>
				</tr>
				<tr>
					<th>��������</th>
					<td><input type="text" name="bookPrice"></td>
				</tr>
				<tr>
					<th>��������Ʈ</th>
					<td><input type="text" name="bookPoint"></td>
				</tr>
				<tr>
					<th>��������</th>
					<td><input type="text" name="bookAmount"></td>
				</tr>
				<tr>
					<th>��������</th>
					<td><select name="bookOut">
							<option>�Ǹ���</option>
							<option>����</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>���������Է�</th>
					<td><input type="submit" value="���������Է�"></td>
				</tr>
			</table>
		</form>
	</body>
</html>