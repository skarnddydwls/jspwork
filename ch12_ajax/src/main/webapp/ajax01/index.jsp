<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>AJAX개요</h1>
	<p>
		Asynchronous JavaScript And XML의 약자로<br>
		서버로부터 데이터를 가져와 전체 페이지를 새로 고치지 않고 일부만 로드할 수 있게 하는 기법<BR>
		
		* 동기식 / 비동기식<br>
		> 동기식(a, form, submit)
		<ul>
			<li>요청 처리 후 그에 해당하는 응답페이지가 돌아와야만 그 다음 작업 가능</li>
			<li>서버에 요청한 결과까지의 시간이 지연되면 무작정 계속 기다려야됨(흰페이지로 보여짐)</li>
			<li>전체 페이지를 응답해주기 때문에 기본적으로 페이지가 깜박거림</li>
		</ul>
		
		> 비동기식 (ajax)
		<ul>
			<li>현재 페이지를 그대로 유지하면서 중간중간마다 추가적으로 필요한 요청을 보내 줄 수 있음</li>
			<li>요청을 보냈다고 해서 다른 페이지로 넘어가지 않음 (현재 페이지 그대로 유지)</li>
			<li>요청 보내놓고 그에 해당 하는 응답 (데이터)이 돌아올때 까지 현재페이지에서 다른 작업을 할 수 있음</li>
			<li>페이지가 깜박거리지 않음</li>
		</ul>
		ex) 실시간 급상승 검색어 로딩, 검색어 자동완성, 아이디 중복체크, 찜하기/해제하기, 추천, 댓글, 무한스크롤링 (페이징 대체) 등등...
		<br><br>
		
		* 비동기식의 단점 <br>
		- 현재 페이지에 지속적으로 리소스가 쌓임 => 페이지가 느려질 수 있음 <br>
		- 에러 발생시 디버깅 어려움 <br>
		- 요청 처리 후에 돌아온 응답데이터를 가지고 현재페이지에 새로운 요소를 만들어서 뿌려줘야 함 => dom요소들을 새롭게 만들어내는 구문을 잘익혀둬야됨
		<br><br>
		
		* AJAX 구현 방식 => 순수 JavaScript방식 / jQuery방식(코드가 간결하고 사용하기 쉬움)
	</p>
	
	<pre>
	* jQuery방식으로 AJAX통신
	
	$.ajax({
		속성명:속성값,
		속성명:속성값,
		속성명:속성값,
		...
	});

	$.ajax({
	    url : "요청할 url" (action url),
	    type : "전송 방식" (get, post방식),
	    data : "요청시 전달할 값",
	    success : function(data){
	        전송에 성공하면 실행될 코드;
	    },
	    error:function(){
	        전송에 실패하면 실행될 코드;
	    }
	})

	* 주요속성
	- url : 요청할 url(필수속성)
	- type|mothod : 요청전송방식(get/post)
	- data : 요청시 전달할 값
	- success : ajax통신이 성공했을 때 실행할 함수 정의
	- error : ajax 통신이 실패했을 때 실행할 함수 정의
	- complete : ajax 통신의 성공과 실패에 상관없이 무조건 실행할 함수 정의
	
	* 부수적인속성
	- async : 서버와의 비동기 처리 방식 설정 여부(기본값 true:비동기)
	- contentType : request의 데이터 인코딩 방식 정의(보내는 측의 데이터 인코딩)
	- dataType : 서버에서 response로 오는 데이터의 데이터 형 설정, 값이 없다면 스마트하게 판단함
				xml - 트리 형태의 데이터 구조
				json - 맵 형식의 데이터 구조(일반적인 데이터 구조)
				script - javascript 및 일반 String 형태 데이터
				html - html 태그 자체를 return 하는 방식
				text - String 데이터
	- accept : 파라미터의 타입을 설정 (사용자 특화 된 파라미터 타입 설정 가능)
	- beforesend : ajax 요청을 하기 전 실행되는 이벤트 callback 함수 (데이터 가공 및 header 관련 설정)
	- cache : 요청 및 결과값을 scope에서 갖고 있지 않도록 하는 것 (기본값 true)
	- contents : JQuery에서 response의 데이터를 파싱하는 방식 정의
	- context : ajax 메소드 내 모든 영역에서 파싱 방식 정의
	- crossDomain : 타 도메인 호출 가능 여부 설정(기본값 false)
	- dataFilter : response를 받았을 때 정상적인 값을 return 할 수 있도록 데이터와 데이터 타입 설정
	- global : 기본 이벤트 사용 여부(ajaxstart, ajaxstop) (버퍼링 같이 시작과 끝을 나타낼 때, 선처리 작업)
	- password : 서버에 접속 권한(비밀번호)이 필요한 경우
	- processData : 서버로 보내는 값에 대한 형태 설정 여부(기본 데이터를 원하는 경우 false설정)
	- timeout : 서버 요청 시 응답 대기 시간(milisecond)
	</pre>
	
	<h1>jQuery 방식을 이용한 AJAX 테스트</h1>
	
	<h3>1. 버튼 클릭시 get 방식으로 서버에 요청 및 응답</h3>
	
	입력: <input id="input1">&nbsp;<input type="button" id="btn1" value="전송">
	<br>
	응답: <span id="output1">현재 응답 없음</span>
	
	<script type="text/javascript">
		// location.href = 'ajax1.do?input='+ $("#input1").val();
		$("#btn1").click(function() {
			$.ajax({
				url: "ajax1.do",
				data: {input: $('#input1').val()}, // input에 input1.val를 넣는거임
				type: "get", // get은 기본값이라 안 넣어줘도 됨
				success: function(result){	
					console.log("ajax통신 성공");
					console.log(result);
					$("#output1").text(result);
				},
				error: function(){
					console.log("ajax통신 실패")
				},
				complete: function(){
					console.log("ajax통신 여부와 상관없이 무조건 실행")
				}
			})
		});
	</script>
	<br><hr>
