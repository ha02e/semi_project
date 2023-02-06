<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<style>

#footer {
	height:150px;
	background-color:gray;
	margin: auto;
	padding-bottom: 10px;
	display:flex;
	align-items:center;
}

#footer #brand{
	margin-left: 30px;
	flex:1;
}

#footer li{
	list-style-type:none;
}

#footer #info {
	margin-right:30px;
}

</style>
</head>
<body>
<div id="footer">
<div id="brand">
<h1>MOIM</h1>
</div>
<div id="info">
<ul>
	<li>서울특별시 서대문구 대현동</li>
	<li>TEL : 02-123-4567</li> 
	<li>Email:moim@moininc.com</li>
	<li>COPYRIGHT &copy MOIM INC. ALL RIGHTS RESERVED</li>
</ul>
</div>
</div>
</body>
</html>