<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@page import="com.moim.noimg.*" %>
<jsp:useBean id="ndto" class="com.moim.noimg.NoimgDTO"></jsp:useBean>


<%
String sidx=request.getParameter("idx");
if(sidx==null||sidx==""){
	sidx="0";
}
int idx=Integer.parseInt(sidx);

String subject=request.getParameter("subject");
String content=request.getParameter("content");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notiUpdate</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">

<style>
section{
	width:1280px;
	margin:0px auto;
	padding:50px 0;
}
h2{
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
function pageBack(){
	location.href='/moim/noimg/notiList.jsp';
}
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
<h2>공지사항 수정하기</h2>
<p>수정할 공지사항 내용을 입력해주세요.</p>
<form name="update2" action="notiUpdate_ok.jsp" >
<div class="update_table">
	<table>
		<tr>
			<th>제목</th>
			<input type="hidden" name="idx" value="<%=idx %>">
			<td><input type="text" name="subject" value="<%=subject%>" size=" 96" ></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="2"><textarea name="content" rows="15" cols="98" style="resize:none" ><%=content%></textarea></td>
		</tr>
	</table>

<div class="button">
	<input type="submit" name="update" value="등록">
	<input type="button" value="취소하기" onclick="pageBack();">
</div>
</div>
</form>
</section>

<%@include file="/footer.jsp" %>
</body>
</html>