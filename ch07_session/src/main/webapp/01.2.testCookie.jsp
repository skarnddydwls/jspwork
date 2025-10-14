<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookies</title>
</head>
<body>
<%
	Cookie[] cookies = request.getCookies(); // 여러개일 수도 있어서 배열로 받음
	if(cookies != null){
		for(int i=0; i<cookies.length;i++){
			if(cookies[i].getName().equals("myCookie")){
				out.print("Cookie Name: "+cookies[i].getName()+"<p/>"); 
				out.print("Cookie Value: "+cookies[i].getValue());
			}
		}
	}
%>
</body>
</html>