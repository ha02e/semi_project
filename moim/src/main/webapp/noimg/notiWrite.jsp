<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">

<style>
section{
	width:1280px;
	margin:0px auto;
	padding:50px 0;
}
section h2{
	font-size:45px;
	width: 85%;
	margin:0 auto;	
	font-family: 'Black Han Sans', sans-serif;
	font-weight: normal;
	text-align: center;
}
section p{
	font-size: 15px;
	margin:4px 0 20px 0;
	color:#666666;
	text-align: center;
}

.write_table{
	text-align:center;

}
table{
	width:800px;
	border-top:3px solid #333333;
	border-bottom:3px solid #333333;
	padding:10px 20px 20px 20px;
	background:#f6f6f6;
	margin:0 auto;
}
table th{
	text-align:left;
	font-size:18px;
	padding:14px 10px 14px 0;
}
input[type="text"] {
	border: 1px solid #999999; 
	border-radius: 0px; 
	padding:8px;
}
textarea{
	border: 1px solid #999999; 
	border-radius: 0px; 
	padding:8px;
}

.button{
	text-align: center;
	padding:20px 0 40px 0;
}
.button input{
	border:0;
	outline:none;
	width:160px;
	height:40px;
	cursor: pointer;
	background:#999999;
	color:white;
}
.button input[type="submit"]{
	background:#333333;
}
.button input:hover{
	background: #00cdac;
	transition: 0.3s;
}
</style>
<script>
function validate(){
	var content=document.getElementById("content");
	if(content.value==""){
		window.alert('내용을 입력해주세요.');
		content.focus();
		return false;
	}
}
function pageBack(){
	location.href='/moim/noimg/notiList.jsp';
}
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
<article>
<h2>공지사항 작성</h2>
<p>공지사항을 입력해주세요.</p>
<form name="writenoti" action="notiWrite_ok.jsp" method="post" onsubmit="return validate()">

<div class="write_table">
	<table>
	<tr>
		<th>제목</th>
		<td><input type="text" name="subject" size=" 96" placeholder="제목을 입력해주세요"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="2"><textarea name="content" id="content" rows="15" cols="98" placeholder="내용을 입력해주세요" style="resize:none" ></textarea></td>
	</tr>
	</table>
</div>
<div class="button">
	<input type="hidden" name="idx_member" value="<%=session.getAttribute("idx")%>">
	<input type="submit" value="등록하기">
	<input type="button" value="취소하기" onclick="pageBack();">
</div>
</form>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>