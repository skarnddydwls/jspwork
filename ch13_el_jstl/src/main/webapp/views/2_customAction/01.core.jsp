<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.* , com.study.dto.Person" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core Library</title>
</head>
<body>
	<h1>JSTL Core Library</h1>
	
	<h3>1. 변수(속성 == attribute)</h3>
	<h4>1.1 변수 선언과 초기화</h4>
	<pre>
	* 변수 선언과 동시에 초기화 (c:set var="변수명" value="값" [scope=""])
		- 변수 선언하고 초기값을 대입해두는 기능을 제공
		- 해당 변수를 어떤 scope에 담아둘것인지 지정 가능함(생략시 기본값 pageScope)
			=> 해당 scope에 setAttribute를 통해 key-value 형태로 데이터를 담아놓는 거와 같음
			=> c:set으로 선언된 변수는 EL로 접근하여 사용(스크립팅 원소로는 접근 불가)
			
		- 변수 타입은 별도로 지정하지 않음
		- 초기값은 반드시 지정해야 됨
	</pre>
	
	<c:set var="num1" value="10" /> <!-- == pageContext.setAttribute("num1", 10) -->
	<c:set var="num2" value="20" scope="request" />
	
	num1 변수의 값: ${num1 }<br>
	num2 변수의 값: ${num2 }<br>
	
	<c:set var="result" value="num1+num2" scope="session" /> <!-- String -->
	<c:set var="result" value="${num1+num2}" scope="session" />
	
	result: ${result }<br>
	
	pageScope.num1: ${pageScope.num1 }<br>
	requestScope.num2: ${requestScope.num2 }<br>
	sessionScope.result: ${sessionScope.result }<br>
	requestScope.result: ${requestScope.result }<br>
	
	<c:set var="result" scope="request">
		9999999999999999
	</c:set>
	
	requestScope.result: ${requestScope.result }<br>
	sessionScope.result: ${sessionScope.result }<br>
	
	<hr>
	
	<h4>1.2 변수 삭제</h4>
	<pre>
	* 변수 삭제 (c:remove var="제거할 변수명" [scope=""])
		- 해당 scope 영역에서 해당 변수를 찾아서 제거하는 태그
		- scope 지정 생략시 모든 scope에서 해당 변수를 다 찾아서 제거함
			=> 즉, 해당 scope에 .removeAttribute를 통해 제거하는 거라고 생각하면 됨
	</pre>
	
	삭제 전 result: ${result} <!-- request가 더 작아서 request에 있는 result를 읽음 -->
	
	1) 특정 scope 지정하여 삭제
	<c:remove var="result" scope="request"/>
	requestScope.result 삭제 후 result: ${result} <!-- 제일 작은 request가 삭제 돼서 session에 있는 result를 읽음 -->
	
	2) 모든 scope에서 삭세<br>
	<c:remove var="result" />
	모든 scope에서 삭제 후 result: ${result }<br>
	
	<hr>
	
	<h4>1.3 변수 출력</h4>
	<pre>
	* 변수(데이터) 출력 (c:out value="출력하고자 하는 값" [default="기본값"][escapeXml="ture | false"])
		데이터를 출력하고자 할 때 사용하는 태그
	</pre>
	
	<c:out value="${num1 }"/><br>
	<c:out value="${abcd }" default="없음"/><br>
	
	<c:set var="outTest" value="<b>출력테스트</b>" />
	
	<!-- escapeXml를 넣지 않으면 기본 true: 태그 해석안됨(문자열로 취습 
		 escapeXml = "false" 이면 태그 해석	
	-->
	<c:out value="${outTest }" /><br>
	<c:out value="${outTest }" escapeXml = "false" /><br>
	
	<hr>
	
	<h3>2. 조건문 - if (c:if test="조건식")</h3>
	<pre>
	- java의 if문과 비슷한 역할을 하는 태그
	- 조건식은 test속성에 작성(단, el구문으로 기술해야됨)
	</pre>
<%-- 기존 문법
	<%
		if(num1 > num2) {
	%>
			<b>num1이 num2보다 크다</b>
	<%
		}
	%>
--%>
	
	<c:if test="${ num1 gt num2 }">
		<b>num1이 num2보다 크다</b>
	</c:if>
	
	<c:if test="${ num1 le num2 }">
		<b>num1이 num2보다 작거나 같다</b>
	</c:if>
	
	<br>
	
	<c:set var="str" value="안녕하세요" />
<%-- 	
	<%
	if(str.equals("안녕하세요")) {
	%>
		<h4>Hello World</h4>
	<%
	}
	%>
--%>
	<c:if test="${str eq '안녕하세요'}">
		<h4>Hello World</h4>
	</c:if>
	
	<c:if test="${str ne '안녕하세요'}">
		<h4>Bye World</h4>
	</c:if>
	
	<br><br>
	
	<h3>3. 조건문 Choose (c:choose, c:when, c:otherwise)</h3>
	<pre>
	- java의 if-else, if-else 문과 비슷한 역할을 하는 태그
	- 각 조건들을 c:choose의 하위요소로 c:when을 통하여 작성 (else문 역할 -> c:otherwise)
	</pre>
<%-- 	
	<%
		if(num1 > 20) {
	%>
	<%
		} else if {
	%>
	<%
		} else {
	%>
	<%		
		}
	%>
--%>
	<c:choose>
		<c:when test="${num1 gt 20 }">
			<b>20보다 큰 숫자</b>
		</c:when>
		<c:when test="${num1 ge 10 }">
			<b>20보다 작고 10보다 크거나 같은 숫자</b>
		</c:when>
		<c:otherwise>
			<b>10보다 작은 숫자</b>
		</c:otherwise>
	</c:choose>
	
	<hr>
	
	<h3>4. 반복문 - forEach</h3>
	<pre>
	for loop문 - (c:forEach var="변수명" begin="시작값" end="종료값" [step=""])
	향상된 for문 = (c:forEach var="변수명" items="순차적으로 접근하고자하는 객체(배열|컬렉션) [varStatus="현재 접근된 요소의 상태값을 보관할 변수명"]")
	</pre>
	
	<c:forEach var="i" begin="1" end="10" step="2">
		반복확인: ${i}<br>
	</c:forEach>
	
	<c:forEach var="i" begin="1" end="6">
		<h${i}>태그안에서도 적용가능</h${i}>
	</c:forEach>
	
	<c:set var="colors">
		red, yellow, green, pink
	</c:set>
	
	colors 변수값: ${colors}<br>
	
	<ul>
		<c:forEach var="c" items="${colors }">		
			<li style="color: ${c}">${c}</li>
		</c:forEach>
	</ul>
	
	<%
		ArrayList<Person> list = new ArrayList<>();
		list.add(new Person("이하늘", 24, "여자"));
		list.add(new Person("남궁용진", 27, "남자"));
		list.add(new Person("남궁하늘", 21, "남자"));
	%>
	
	<c:set var="pList" value="<%=list %>" scope="request" />
	
	<table border="1">
		<thead>
			<tr>
				<th>index</th>
				<th>count</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test= "${empty pList}">
					<tr>
						<td colspan="3">조회된 사람이 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="p" items="${pList}">
						<tr>
							<td>${status.index}</td>
							<td>%{status.count}</td>
							<td>${p.name}</td>
							<td>${p.age}</td>
							<td>${p.gender}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
	<hr>
	
	<h3>5. 반복문 forTakens</h3>
	<pre>
	(c:forTokens var="변수명" items="분리시키고자 하는 문자열" delims="구분자")
		- 구분자를 통하여 분리된 각각의 문자열에 순차적으로 접근하여 반복 수행
		- java의 split("구분자") 또는 StringTokenizer와 비슷한 기능 처리
	</pre>
	
	<c:set var="device" value="컴퓨터,핸드폰,Tv.에어컨/냉장고.세탁기" />
	
	<ol>
		<c:forTokens var="d" items="${device}" delims=",./">
			<li>${d}</li>
		</c:forTokens>
	</ol>
	
	<hr>
	
	<h3>6. url, 쿼리 스트링 관련 - url, param</h3>
	<pre>
	- url 경로를 생성하고, 쿼리스트링을 정의해 놓을 수 있는 태그
	
	&lt;c:url var="변수명" value="요청할url"&gt;
		&lt;c:param name="키" value="값" /&gt;
	&lt;/c:url&gt;
	</pre>
	
	<a href="list.do?numPage=1&num=2">기존 방식</a></p>
	
	<c:url var="u" value="list.do">
		<c:param name="nowPage" value="1" />
		<c:param name="num">2</c:param>
	</c:url>
	<a href="${u}">c:url 이용한 방식</a>
	
</body>
</html>















