<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	height:30px;
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
.paging ul{
	text-align:center;
	margin-bottom:0;
}
.paging ul li{
	display:inline;
}
</style>
<script>
function moimApply(){
	var w=320;
	var h=340;
	 
	// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	var left = Math.ceil(( window.screen.width - w )/2);
	var top = Math.ceil(( window.screen.height - h )/2); 
	 
	window.open('/moim/stat/reqMem.jsp','reqMem', 'width='+w+', height='+h+', left='+left+', top='+top );
}
function qnaWrite(){
	var w=320;
	var h=340;
	 
	// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	var left = Math.ceil(( window.screen.width - w )/2);
	var top = Math.ceil(( window.screen.height - h )/2); 
	 
	window.open('/moim/noimg/qnaWrite.jsp','qnaWrite', 'width='+w+', height='+h+', left='+left+', top='+top );
}
</script>
</head>
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
	<form name="qna">
	<table class="qnabbs">
		<thead>
			<tr>
				<th>작성자</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
		<%
		
		%>
			<tr>
				<td>홍길동</td>
				<td>서울 어디서 만나나요?</td>
				<td>2023.01.27</td>
			</tr>
		</tbody>
	</table>
	<div class="paging">
		<ul>
			<li>&lt;&lt;</li>
			<li>1</li>
			<li>2</li>
			<li>3</li>
			<li>4</li>
			<li>5</li>
			<li>&gt;&gt;</li>
		</ul>
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