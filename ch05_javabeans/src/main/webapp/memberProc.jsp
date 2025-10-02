<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memBean" class="beans.MemberBean" />
<jsp:setProperty name="memBean" property="*" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	table{
	border: 1px solid;
	}
</style>
</head>
<body>
<table >
	<tr>
		<th colspan="2">
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
		<td>패스워드확인</td>
		<td><input type="password" name="repwd" size="25"></td>
	</tr>
	<tr>
		<td></td>
	</tr>
	<tr>
		<td></td>
	</tr>
	<tr>
		<td></td>
	</tr>
	<tr>
		<td>
			<input type="button" value="확인완료">&emsp;
			<input type="button" value="다시쓰기" onclick="history.back()">
		</td>
	</tr>
</table>
</body>
</head>
<body>

</body>
</html>