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
<title>Insert title here</title>
</head>
<style>
section {
	width: 800px;
	margin: 0 auto;
}

section h2 {
	margin: 50px 0 10px 0;
}

section .moiminfo {
	width: 800px;
	height: 240px;
	display: flex;
	margin-bottom: 30px;
}

.moimimg {
	padding: 10px 0;
}

section .img {
	width: 284px;
	height: 226px;
	position: relative;
	overflow: hidden;
}

section .img img {
	position: absolute;
	width: 100%;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.moim-content {
	width: 320px;
	height: 130px;
	overflow: auto;
	word-wrap: break-word;
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

.moiminfo table {
	width: 650px;
	margin: 0 10px 0 6px;
	border-spacing: 10px;
}

.moiminfo table td {
	padding: 4px 6px;
	border: 2px solid #f0f0f0;
	border-radius: 4px;
	background: #f8f8f8;
}

section .button {
	display: flex;
	flex-direction: column;
}

section .button div {
	margin: 10px;
	align-items: center;
}

.button a:link, a:visited {
	background-color: #999999;
	color: white;
	width: 90px;
	heigth: 30px;
	padding: 10px 20px;
	border-radius: 6px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
}

.qnabbs-title {
	list-style: none;
	width: 800px;
	padding: 30px 0 0 0;
	border-top: 1px solid #999999;
}

.qnabbs-title li {
	display: inline-block;
	width: 396px;
}

.qnabbs-title h2 {
	margin: 0;
}

.qnabbs-btn {
	text-align: right;
}

.qnabbs-btn input {
	border: 0;
	outline: none;
	width: 100px;
	height: 30px;
	cursor: pointer;
	background: #999999;
	color: white;
}

input[id*="click"] {
	display: none;
}

input[id*="click"]+label {
	display: block;
	padding: 10px 20px;
	border: 1px solid #e8e8e8;
	cursor: pointer;
}

input[id*="click"]+label span.go {
	display: inline-bolck;
	width: 30px;
	height: 30px;
	margin-left: 10px;
	font-weight: 900;
	color: red;
}

input[id*="click"]+label+div {
	max-height: 0;
	transition: max-height 0.5s;
	overflow: hidden;
	background: #eeeeee;
	border-left: 1px solid #eeeeee;
	border-right: 1px solid #eeeeee;
}

input[id*="click"]+label+div p {
	display: inline-block;
	padding: 10px 40px 0 40px;
}

input[id*="click"]:checked+label+div {
	max-height: 500px;
}
</style>
<body>
	<%
	if (dto.getImg() == null || dto.getImg().equals("")) {
	%>
	<%@include file="/header.jsp"%>

	<h2>
		제목 :
		<%=dto.getSubject()%></h2>
	<input type="hidden" name="idx" value="<%=idx%>">
	<section>
		<article>
			<h2>
				모임이름 :
				<%=dto.getMoimname()%></h2>

			<div class="moiminfo">
				<div class="moimContent moimimg">
					<div class="img">
						<img alt="이미지" src="/moim/img/noimg.png">
					</div>
				</div>
				<%
				} else {
				%>
				<%@include file="/header.jsp"%>

				<h2>
					제목 :
					<%=dto.getSubject()%></h2>
				<input type="hidden" name="idx" value="<%=idx%>">
				<section>
					<article>
						<h2>
							모임이름 :
							<%=dto.getMoimname()%></h2>
						<div class="moiminfo">
							<div class="moimContent moimimg">
								<div class="img">
									<img alt="이미지" src="img/<%=dto.getImg()%>">
								</div>
							</div>
							<%
							}
							%>
							<table class="moimContent">
								<tr class="moimtext">
									<td><span class="con-icon1"></span>모임명 : <%=dto.getMoimname()%></td>
								</tr>
								<tr class="moimtext">
									<td><span class="con-icon2"></span>지역 : <%=dto.getLocal()%></td>
								</tr>
								<tr class="moimtext">
									<td>
										<div class="moim-content">
											<span class="con-icon3"></span>&nbsp;&nbsp;&nbsp;내용 :<br>
											<%=dto.getContent().replaceAll("\n", "<br>")%>
										</div>
									</td>
								</tr>
							</table>
							<div class="button">
								<div>
									<a href="reviewList.jsp">목록</a>
								</div>
								<div>
									<a
										href="javascript:location.href='updateReview.jsp?idx=<%=idx%>'">수정</a>
								</div>
								<div>
									<a href="javascript:location.href='reviewDel.jsp?idx=<%=idx%>'">삭제</a>
								</div>
							</div>
						</div>
					</article>
				</section>
				<%@include file="/footer.jsp"%>
</body>
</html>