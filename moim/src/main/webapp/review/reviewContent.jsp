<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.moim.review.* "%>
<jsp:useBean id="rdao" class="com.moim.review.ReviewDAO" scope="session"></jsp:useBean>
<%
String idx_s = request.getParameter("idx");
if (idx_s == null || idx_s.equals("")) {
	idx_s = "0";
}

int idx = Integer.parseInt(idx_s);
ReviewDTO dto = rdao.getContent(idx);
if (dto == null) {
%>
<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다');
	location.href = 'reviewList.jsp';
</script>
<%
// 더이상 자바코드가 번역되지 않도록
return;
}
%>
<!DOCTYPE html>
<html>
<head>
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
	border-bottom: 2px solid #4C7C77; 
}


section .moiminfo {
	width: 85%;
	display: flex;
	align-items:center;
	justify-content:space-around;
	margin:0 auto 30px auto;
	border-bottom: 1px solid #4C7C77;
	padding-bottom:30px;
	
}
h3{
	width:80%;
	margin:30px auto 14px auto;
	font-size:32px;
}
.moimimg {
	padding: 10px 0;
	width: 30%;
	margin-left:20px;
}
.moimtext{
	width: 50%;
}
section .img {
	width: 300px;
	height: 240px;
	position: relative;
	overflow: hidden;
}

section .img img {
	position: absolute;
	height:100%;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.moim-content {
	width: 100%;
	height: 130px;
	overflow: auto;
	word-wrap: break-word;
}
.moimtext td{
	width:200px;
}
.con-icon1 {
	display: inline-block;
	width: 18px;
	height: 18px;
	vertical-align: top;
	background-image: url("/moim/img/icon01.png");
	background-size: cover;
}
.con-icon2 {
	display: inline-block;
	width: 18px;
	height: 18px;
	vertical-align: top;
	background-image: url("/moim/img/icon02.png");
	background-size: cover;
}
.con-icon3{
	display: inline-block;
	width: 18px;
	height: 18px;
	vertical-align: top;
	background-image: url("/moim/img/icon03.png");
	background-size: cover;
}
.moiminfo table {
	width: 100%;
	margin: 0 10px;
	border-spacing: 12px;
}

.moiminfo table td {
	padding: 4px 6px;
	border: 2px solid #ebedee;
	border-radius: 4px;
	background: #f8f8f8;
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
	<%@include file="/header.jsp"%>
<section>
	<article>
		<h2>모임 후기 보기</h2>
			
	<input type="hidden" name="idx" value="<%=idx%>">
	
	<h3><%=dto.getSubject()%></h3>
	<div class="moiminfo">
		<div class="moimContent moimimg">
	<%
	if (dto.getImg() == null || dto.getImg().equals("")) {
	%>
				<div class="img">
					<img alt="이미지" src="/moim/img/noimg.png">
				</div>

				<%
	} else {
				%>
				<div class="img">
					<img alt="이미지" src="img/<%=dto.getImg()%>">
				</div>

				<%
	}
				%>		
		</div>
		<table class="moimContent moimtext">
			<tr>
				<td><span class="con-icon1"></span>&nbsp;모임명 : <%=dto.getMoimname()%></td>
			</tr>
			<tr>
				<td><span class="con-icon2"></span>&nbsp;지역 : <%=dto.getLocal()%></td>
			</tr>
			<tr>
				<td>
					<div class="moim-content">
						<span class="con-icon3"></span>&nbsp;내용 :<br>
						<%=dto.getContent().replaceAll("\n", "<br>")%>
					</div>
				</td>
			</tr>
		</table>							
	</div>
	<div class="button">
		<div>
			<a href="javascript:location.href='updateReview.jsp?idx=<%=idx%>'">수정</a>
		</div>
		<div>
			<a href="javascript:location.href='reviewDel.jsp?idx=<%=idx%>'">삭제</a>
		</div>
		<div class="list-btn">
			<a href="reviewList.jsp">목록</a>
		</div>
		</div>

	</article>

</section>
<%@include file="/footer.jsp"%>
</body>
</html>