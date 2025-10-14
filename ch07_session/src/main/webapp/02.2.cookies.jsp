<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String name= request.getParameter("name");
	String gender= request.getParameter("gender");
	String age= request.getParameter("age");
	
	response.addCookie(new Cookie("name",name));
	response.addCookie(new Cookie("age",age));
	response.addCookie(new Cookie("gender",gender));
%>
</head>
<body>
<%
	Cookie[] cookies = request.getCookies();
	/*if(cookies != null){
		for(int i=0;i<cookies.length;i++){
			out.print("Cookie Name: "+cookies[i].getName()+"<p/>");
			out.print("Cookie Value: "+cookies[i].getValue()+"<hr>");
		}
	}*/
%>
<%!
	String getCookieValue(Cookie[] cookies, String name){
		if(cookies != null){
			for(int i=0;i<cookies.length;i++){
				if(cookies[i].getName().equals(name)){
					return cookies[i].getValue();
				}
			}
		}
		return null;
	}
%>
이름: <%=getCookieValue(cookies, "name") %><p/>
나이: <%=getCookieValue(cookies, "age") %><p/>
성별: <%=getCookieValue(cookies, "gender") %><hr>
</body>
</html>