<!-- 	<form action="idCheck.me">
		ID: <input name="id" id="id" required>&emsp;<input type="button" value="중복확인" id="idCheckBtn">
		<br><br><input type="submit" value="회원가입" disabled>
	</form>
	
	<script type="text/javascript">
		$("#idCheckBtn").click(function() {
			let id = $('#id');
			$.ajax({
				url: "idCheck.me",
				data: {checkId: id.val()},
				success: function(result){
					console.log(result);
					if(result == 'NoNoNo~~'){
						alert("사용불가");
					}
					else{
						if(confirm("사용가능한데 사용할거임?")){
							$("form :submit").removeAttr("disabled");
						} else {
							id.focus();
						}
					}
				},
				error: function(){
					console.log("ajax 통신 실패잇")
				}
			});
		})
	</script> -->
	
	<form action="idCheck.me" name="idCheckFrm">
		ID: <input name="id" id="id" required><br>
		<div id="checkResult" style="font-size: 0.8em; display:none"></div>
		<input type="submit" value="회원가입" disabled>
	</form>
	
	<script type="text/javascript">
		let id = $('#id');
		id.keyup(function() {
			if(id.val().length >= 5){
				$.ajax({
					url: "idCheck.me",
					data: {checkId: id.val()},
					success: function(result){
						console.log(result);
						if(result == "No"){
							$("#checkResult").show();
							$("#checkResult").css("color", "red").text("중복!!");
							$("form :submit").attr("disabled", true);
						} else {
							$("#checkResult").show();
							$("#checkResult").css("color", "blue").text("가능!!");
							$("form :submit").attr("disabled", false); // 띄어야된다
						}
					}, error: function() {
						console.log("중복체크용 ajax 통신 실패");
					}
				})
			} else {
				$("form :submit").attr("disabled", true);
			}
		})
	</script>
	
	<hr>
	
	<h3>2. 버튼 클릭시 post 방식으로 서버에 여러개의 데이터 전송 및 응답</h3>
	이름: <input id="name" name="name"><br>
	나이: <input type="number" id="age" name="age"><br>
	<input type="button" value="전송" id="btn2"><br>
	
	
	<!-- v1, v2 일때 응답 
	응답: <span id="output2"></span> -->
	
	<!-- v3 일때 응답 -->
	응답: 
	<ul id="output2"></ul>
	
	<script type="text/javascript">
		$("#btn2").click(function() {
			$.ajax({
				url: "ajax3.do", // 근데 .do는 뭥미?
				data: {name: $("#name").val(), age: $("#age").val()}, // {key:value, key:value, ...} 형태
				type: "post", // type or method
				success: function(result){
					// v1, v2 = 일반 text/html로 반환
					// $("#output2").text(result);
					
					// v3
					/* console.log(result[0]);
					console.log(result[1]);
					
					const value = "<li>이름: "+result[0]+ "</li>"+"<li>나이: "+result[1]+"</li>";
					$("#output2").html(value); */
					
					// v4. JSONObject
					console.log(result);
					console.log(result.name);
					console.log(result.age);
					
				}, error: function(){
					console.log("연결실패");
				}
			})
		})
	</script>
	
	<h3>3. 서버에 데이터 전송 후, 조회된 데이터를 bean객체로 응답</h3>
	
	검색하고자 하는 회원 ID: <input id="inputId">
	<input type="button" id="btn3" value="조회"><p/>
	
	<div id="output3"></div>
	
	<script type="text/javascript">
		$("#btn3").click(function() {
			$.ajax({
				url : "ajax4.do",
				data : {id : $("#inputId").val()},
				success : function(result) {
					console.log(result);
					
					/*
					// 2.
					if(result.status === "fail") {
						$("#output3").html("<b style='color:red'>" + result.message + "</b>");
					} else {
						const value = "*********** 검색 결과 ***********<br>"
									+ "ID : " + result.userId + "<br>"
									+ "이름 : "  + result.userName + "<br>"
									+ "성별 : "  + result.gender + "<br>"
									+ "EMAIL : "  + result.email;
						$("#output3").html(value);
					}
					*/
					/*
					// 3.
					const value = "*********** 검색 결과 ***********<br>"
						+ "ID : " + result.id + "<br>"
						+ "이름 : "  + result.name + "<br>"
						+ "성별 : "  + result.gender + "<br>"
						+ "EMAIL : "  + result.email;
					$("#output3").html(value);
					*/
					
					// 4.
					if(result.status === "fail") {
						$("#output3").html("<b style='color:red'>" + result.message + "</b>");
					} else {
						const mem = result.member;
						const value = "*********** 검색 결과 ***********<br>"
									+ "ID : " + mem.id + "<br>"
									+ "이름 : "  + mem.name + "<br>"
									+ "성별 : "  + mem.gender + "<br>"
									+ "EMAIL : "  + mem.email;
						$("#output3").html(value);
					}
				},
				error : function() {
					console.log("ajax 통신 실패");
				}
			})
		})
	</script>
	
	<H3>4. 응답데이터로 조회된 여러 bean객체들이 담겨있는 ArrayList받기</H3>
	
	<input type="button" id="btn4" value="전체 회원 조회"><br><br>
	<table id="output4" border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>성별</th>
				<th>Email</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	
	<script>
		$("#btn4").click(function() {
			$.ajax({
				url: "ajax5.do",
				success: function(result){
					console.log(result);
					
					let gen;
					let value ="";
					for(let i=0; i<result.length;i++){
						if(result[i].gender == 1) gen ="남자";
						else gen ="여자";
						
						value += "<tr>"
							+ "<td>" + result[i].id + "</td>"
							+ "<td>" + result[i].name + "</td>"
							+ "<td>" + gen + "</td>"
							+ "<td>" + result[i].email + "</td>"
							+ "</tr>";
					}
					$("#output4 tbody").html(value);
				},
				error: function(){
					console.log("통신 실패");
				}
			})
		})
	</script>
	
<%
	for(int i=0;i<50;i++){
		out.print("<br>");
	}
%>
</body>
</html>




























