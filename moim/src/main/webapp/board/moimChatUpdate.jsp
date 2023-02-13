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
<title>Insert title here</title><link rel="preconnect" href="https://fonts.googleapis.com">
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
</head>
<%

String idx_s=request.getParameter("idx");
if(idx_s==null||idx_s.equals("")){
	idx_s="0";
}
int idx=Integer.parseInt(idx_s);
String idx_info_s=request.getParameter("idx_info");
if(idx_info_s==null||idx_info_s.equals("")){
	idx_info_s="0";
}
int idx_info=Integer.parseInt(idx_info_s);
String writer=request.getParameter("writer");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
MemberDTO dto2=mdao.getMem(idx);
%>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h2>모임게시판 글 수정하기</h2>
		<form name="moimChatUpdate" action="moimChatUpdate_ok.jsp" enctype="UTF-8">
		<input type="hidden" name="idx" value="<%=idx%>">
		<input type="hidden" name="idx_info" value="<%=idx_info%>">
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" value="<%=writer%>"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="subject" size="52" value="<%=subject%>">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="4">
					<textarea rows="10" cols="80" name="content" style="resize:none" ><%=content%></textarea>
				</td>
			</tr>
		</table>
			<div class="button">
				<input type="submit" value="수정하기">
			</div>
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>