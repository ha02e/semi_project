<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moim.member.*" %>
<%@ page import="com.moim.noimg.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<jsp:useBean id="mdao" class="com.moim.member.MemberDAO" scope="session"></jsp:useBean>
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

NoimgDTO dto=mdao.getContent(idx,3);
if(dto==null){
	%>
	<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	location.href='moimChat.jsp';
	</script>
	<%
	return;
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	margin:0 auto 20px auto;	
	font-family: 'Black Han Sans', sans-serif;
	font-weight: normal;
	text-align: center;
}

table{
	width: 85%;
	margin:0 auto 0px auto;
	text-align: center;
	border-top: 2px solid #4C7C77; 
	padding:10px 20px 20px 20px;
	background:#f6f6f6;
	border-collapse: collapse;
	
}
table th{
	text-align:left;
	font-size:18px;
	border-right:1px solid gray;
	border-bottom:1px solid gray;
	padding: 10px 30px;
	width:100px;
	
}
table td{
	border-bottom:1px solid gray;
	padding: 10px;
	padding: 10px 30px;
	text-align:left;
}
.num{
	border-right:1px solid gray;
}
table .content{
	text-align:left;
	padding:40px 30px;
	vertical-align: top;
}


.button{
	text-align: center;
	padding:20px 0 40px 0;
	display: flex;
	justify-content: space-around;
	width:440px;
	margin:0 auto;
	font-size: 14px;
}
.button a{
	display:inline-block;
	width:120px;
	height:40px;
	line-height:40px;
	cursor: pointer;
	background:#999999;
	color:white;
	text-decoration: none;
}
.list-btn a{
	background:#333333;
}
.button a:hover{
	background: #00cdac;
	transition: 0.3s;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h2>모임게시판 보기</h2>
		<table>
			<tr>
				<th>번호</th>		
				<td class="num"><%=dto.getIdx() %></td>
				<th>작성날짜</th>
				<td><%=dto.getWritedate() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td colspan="4"><%=dto.getWriter() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><%=dto.getSubject() %></td>
			</tr>
			<tr height="150">
				<td colspan="4" class="content">
					<%=dto.getContent().replaceAll("\n", "<br>") %>
				</td>
			</tr>

		</table>
			<div class="button">
				<div><a href="moimChatUpdate.jsp?idx=<%=dto.getIdx() %>&writer=<%=dto.getWriter()%>&subject=<%=dto.getSubject()%>&content=<%=dto.getContent()%>&idx_info=<%=idx_info %>">수정</a></div> 
				<div><a href="writeReChat.jsp?subject=<%=dto.getSubject()%>&ref=<%=dto.getRef()%>&lev=<%=dto.getLev()%>&sunbun=<%=dto.getSunbun()%>">답변</a></div>
				<div class="list-btn"><a href="moimChat.jsp?idx=<%=idx_info%>">목록</a></div>
			</div>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>