<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.moim.noimg.*" %>

<jsp:useBean id="mdto" class="com.moim.noimg.NoimgDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.moim.noimg.NoimgDAO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{
	width:800px;
	margin:0 auto;
}
section h2{
	
}
section .content{
	display:flex;
	margin:0 auto;
	width:800px;
	padding:10px 0 30px 0;
}
section .moiminfo{
	width:600px;
}
section .img{
	background:gray;
	width:240px;
	height:160px;
	/*margin:0 auto 10px auto;*/
}

section .moiminfo table{
	width:600px;
	border:1px solid #eeeeee;
}
section .moiminfo table th{
	text-align:left;
	font-size:18px;
	padding-right:10px;
}
section .moiminfo table td{
	padding:4px 0;
}
section .button{
	width:200px;
	padding:0 20px;
	display:flex;
	flex-direction: column;
}
section .button div{
	margin:10px;
	align-items: center;
}
.button a:link, a:visited{
	background-color: #999999;
	color:white;
    width:110px;
    heigth:30px;
    padding: 10px 20px;
    border-radius:6px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size:14px;
}
.qnabbs{
	width:800px;
	text-align:center;
	border-collapse: collapse;
}
.qnabbs td,th{
	border-top:1px solid #999999;
	border-bottom:1px solid #999999;
	height:34px;
}
.qnasubject{
	text-align:left;
	padding-left:20px;
}
.rebutton{
	background-color: #999999;
	color:white;
    width:48px;
    heigth:16px;
    padding:4px 6px;
    border-radius:4px;
    font-size:12px;
}
.rebutton a:link, a:visited{
	text-decoration: none;
	cursor:pointer;
	color:white;
}
.writebutton{
	text-align:right;
	margin:0 0 20px 0;
}
.writebutton input{
	border:0;
	outline:none;
	width:100px;
	height:30px;
	cursor: pointer;
}
.paging{
	text-align:center;
	margin:10px 0 0 0;
}
.paging a:link, a:visited{
	color:#333333;
    text-decoration: none;
    font-size:13px;
}
</style>
<script>
function moimApply(){
	var w=320;
	var h=340;
	 
	// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	var left=Math.ceil((window.screen.width-w)/2);
	var top=Math.ceil((window.screen.height-h)/2); 
	 
	window.open('/moim/stat/reqMem.jsp', 'reqMem', 'width='+w+', height='+h+', left='+left+', top='+top);
}
function qnaWrite(){
	var w=320;
	var h=340;
	 
	// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	var left=Math.ceil((window.screen.width-w)/2);
	var top=Math.ceil((window.screen.height-h)/2);  
	 
	window.open('/moim/noimg/qnaWrite.jsp', 'qnaWrite', 'width='+w+', height='+h+', left='+left+', top='+top);
}
function qnaReWrite(){
	var w=320;
	var h=340;
	 
	// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	var left=Math.ceil((window.screen.width-w)/2);
	var top=Math.ceil((window.screen.height-h)/2);  
	window.open('/moim/noimg/qnaReWrite.jsp', 'qnaReWrite', 'width='+w+', height='+h+', left='+left+', top='+top);
}
/**
function qnaDisplay(){
	var qna=document.getElementById('qnacontent');
    if(qna.style.display=='none'){ 		
    	qna.style.display = 'block'; 	
    }else{ 		
    	qna.style.display = 'none'; 	
    } 
}*/
</script>
</head>
<%
int idx_info=0;
int totalCnt=mdao.getTotalCnt(idx_info);
int listSize=5;
int pageSize=5;

String cp_s=request.getParameter("cp");
if(cp_s==null || cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);

int totalPage=(totalCnt/listSize)+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>
<body>
<%@include file="/header.jsp" %>
<section>
<article>
	<h2>홍대 독서모임</h2>
	<div class="content">
		<div class="moiminfo">
		<form name="moimContent">
			<table>
				<tr>
					<td rowspan="4" class="moimimg">
						<div class="img"></div>
					</td>
				</tr>
				<tr>
					<td>지역 : 서울</td>
				</tr>
				<tr>
					<td>인원 : 1/4</td>
				</tr>
				<tr>
					<td>
						내용~~~~<br>
						독서에 관심 있는 분들 모집합니다!<br>
						비용은 없습니다.
					</td>
				</tr>
			</table>
		</form>
		</div>
		<div class="button">
			<div><a href="">채팅하러 가기</a></div>
			<div><a href="javascript:moimApply()">참여하기</a></div>
			<div><a href="">탈퇴하기</a></div>
		</div>
	</div>
</article>
<article>
	<h2>QnA</h2>
	<form name="qna" method="post">
	<table class="qnabbs">
		<thead>
			<tr>
				<th>작성자</th>
				<th>제목</th>
				<th>날짜</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<%
		//int idx_info=0;
		ArrayList<NoimgDTO> arr=mdao.getQnaList(idx_info,listSize,cp);
		if(arr==null || arr.size()==0){
			%>
			<tr>
				<td colspan="3" text-align="center">등록된 글이 없습니다.</td>
			</tr>
			<%
		}else{
			for(int i=0;i<arr.size();i++){
				%>
				<tr>
					<td><%=arr.get(i).getWriter() %></td>
					<td class="qnasubject"><%=arr.get(i).getSubject() %></td>
					<td><%=arr.get(i).getWritedate() %></td>
					<td>
						<div class="rebutton"><a href="javascript:qnaReWrite();">답변작성</a></div>
					</td>
				</tr>
				<%
			}
		}
		%>
		</tbody>
	</table>
	<div class="paging">
		<%
		if(userGroup!=0){
			%>
			<a href="moimContent.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
			<%
		}
		%>
		<%
		for(int i=userGroup*pageSize+1;
				i<=userGroup*pageSize+pageSize;i++){
			%>
			&nbsp;&nbsp;<a href="moimContent.jsp?cp=<%=i %>"><%=i %></a>&nbsp;&nbsp;
			<%
			if(i==totalPage)break;
		}
		%>
		<%
		if(userGroup!=((totalPage/pageSize)-(totalPage%pageSize==0?1:0))){
			%>
			<a href="moimContent.jsp?cp=<%=(userGroup+1)*pageSize+1 %>">&gt;&gt;</a>
			<%
		}
		%>
	</div>
	<div class="writebutton">
		<input type="submit" value="글작성" onclick="qnaWrite()">
	</div>
	</form>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>