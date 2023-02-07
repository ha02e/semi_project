<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>company</title>
<style>
body{
	width:1280px;
	margin:0px auto;
}

span img{
	size:contain;
}

.ib{
	position:relative;
}

.ib_img{
	veritcal-align:middle;
}
.ib_text{
	position:absolute;
	text-align:left;
	top:5%;
	left:5%;
	/*transform: translate(-50%,-50%);*/
	font-size: 25px;
	color:white;
}

.sub_banner{
	align-content:center;
	margin:0px auto;
	dispaly:flex;
	justify-content:space-between;

}

#sub1 Img{
	width:512px;
	height:341px;
	float:left;
}

#sub2 Img{
	width:512px;
	height:341px;
}
</style>
</head>

<body>
<%@include file="header.jsp" %>
<div class="ib">
<div class="ib_img"><img src="/moim/img/company.jpg"></div>
<div class="ib_text"><h1>취향이 만나는 순간</br>
MOIM</h1></div>
</div>

<div class="info">
<h2>취미로 채우는 다채로운 일상</h2>

<h4>
하루 이용시간 한시간,매주 천번의 연결.</br>
누구나 쉽게 가입 가능.</br>
다양하고 즐거운 경험으로 가득한 취미 생활.</h4>

<h5>
현재 '모임'에서는 운동, 게임, 여행,공연 등 다양한 모임이 진행되고 있습니다.</br>
취향이 맞는 사람들과의 만남으로 더욱 더 풍부한 일상을 즐기세요.
</h5>
</div>
<div class="sub_banner">
<div id="sub1">
<img src="/moim/img/sub1.jpg">
</div>
<div id="sub2">
<img src="/moim/img/sub2.jpg">
</div>
</div>


<%@include file="footer.jsp" %>
</body>
</html>