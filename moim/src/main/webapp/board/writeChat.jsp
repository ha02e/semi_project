<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moim.member.*" %>
<%@ page import="com.moim.noimg.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<jsp:useBean id="mdao" class="com.moim.member.MemberDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">

<style>
section{
	width:800px;
	margin:0 auto;
	padding:50px 0;
}
section h2{
	font-size:45px;
	width: 85%;
	margin:0 auto 20px auto;	
	font-family: 'Black Han Sans', sans-serif;
	font-weight: normal;
	text-align: center;
}

table{
	width:800px;
	border-top:3px solid #333333;
	border-bottom:3px solid #333333;
	padding:10px 20px 20px 20px;
	background:#f6f6f6;
}
table th{
	text-align:left;
	font-size:18px;
	padding:14px 10px 14px 0;
}
table td{
	padding:4px 0;
}
select{
	width: 100px; 
	padding: 6px 18px; 
	border: 1px solid #999999; 
	border-radius: 0px; 
	font-size: 14px;
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
	var subject=document.getElementById("subject");
	var content=document.getElementById("content");
	
	if(subject.value=="" || subject==null){
		window.alert('제목을 입력해주세요');
		subject.focus();
		return false;
	}
	if(content.value=="" || content==null){
		window.alert('내용을 입력해주세요');
		return false;
	}
}
</script>
</head>
<%
Integer idx=(Integer)session.getAttribute("idx");
if(idx==null){
	idx=0;
}

int idx_info=0;
if(request.getParameter("idx_info")!=null&&!request.getParameter("idx_info").equals("")){
	idx_info=Integer.parseInt(request.getParameter("idx_info"));
}

int idx_member=0;
if(request.getParameter("idx_member")!=null&&!request.getParameter("idx_member").equals("")){
	idx_member=Integer.parseInt(request.getParameter("idx_member"));
}
MemberDTO dto=mdao.getMem(idx);
%>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h2>모임게시판 글쓰기</h2>
		<form name="writeChat" action="writeChat_ok.jsp" onsubmit="return validate()">
		<input type="hidden" name="idx_member" value="<%=idx_member%>">
		<input type="hidden" name="idx_info" value="<%=idx_info%>">
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" value="<%=dto.getName()%>"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="subject" id="subject" size="52" placeholder="제목을 입력해주세요.">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="4">
					<textarea name="content" id="content" rows="10" cols="80" placeholder="내용을 입력해주세요." style="resize:none" ></textarea>
				</td>
			</tr>
		</table>
		<div class="button">
			<input type="submit" value="글쓰기">
		</div>
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>