<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="script.js"></script>
<style>
	table{
	border: 1px solid;
	}
</style>
</head>
<body>
<table >
	<form method="post" name="memForm" action=""></form>
	<tr>
		<th colspan="2">회원가입</th>
	</tr>
	<tr>
		<td>아이디</td>
		<td><input name="id"></td>
	</tr>
	<tr>
		<td>패스워드</td>
		<td><input type="password" name="pwd"></td>
	</tr>
	<tr>
		<td>패스워드확인</td>
		<td><input type="password" name="repwd"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input name="name"></td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td><input name="birthday" type=""></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input name="email" type="email"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="확인완료">&emsp;
			<input type="button" value="다시쓰기" onclick="history.back()">
		</td>
	</tr>
</table>
</body>
</html>