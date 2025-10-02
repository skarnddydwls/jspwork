<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="test" class="beans.BeanTest01" />
<jsp:setProperty name="test" property="name" value="tjoeun" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	자바빈즈에 들어간 이름 : <jsp:getProperty property="name" name="test"/>
</body>
</html>