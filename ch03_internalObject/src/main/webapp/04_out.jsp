<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="4kb"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Out Ex</h1>
	<%
	int totalBuffer=out.getBufferSize();
	int remainBuffer=out.getRemaining();
	int useBuffer=totalBuffer - remainBuffer;
	%>
	버퍼의 총 크기: <%=totalBuffer %>byte<p/>
	남은 버퍼 크기: <%=remainBuffer %>byte<p/>
	사용 버퍼 크기: <%=useBuffer %>byte<p/>
</body>
</html> 