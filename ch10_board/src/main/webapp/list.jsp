<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*, java.util.*" %>
<jsp:useBean id="bDao" class="board.BoardDao"/>
<%
	int totalRecord = 0; // 총 레코드 수 
	int numPerPage = 10; // 1페이지당 레코드 수 
	int pagePerBlock = 5; // 블록당 페이지 수 [1][2][3][4][5]
			
	int totalPage = 0; // 총 페이지 수 (총 레코드 수 / 1페이당 레코드 수) 를 올림
	int totalBlock = 0; // 총 블록 수 
	int nowPage=1; // 현재 보고 있는 페이지
	int nowBlock=1; // 현재 보고 있는 블록
	
	int start=0; // DB에서 select 시작번호(한페이지에 필요한 만큼 게시물 가져오기)
	int end=0; // start번호부터 10개 가져오기
	int listSize=0; // 현재 읽어온 게시물 숫
	
	
	String keyWord ="", keyField="";
	if(request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	
	if(request.getParameter("nowPage") != null){
		nowPage= Integer.parseInt(request.getParameter("nowPage"));
	} 
	
	if(request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")){
			keyField="";
			keyWord="";
			
		}
	} 
	
	totalRecord = bDao.getTotalRecord(keyField, keyWord);
	totalPage = (int)Math.ceil(totalRecord / (double)numPerPage);
	totalBlock = (int)Math.ceil(totalPage / (double)pagePerBlock);
	nowBlock = (int)Math.ceil(nowPage/(double)pagePerBlock);
	
	start= nowPage * numPerPage - numPerPage + 1; // 이해해보자
	end= nowPage*numPerPage;
	
%>
<script type="text/javascript">
	function list(){
		document.listFrm.submit();	// 이게 뭔데 
	}
	
	function read(num){
		document.readFrm.num.value=num;
		document.readFrm.action="read.jsp";
		document.readFrm.submit();
	}
	
	function block(value){
		document.readFrm.nowPage.value = <%=pagePerBlock%> * (value - 1) + 1
		document.readFrm.submit();
	}
	
	function pageing(page){
		document.readFrm.nowPage.value=page;
		document.readFrm.submit();
	}
	
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3 align="center">JSP Board</h3>
	<p>Total: <%=totalRecord %>Articles (<%=nowPage %>/<%=totalPage %>page)</p>
	<table border="1" width="700px">
		<tr>
			<th width="5%">번호</th>
			<th width="40%">제목</th>
			<th width="15%">이름</th>
			<th width="20%">날짜</th>
			<th width="10%">조회수</th>
		</tr>
			<%
			ArrayList<Board> alist = bDao.getBoardList(keyField, keyWord, start, end);
			listSize = alist.size();
			
			for(int i=0;i<listSize;i++){
				Board board = alist.get(i);
			%>
				<tr>
					<td class="cen"><%=totalRecord - ((nowPage-1)*numPerPage)-i %></td>
					<td>
					<%
						int depth = board.getDepth();
						if(depth > 0){
							for(int j=0; j<depth; j++){
								out.print("&emsp;");
							}
							out.print("┗");
						}
					%>
						<a href="javascript:read('<%=board.getNum() %>')"><%=board.getSubject() %></a>
					</td>
					<td class="cen"><%=board.getName() %></td>
					<td class="cen"><%=board.getRegdate().substring(0,10) %></td>
					<td class="cen"><%=board.getCount() %></td>
				</tr>	
			<%		
								
			}
			%>
			<tr>
				<td colspan=3 align="left">
				<% 
					int pageStart = (nowBlock-1) * pagePerBlock + 1;
					int pageEnd = (pageStart + pagePerBlock <= totalPage) ? (pageStart + pagePerBlock) : totalPage+1;                                   
					if(totalPage != 1) {
						if(nowBlock > 1) {
				%>
							<a href = "javascript:block('<%=nowBlock-1 %>')">prev...</a>
				<%			
						} 
						for(; pageStart<pageEnd; pageStart++){
				%>
							<a href = "javascript:pageing('<%=pageStart %>')">
							
							<% if(pageStart==nowPage) { %>
								 <font color="blue">[<%=pageStart %>]</font>
							<% } else {%>
								 [<%=pageStart %>]
							<% } %>
							
							</a>
							
				<%	
						}
						if(totalBlock > nowBlock) {
				%>
							<a href = "javascript:block('<%=nowBlock+1 %>')">...next</a>
				<%		
						}
					} // if(totalPage != 1) end
				%>
				</td>
				<td colspan=2 class="right-align">
					<a href = "post.jsp">[글쓰기]</a>&emsp;
					<a href = "javascript:list();">[처음으로]</a>&emsp;
				</td>
			</tr>
	</table>
	<form action="list.jsp" name="searchFrm">
		<select name="keyField">
			<option value = "name">이름</option>
			<option value = "subject">제목</option>
			<option value = "content">내용</option>
		</select>
		<input name="keyWord" requird>
		<input type="submit" value="찾기">
	</form>
	
	<!-- 처음으로 누르면 화면 reload -->
	<form name="listFrm">
		<input type="hidden" name="reload" value="true">
		<input type="hidden" name="nowPage" value="1">
	</form>
	
	<!-- 제목을 누르면 상세보기 페이지로 가기 -->
	<form name="readFrm">
		<input type="hidden" name="num">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
	</form>
</body>
</html>














