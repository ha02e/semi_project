<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>company</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;900&family=Paytone+One&display=swap" rel="stylesheet">

<style>
section{
	width:1280px;
	margin:0px auto;
}

.ib_img h3{
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: normal;
	font-size: 32px;
	margin:-30px 0;

}
.ib_img h2{
	font-family: 'Paytone One', sans-serif;
	font-weight: normal;
	font-size: 110px;
	letter-spacing :6px;
	margin:0;
}
.ib_img{
	width: 100%;
	height:500px;
	background-image: url("/moim/img/moim_company.jpg");
	background-size: cover;
	background-attachment: fixed;
	background-repeat:no-repeat;
	background-position:center;
	position:relative;
	margin:0 auto;
	
}
.ib_bg{
	width: 100%;
	height: 100%;
	background: #111111;
	opacity: 0.6;
	position:absolute;
	z-index: 20;
	transition:all 0.4s;
}
.ib_text{
	position:absolute;
	top:50%;
	left:50%;
	transform: translate(-50%,-50%);
	color:white;
	z-index: 50;
	text-align: center;
}
.ib_bg:hover{
	opacity:0.2;
}

.info{
	width:1280px;
	margin: 0 auto;
	padding:80px 0;
	text-align: center;
	background: white;
}
.info h2{
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 900;
	font-size: 46px;
	margin:0;
}
.info h3{
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: normal;
	font-size: 24px;
	margin:50px 0 20px 0;
}

.sub_banner{
	width:1280px;
	margin:0px auto;
}

#sub1{
	width:640px;
	height:360px;
	background-image: url("/moim/img/sub1.jpg");
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	display: inline-block;
	float: left;
}

#sub2{
	width:640px;
	height:360px;
	background-image: url("/moim/img/sub2.jpg");
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	display: inline-block;
	float: left;
}

.info2{
	clear:both;
	width:1280px;
	margin: 0 auto;
	padding: 80px 0;
	text-align: center;
	background: white;
}
.info2 h4{
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
	font-size: 24px;
	color:#2DC6A2;
}


</style>
</head>

<body>
<%@include file="header.jsp" %>
<section>
<div class="ib_img">
	<div class="ib_bg"></div>
	<div class="ib_text">
		<h3>취향이 만나는 순간</h3>
		<h2>MOIM</h2>
	</div>
</div>

<div class="info">
	<h2>취미로 채우는 다채로운 일상</h2>
	
	<h3>
	하루 이용시간 한시간, 매주 천번의 연결.</br>
	누구나 쉽게 가입 가능.</br>
	다양하고 즐거운 경험으로 가득한 취미 생활.</h3>
</div>

<div class="sub_banner">
	<div id="sub1">
	</div>
	<div id="sub2">
	</div>
</div>

<div class="info2">

	<h4>
	현재 '모임'에서는 운동, 게임, 여행, 공연 등 다양한 모임이 진행되고 있습니다.</br>
	취향이 맞는 사람들과의 만남으로 더욱 더 풍부한 일상을 즐기세요.
	</h4>

</div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>