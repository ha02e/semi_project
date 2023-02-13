<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*" %>
<%@page import="com.moim.noimg.*" %>
<jsp:useBean id="ndao" class="com.moim.noimg.NoimgDAO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<%
String sidx=request.getParameter("idx");
if(sidx==null||sidx==""){
	sidx="-1";
}
int idx=Integer.parseInt(sidx);

//member 테이블의 manager 값 가져오기(0:사용자/1:관리자)
Integer manager=(Integer)session.getAttribute("manager");
//로그인 안한 경우, manager값 -1로 지정
if(manager==null){
	manager=-1;
}

NoimgDTO dto=ndao.getContent(idx);
if(dto==null){
%>
<script>
window.alert('잘못된 접근입니다\n다시 시도해주세요');
location.href='/listNoti.jsp';
</script>
<%
return;}
%>
<meta charset="UTF-8">
<title><%=dto.getSubject() %></title>
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
	padding-bottom:20px;
}
table{
	width: 85%;
	margin:0 auto 0px auto;
	text-align: center;
	border-collapse: collapse;
}

table th{
	height:46px;
	background: #f3f3f3;
	border-top: 2px solid #4C7C77; 
	border-bottom: 1px solid #4C7C77;
}

table td{
	border-bottom:1px solid gray;
	padding: 10px;
}

table #subject{
	width:70%;
	text-align:left;
	font-size: 20px;
	padding-left:30px;
}
table #writedate{
	width:30%;
	font-size: 15px;
	text-align:center;
	font-weight: normal;
}
table #content{
	text-align:left;
	padding:40px 30px;
	vertical-align: top;
}

table div{
	display:inline;
}

.button{
	text-align: center;
	padding:20px 0 40px 0;
}
.button input{
	border:0;
	outline:none;
	width:120px;
	height:40px;
	cursor: pointer;
	background:#999999;
	color:white;
}
input.list-btn{
	background:#333333;
}
.button input[type="submit"]{
	background:#999999;
}
.button input:hover{
	background: #00cdac;
	transition: 0.3s;
}
</style>



<script>
/*manager 값이 1이면 버튼(#a:수정, #b:삭제) 노출 <-> 0일 경우, 숨기기*/
function write_button(){
	var manager=<%=manager%>;
	if(manager==1){
		document.getElementById("a").style.display="inline-block";
		document.getElementById("b").style.display="inline-block";
	}else{
		document.getElementById("a").style.display="none";
		document.getElementById("b").style.display="none";
	}
	
} 
</script>

</head>
<body  onload="write_button();">
<%@include file="/header.jsp"%>
	<section >
		<article>
		<h2>공지사항</h2>

			<table>
				<thead>
					<tr>
						<th id="subject">제목: <%=dto.getSubject()%></th>
						<th id="writedate">작성일: <%=dto.getWritedate() %></th>
					</tr>
				<tbody>
					<tr>
					<td colspan="2" id="content"><%=dto.getContent().replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			<div class="button">
				<form name="update1" action="notiUpdate.jsp">
					<input type="hidden" name="idx" value="<%=dto.getIdx() %>">
					<input type="hidden" name="subject" value="<%=dto.getSubject() %>">
					<input type="hidden" name="content" value="<%=dto.getContent()%>">
					<input type="submit" value="수정" id="a">
					<input type="button" value="삭제" id="b" 
						onclick="javascript:location.href='notiDel.jsp?idx=<%=dto.getIdx()%>'">
					<input type="button" value="목록" id="c" class="list-btn" onclick="javascript:location.href='notiList.jsp?idx_info=<%=dto.getIdx_info()%>&category=<%=dto.getCategory()%>'">
				</form>
			</div>
		</article>
	</section>
<%@include file="/footer.jsp" %>
</body>
</html>