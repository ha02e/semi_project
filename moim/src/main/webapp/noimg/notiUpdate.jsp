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
<title>공지사항 수정</title>
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

.update_table{
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


</head>
<body>
<%@include file="/header.jsp" %>
<section>
<h2>공지사항</h2>
<form name="update2" action="notiUpdate_ok.jsp" >
<div class="update_table">
<table>
<tr>
<th>제목</th>
<input type="hidden" name="idx" value="<%=idx %>">
<td><input type="text" name="subject" value="<%=subject%>"></td>
</tr>
<tr>
<td colspan="2"><textarea name="content" rows="15" cols="100"><%=content%></textarea></td>

</tr>
</table>
<div class="button"><input type="submit" name="update" value="등록"></div>
</form>
</div>
</section>

<%@include file="/footer.jsp" %>
</body>
</html>