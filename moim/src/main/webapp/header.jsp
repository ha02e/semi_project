<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>
<style>

body{
	margin:0px auto;	
}

.id{
	text-align:right;
	font-weight:bold;
	margin:20px 30px;
}

.navbar{
	height: 80px;
	border-top: 2px solid gray;
	border-bottom: 2px solid gray;
	display:flex;
	align-items:center;
	/*padding:5px 12px;*/
}


.navbar_ul{
	display:flex;
	align-items:center;
	/*text-align:center;*/
}

.navbar_ul li { 
	list-style-type:none;
	width: 280px;
	text-align:center;
	display: inline;
	font-weight:bold;
	padding:2px 12px;
	/*margin-left:10px;*/
}

.navbar_ul Img{
	width:81px;
	height:62px;
	float:left;
	margin-left:20px;
}

</style>
</head>
<body>
<div class="id">로그인 | 회원가입</div>
<nav class="navbar">
<ul class="navbar_ul">
<li><img src="/webTest/img/logo.png" alt="로고"></li>
<li>회사소개</li>
<li><a href="/moim/info/infoList.jsp">모임하기</a></li>
<li>후기보기</li>
<li>공지사항</li>
</ul>

</nav>
</body>
</html>