<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {text-align:center;}
	img {width: 630px;}
	table {border:2px solid; width: 600px; border-collapse:collapse;}
	th, td{border: 1px solid;}
</style>
</head>
<body>
	<img src="../resources/img/11.PNG">
	<table align="center" id="reply">
		<thead>
			<tr>
				<th>댓글 작성</th>
				<td>
					<textarea rows="3" cols="50" id="replyContent"></textarea>
				</td>
				<td>
					<input type="button" id="replyBtn" value="댓글 등록">
				</td>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	
	<script type="text/javascript">
		$(() => {
			replyList();
			setInterval(replyList,1000);
		})
		
		function replyList(){
			$.ajax({
				url: "rlist.do",
				data: {bno: "1"},
				success: function(list){
					console.log(list);
					
					let value = "";
					for(let i=0; i<list.length; i++){
						value += "<tr>" 
							   + "<td>" + list[i].name +"</td>"
							   + "<td>" + list[i].content+"</td>"
							   + "<td>" + list[i].redate.substring(0,10)+"</td></tr>";
					}
					$("#reply tbody").html(value);
					
					
				},
				error: function(){
					console.log("연결 실패");
				}
			})
		}
		
		$("#replyBtn").click(function(){
			$.ajax({
				url: "rinsert.do",
				data: {
					content: $("#replyContent").val(),
					bno: 1,
					name: "남궁용진"
				},
				type: "post",
				success: function(result){
					console.log(result);
					if(result > 0) {
						replyList();
						$("#replyContent").val("");
					}
				},
				error: function() {
					console.log("연결 실패");
				}
			})
		}) 
	</script>
</body>
</html>















