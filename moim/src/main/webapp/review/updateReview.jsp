<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.moim.review.*"%>
<jsp:useBean id="rdao" class="com.moim.review.ReviewDAO"></jsp:useBean>
<!-- login -->
<%
Integer idx_l = (Integer) session.getAttribute("idx");
if (idx_l==null) {
%>
<script>
	window.alert('로그인 후 이용가능합니다');
	location.href = '/moim/review/reviewList.jsp';
</script>
<%
return;
}
%>
<%
String idx_s = request.getParameter("idx");
if (idx_s == null || idx_s.equals("")) {
	idx_s = "0";
}

int idx = Integer.parseInt(idx_s);
ReviewDTO dto = rdao.updateReviewForm(idx);

String idx_member_s = request.getParameter("idx_member");
if (idx_member_s == null || idx_member_s.equals(""))
	idx_member_s = "0";

int idx_meber = Integer.parseInt(idx_member_s);
String moimname = request.getParameter("moimname");
String local = request.getParameter("local");
String hobby = request.getParameter("hobby");
String writer = request.getParameter("writer");
String subect = request.getParameter("subject");
/* String content= request.getParameter("content"); */
String img = request.getParameter("img");
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
h2, h3, h4 {
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
	height: 900px;
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
<script>
	function imgch() {
		document.getElementByld("imgchange").src = "";
	}
</script>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<%
		if (dto.getImg() == null || dto.getImg().equals("")) {
		%>
		<article>
			<form name="reviewupdate" action="updateReviewImg.jsp" method="post">
				<h2>후기 게시판 수정</h2>
				<div class="moimcontent">
					<div class="contents write">
						<table>
							<tr>
								<th>제목</th>
								<td><input type="text" name ="subject" value="<%=dto.getSubject()%>"></td>
							</tr>
							<tr>
								<th>모임이름</th>
								<td><%=dto.getMoimname()%>
							</tr>
							<tr>
								<th>지역</th>
								<td><%=dto.getLocal()%></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="content" rows="10" cols="50"
										<%=dto.getContent()%>></textarea></td>
							</tr>
							<tr>
								<th>이미지</th>
								<td><input type="file" name="upload"></td>
							</tr>

							<input type="hidden" name="idx_memeber"
								value="<%=dto.getIdx_member()%>">
							<input type="hidden" name="hobby" value="<%=hobby%>">
							<input type="hidden" name="writer" value="<%=writer%>">
						</table>
					</div>
				</div>
				<div class="button">
					<input type="hidden" name="idx" value="<%=idx%>"> <input
						type="submit" value="수정하기"> <input type="button"
						onclick="location.href='reviewList.jsp'" value="취소">
				</div>
			</form>
		</article>
		<%
		} else {
		%>
		<article>
			<form name="reviewupdate" action="updateReviewImg.jsp" method="post" enctype="multipart/form-data" >
				<h2>후기 게시판 수정</h2>
				<div class="moimcontent">
					<div class="contents write">
						<table>
							<tr>
								<th>제목</th>
								<td><input type="text" name ="subject" value="<%=dto.getSubject()%>"></td>
							</tr>
							<tr>
								<th>모임이름</th>
								<td><%=dto.getMoimname()%>
							</tr>
							<tr>
								<th>지역</th>
								<td><%=dto.getLocal()%></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="content" rows="10" cols="50">
										<%=dto.getContent()%></textarea></td>
							</tr>
							<tr>
								<th>이미지</th>
								<td><input type="file" name="upload"></td>
							</tr>

							<input type="hidden" name="idx_memeber"
								value="<%=dto.getIdx_member()%>">
							<input type="hidden" name="hobby" value="<%=hobby%>">
							<input type="hidden" name="writer" value="<%=writer%>">
						</table>
					</div>
					<div class="contents imgupload">
						<div class="img">
							<img alt="이미지" src="img/<%=dto.getImg()%>" width=200 height=200>
						</div>
					</div>
				</div>
				<div class="button">
					<input type="hidden" name="idx" value="<%=dto.getIdx()%>">
					<input type="submit" value="수정하기"> <input type="button"
						onclick="location.href='reviewList.jsp'" value="취소">

				</div>
			</form>
		</article>
		<%
		}
		%>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>