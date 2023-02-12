<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.mymenu {
	position:flex;
    display: block;
    width: 200px;
    height: 520px;
    background-color: #efefef;
    color: black;
    border-radius: 20px;
    padding: 10px;
    box-sizing: 500px;
	float:left;
	margin-left:30px;
	
}
.mymenu ul{
	list-style: none;
	margin: 40px 0;
}
.mymenu ul a{
	text-decoration: none;
}
.mymenu ul a:visited{
	color:#333333;
}

.mymenu img{
	width:150px;
	margin: 0 auto;
    display: block;
}
.mymenu p{
	text-align: center;
}
</style>
</head>
<%
//이름 수정
String name2=(String)session.getAttribute("name");
%>
<body>
<div class="side-menu">
	<div class="mymenu">
		<img src="/moim/img/myinfo.png" alt="마이페이지">
		<p><b><%=name2 %></b>님</p>
		<ul>
		<li><a href="/moim/board/myInfo.jsp" class="item"><h3>내 정보 변경</h3></a></li>
		<li><a href="/moim/board/myWriting.jsp" class="item"><h3>내가 쓴 글</h3></a></li>
		<li><a href="/moim/board/myMoim.jsp" class="item"><h3>참여중인 모임</h3></a></li>
		</ul>
	</div>
</div>
</body>
</html>