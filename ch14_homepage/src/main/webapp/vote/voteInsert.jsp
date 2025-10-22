<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">투표 프로그램</h1>
	<hr>
	<h3 align="center">설문작성</h3>
	<hr>
	
	<form action="voteInsertProc.jsp">
		<table align="center" border="1" width="80%">
			<tr>
				<td style="width:10%;">질문</td>
				<td colspan="2">Q: <input name="question" style="width:90%;"></td>
			</tr>
			<tr>
				<td rowspan="8">항목</td>
				<td>1: <input name="item"></td>
				<td>2: <input name="item"></td>
			</tr>
			<tr>
				<td>3: <input name="item"></td>
				<td>4: <input name="item"></td>
			</tr>
			<tr>
				<td>5: <input name="item"></td>
				<td>6: <input name="item"></td>
			</tr>
			<tr>
				<td>7: <input name="item"></td>
				<td>8: <input name="item"></td>
			</tr>
			<tr>
				<td>시작일</td>
				<td>
					<select name="sdateY">
						<%
							for(int i=2000;i<2026;i++){
								out.print("<option value='"+i+"'>"+i+"</option>");
							}
						%>
					</select>년
					<select name="sdateM">
						<%
							for(int i=1;i<13;i++){
								out.print("<option value='"+i+"'>"+i+"</option>");
							}
						%>
					</select>월
					<select name="sdateD">
						<%
							for(int i=1;i<32;i++){
								out.print("<option value='"+i+"'>"+i+"</option>");
							}
						%>
					</select>일
				</td>
			</tr>
			<tr>
				<td>종료일</td>
				<td>
					<select name="edateY">
						<%
							for(int i=2000;i<2026;i++){
								out.print("<option value='"+i+"'>"+i+"</option>");
							}
						%>
					</select>년
					<select name="edateM">
						<%
							for(int i=1;i<13;i++){
								out.print("<option value='"+i+"'>"+i+"</option>");
							}
						%>
					</select>월
					<select name="edateD">
						<%
							for(int i=1;i<32;i++){
								out.print("<option value='"+i+"'>"+i+"</option>");
							}
						%>
					</select>일
				</td>
			</tr>
			<tr>
				<td>이중답변</td>
				<td>
					<input type="radio" name="type" value="1">Yes&emsp;
					<input type="radio" name="type" value="0" checked>No
				</td>
			</tr>
			<tr colspan="3">
				<td colspan="2" align="center">
					<input type="submit" value="작성하기">
					<input type="reset" value="초기화">
					<input type="button" value="리스트보기" onclick="location.href='voteList.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>