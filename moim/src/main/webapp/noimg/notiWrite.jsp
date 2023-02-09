<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notiWrite</title>
<style>
body{
	width:1280px;
}

section{
	width:800px;
	margin:0 auto;
}

section h2{
	margin:40px 0 0 0;
}
section p{
	font-size: 14px;
	margin:10px 0 20px 0;
	color:#666666;
}

.write_table{
	text-align:center;

}
table{
	border:1px solid gray;
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
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
<article>
<h2>공지사항 작성</h2>
<p>공지사항을 입력해주세요</p>
<form name="writenoti" action="notiWrite_ok.jsp" method="post" onsubmit="return validate()">

<div class="write_table">
<table>
<tr>
<th>제목</th>
<td><input type="text" name="subject" size=" 100" placeholder="제목을 입력해주세요"></td>
</tr>
<tr>
<td colspan="2"><textarea name="content" id="content" rows="15" cols="100" placeholder="내용을 입력해주세요"></textarea></td>
</tr>
</table>
</div>
<input type="hidden" name="idx_member" value="<%=session.getAttribute("idx")%>">
<div class="button"><input type="submit" value="등록"></div>
</form>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>