<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.moim.review.*"%>
<jsp:useBean id="rdao" class="com.moim.review.ReviewDAO" scope="session"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
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

</head>
<%
String idx_member_s = request.getParameter("idx_member");
if (idx_member_s == null || idx_member_s.equals("")) {
	idx_member_s = "0";
}
int idx_member = Integer.parseInt(idx_member_s);

String moimname = request.getParameter("moimname");
String local = request.getParameter("local");
String hobby = request.getParameter("hobby");
String writer = request.getParameter("writer");
%>
<script>


</script>
<%




%>
<body>

	<%@include file="/header.jsp"%>

	<form name="imgUpload" method="post" action="reviewImgUp_ok.jsp"
	
		enctype="multipart/form-data">
		<section>
			<article>
				<h2>후기 게시판 작성</h2>
				<div class="moimcontent">
					<div class="contents write">
						<table>
							<tr>
								<th>제목</th>
								<td><input type="text" name="subject"
									placeholder="내용을 입력해주세요"></td>
							</tr>
							<tr>
								<th>모임이름</th>
								<td><input type="text" name="moimname" size="52"
									value="<%=moimname%>" readonly></td>
							</tr>
							<tr>
								<th>지역</th>
								<td><input type="text" name="local" value="<%=local%> " readonly></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="content" rows="10" cols="50"
										placeholder="내용을 입력해주세요"></textarea></td>
							</tr>
							<tr>
								<th>이미지</th>
								 <td><input type="file" name="upload"></td>
							</tr>
							<tr>
								<td><input type="hidden" name="idx_memeber"
									value="<%=idx_member%>"> <input type="hidden"
									name="hobby" value="<%=hobby%>"> <input type="hidden"
									name="writer" value="<%=writer%>"></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="button">
					<input type="submit" value="글쓰기" >&nbsp;&nbsp;
					<input type="button" value="취소" onclick = "location.href='reviewList.jsp'">
				</div>
			</article>
		</section>
	</form>


	<%@include file="/footer.jsp"%>
</body>
</html>