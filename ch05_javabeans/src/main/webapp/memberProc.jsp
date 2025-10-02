<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memBean" class="beans.MemberBean" />
<jsp:setProperty name="memBean" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과</title>
<style>
	* {
		margin: 0 auto;
	}
	table {
		border: 1px solid;
		border-collapse:collapse;
		width:400px;
	}
	th, td {
		border: 1px solid;
		height: 30px;
	}
	td {
		padding-left: 10px;
	}
</style>
</head>
<body>
	<br>
	<table>
		<tr>
			<th colspan="2" bgcolor="#D9E5FF">
				<jsp:getProperty property="name" name="memBean"/>회원님이 작성한 내용
			</th>
		</tr>
		<tr>
			<td>아이디</td>
			<td><jsp:getProperty property="id" name="memBean"/></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><jsp:getProperty property="pwd" name="memBean"/></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><jsp:getProperty property="name" name="memBean"/></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><jsp:getProperty property="birthday" name="memBean"/></td>
		</tr>
			<td>이메일</td>
			<td><jsp:getProperty property="email" name="memBean"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="확인완료">&emsp;
				<input type="button" value="다시쓰기" onclick="history.back();">
			</td>
		</tr>
	</table>
</body>
</html>