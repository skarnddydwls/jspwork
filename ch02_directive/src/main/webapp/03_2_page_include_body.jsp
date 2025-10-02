<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>body</title>
<style>
	.body{
		height:500px;
		background-Color: pink;
	}
	.hf {
		height:50px;
		line-height: 50px;
		background-Color: hotpink;
	}
</style>
</head>
<body>
	<%@ include file="03_1_page_include_header.jsp" %> <br>
	<p class="body">include 지시자의 Body 부분입니다</p>
	<%@ include file="03_3_page_include_footer.jsp" %> <br>
</body>
</html>