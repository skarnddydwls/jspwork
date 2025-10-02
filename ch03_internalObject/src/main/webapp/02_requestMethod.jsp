<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<H1>Request Method</H1>
	프로토콜: <%=request.getProtocol() %> <p/>
	서버이름: <%=request.getServerName() %><p/>
	포트번호: <%=request.getServerPort() %><p/>
	클라이언트 주소: <%=request.getRemoteAddr() %><p/>
	클라이언트 이름: <%=request.getRemoteHost() %><p/>
	요청 경로(URI): <%=request.getRequestURI() %><p/>
	요청 경로(URL): <%=request.getRequestURL() %><p/>
	현재 사용하는 브라우저: <%=request.getHeader("User-Agent") %><p/>
	파일 type: <%=request.getHeader("Accept") %><p/>
	
</body>
</html>