<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.moim.review.*"%>
<jsp:useBean id="rdao" class="com.moim.review.ReviewDAO"></jsp:useBean>

<%
String idx_s = request.getParameter("idx");
if (idx_s == null || idx_s.equals("")) {
	idx_s = "0";
}

int idx = Integer.parseInt(idx_s);
ReviewDTO dto = rdao.updateReviewForm(idx);

boolean boo = false;

String userimg = null;
if (userimg != null)
	userimg = request.getParameter("img");

if (dto.getImg() == null) {
	boo = true;
}
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
h2, h4 {
	text-align: center;
	margin: 0px auto;
}

table {
	text-align: center;
	margin: 0px auto;
}

section {
	width: 800px;
	margin: 0 auto;
}

section h2 {
	text-align: center;
}

section .moimcontent {
	display: flex;
	margin: 0 auto;
	width: 800px;
	height: 260px;
	padding: 10px 0 30px 0;
}

section .write {
	width: 500px;
}

section .write table th {
	text-align: left;
	font-size: 18px;
	padding-right: 10px;
}

section .write table td {
	padding: 4px 0;
}

section .imgupload {
	width: 300px;
	text-align: center;
}

section .img {
	background: #eeeeee;
	width: 200px;
	height: 200px;
	margin: 0 auto 10px auto;
}

.button {
	text-align: right;
	padding: 0 40px 20px 0;
}

.button input {
	border: 0;
	outline: none;
	width: 100px;
	height: 30px;
	cursor: pointer;
}
</style>
<body>
	<%@include file="/header.jsp"%>
	<h2><%=dto.getSubject()%></h2>
	<form name="reviewupdate" action="updateReview_ok.jsp">
		<input type="hidden" name="idx" value="<%=idx%>">

		<h4>
			-모임명 :
			<%=dto.getMoimname()%>
			&nbsp;&nbsp;&nbsp;&nbsp; -지역 :
			<%=dto.getLocal()%></h4>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<section>
			<article>
				<h2>모임 만들기</h2>
				<div class="moimcontent">
					<div class="contents write">
						<table>
							<tr>
								<th>내용</th>
								<td><textarea name="content" rows="10" cols="50"><%=dto.getContent()%></textarea></td>
							</tr>
							<thead>
								<tr>
									<td width="200" height="200"><img alt="이미지"
										src="img/<%=dto.getImg()%>" width=200 height=200></td>
									<td><img alt="이미지" src="img/<%=dto.getImg()%>" width=200
										height=200"></td>
									<td><img alt="이미지" src="img/<%=dto.getImg()%>" width=200
										height=200"></td>
								</tr>
							</thead>

						</table>

					</div>
					<div class="contents imgupload">

						<img alt="이미지" src="img/<%=dto.getImg()%>" width=200 height=200>
						<div>
							<legend>이미지 올리기</legend>
							<ul>
								<li><label>이미지</label><input type="file" name="upload"></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="button">
					<input type="submit" value="수정하기"> &nbsp;&nbsp;<input
						type="button" value="이미지 삭제">
				</div>
			</article>
		</section>
	</form>
	<%@include file="/footer.jsp"%>
</body>
</html>