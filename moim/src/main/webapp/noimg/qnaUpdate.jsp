<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moim.noimg.*" %>
<%@ page import="com.moim.info.*" %>

<%
Integer idx = (Integer) session.getAttribute("idx");
if (idx==null) {
%>
<script>
	window.alert('로그인 후 이용가능합니다');
	location.href = '/moim/info/moimContent.jsp';
</script>
<%
return;
}
%>  

<jsp:useBean id="mdto" class="com.moim.noimg.NoimgDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>

<jsp:useBean id="mdto2" class="com.moim.info.InfoDTO" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao2" class="com.moim.info.InfoDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{
	width:800px;
	margin:0 auto;
}
section h2{
	margin:50px 0 10px 0;
}
section .moiminfo{
	width:800px;
	height:240px;
	display: flex;
	padding-bottom:30px;
	border-bottom:1px solid #999999;
}
.moimimg{
	padding:10px 0;
}
section .img{
	width:284px;
	height:226px;
	position: relative;
	overflow: hidden;
}
section .img img{
	position:absolute;
	width: 100%;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);

}
.moim-content{
	width:320px;
	height:130px;
	overflow:auto;
	word-wrap:break-word;
}
.con-icon1{
	display:inline-block;
	width:18px;
	height:18px;
	vertical-align: top;
	background-image: url("/moim/img/icon01.png");
	background-size: cover;
}
.con-icon2{
	display:inline-block;
	width:18px;
	height:18px;
	vertical-align: top;
	background-image: url("/moim/img/icon02.png");
	background-size: cover;
}
.moiminfo table{
	width:650px;
	margin:0 10px 0 6px;
	border-spacing:10px;
}
.moiminfo table td{
	padding:4px 6px;
	border:2px solid #f0f0f0;
	border-radius: 4px;
	background:#f8f8f8;
}

section .button{
	display:flex;
	flex-direction: column;
}
section .button div{
	margin:10px;
	align-items: center;
}
.button a:link, a:visited{
	background-color: #999999;
	color:white;
    width:90px;
    heigth:30px;
    padding: 10px 20px;
    border-radius:6px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size:14px;
}


.qnaUpdate-form h2{
	margin:30px 0 10px 0;
}
.qnaUpdate-form table{
	padding: 10px 20px;
}
table th{
	text-align:left;
	font-size:18px;
	padding:0px 0 6px 0;
}
table td input{
	margin-bottom:10px;
}

input[type="text"] {
	border: 1px solid #999999; 
	border-radius: 0px; 
	padding:8px;
	margin-bottom:20px;
}
textarea{
	border: 1px solid #999999; 
	border-radius: 0px; 
}
.update-btn{
	text-align: center;
	padding:20px 0 40px 0;
}
.update-btn input{
	border:0;
	outline:none;
	width:160px;
	height:40px;
	cursor: pointer;
	background:#999999;
	color:white;
}
.update-btn input[type="submit"]{
	background:#333333;
}
.update-btn input:hover{
	background: #00cdac;
	transition: 0.3s;
}
</style>
<script>
function pageBack(){
	location.href='/moim/info/moimContent.jsp';
}
</script>
</head>
<%
/**
String idx_s=request.getParameter("idx");
if(idx_s==null || idx_s.equals("")){
	idx_s="0";
}*/
int idx_i=15;
//int idx_i=Integer.parseInt(idx_s);
InfoDTO dto=mdao2.getInfo(idx_i);
%>
<%
//String idx=request.getParameter("idx");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
%>
<body>
<%@include file="/header.jsp" %>
<section>
<article>
	<h2><%=dto.getMoimname()%></h2>
		<div class="moiminfo">
			<div class="moimContent moimimg">
				<div class="img"><img src="/moim/userimg/<%=dto.getImg()%>"></div>
			</div>	
			<table class="moimContent">
				<tr class="moimtext">
					<td><span class="con-icon1"></span>&nbsp;지역 : <%=dto.getLocal()%></td>
	            </tr>
	            <tr class="moimtext">
					<td><span class="con-icon2"></span>&nbsp;인원 : 1/<%=dto.getMaxmem() %></td>
	            </tr>
	            <tr class="moimtext">
					<td>
						<div class="moim-content">
							<span class="con-icon3"></span>
							내용 :<br>
							<%=dto.getContent().replaceAll("\n","<br>") %>
						</div>
					</td>
	            </tr>
	         </table>
	      <div class="button">
	         <div><a href="">채팅하러 가기</a></div>
	         <div><a href="javascript:moimApply()">참여하기</a></div>
	         <div><a href="">탈퇴하기</a></div>
	      </div>
      </div>
</article>

<article class="qnaUpdate-form">
	<h2>QnA 글 수정하기</h2>
	<form name="qnaUpdate" action="qnaUpdate_ok.jsp">
	<input type="hidden" name="idx" value="<%=mdto.getIdx() %>">
	<table>
		<tr>
			<th>제목</th>
		</tr>
		<tr>
			<td>
				<input type="text" name="subject" size="80" value="<%=mdto.getSubject()%>">
			</td>
		</tr>
		<tr>
			<th>내용</th>
		</tr>
		<tr>
			<td>
				<textarea name="content" rows="6" cols="108"><%=mdto.getContent()%></textarea>
			</td>
		</tr>
	</table>
	<div class="update-btn">
		<input type="button" value="취소하기" onclick="pageBack()">
		<input type="submit" value="작성하기" class="abutton">
	</div>
</form>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>