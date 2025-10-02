<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="script.js"></script>
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
		<form method="post" name="memForm" action="memberProc.jsp">
			<tr>
				<th colspan="2" bgcolor="#D9E5FF">회원가입</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input name="id" size="25"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pwd" size="25"></td>
			</tr>
			<tr>
				<td>패스워드 확인</td>
				<td><input type="password" name="repwd" size="25"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="name" size="25"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input name="birthday" size="25"></td>
			</tr>
				<td>이메일</td>
				<td><input name="email" size="25"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="회원가입" onclick="inputCheck();">&emsp;
					<input type="reset" value="다시쓰기">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>