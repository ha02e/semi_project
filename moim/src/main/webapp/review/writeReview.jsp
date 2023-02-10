<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.moim.member.*"%>
<%@ page import="com.moim.info.*"%>
<jsp:useBean id="rdto" class="com.moim.review.ReviewDTO" scope="page"></jsp:useBean>
<jsp:useBean id="rdao" class="com.moim.review.ReviewDAO" scope="page"></jsp:useBean>
<jsp:useBean id="idto" class="com.moim.info.InfoDTO" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
Integer idx_member = (Integer) session.getAttribute("idx");
if (idx_member == null) {
%>
<script>
	window.alert('로그인 후 이용가능합니다');
	location.href = '/moim/review/reviewList.jsp';
</script>
<%
return;
}
%>




<style>
section {
	width: 800px;
	margin: 0 auto;
}

section h2 {
	margin: 40px 0 0 0;
}

section p {
	font-size: 14px;
	margin: 10px 0 20px 0;
	color: #666666;
}

section .write table {
	width: 800px;
	border-top: 3px solid #333333;
	border-bottom: 3px solid #333333;
	padding: 10px 20px 20px 20px;
	background: #f6f6f6;
}

section .write table th {
	text-align: left;
	font-size: 18px;
	padding: 14px 10px 14px 0;
}

section .write table td {
	padding: 4px 0;
}

.write table tr {
	/*padding:40px 0;*/
	margin: 30px 0;
	border-top: 1px solid #999999;
}

select {
	width: 100px;
	padding: 6px 18px;
	border: 1px solid #999999;
	border-radius: 0px;
	font-size: 14px;
}

input[type="text"] {
	border: 1px solid #999999;
	border-radius: 0px;
	padding: 8px;
}

textarea {
	border: 1px solid #999999;
	border-radius: 0px;
}

.button {
	text-align: center;
	padding: 20px 0 40px 0;
}

.button input {
	border: 0;
	outline: none;
	width: 160px;
	height: 40px;
	cursor: pointer;
	background: #999999;
	color: white;
}

.button input[type="submit"] {
	background: #333333;
}

.button input:hover {
	background: #00cdac;
	transition: 0.3s;
}
</style>
<script>
	function validate() {
		var content = document.getElementById("content");
		if (content.value == "") {
			window.alert('내용을 입력해주세요.');
			content.focus();
			return false;
		}
	}
</script>
</head>
<%
int idx_info = 0;
String idx_info_s = request.getParameter("idx_info"); // 얘가 idx_info 테이블에서 검색할것
if (idx_info_s == null || idx_info_s.equals("")) {

}
idx_info = Integer.parseInt(idx_info_s);

String writer = (String) session.getAttribute("name");
String img = request.getParameter("img");

InfoDTO info = rdao.getInfo(idx_info);
%>
<!-- 
info에서 넘겨 받아야할 것들 카테고리, 모임이름, 지역 / 현재 카테고리는 idx_member 에서 가져오고 있다 

 -->


<body>
	<%@include file="/header.jsp"%>
	<form name="imgUpload" method="post" action="reviewImgUp_ok.jsp"
		enctype="multipart/form-data" onsubmit="return validate()">
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
									value="<%=info.getMoimname()%>"> <!-- readonly --></td>
							</tr>
							<tr>
								<th>지역</th>
								<td><input type="text" name="local"
									value="<%=info.getLocal()%>"> <!-- readonly --></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="content" id="content" rows="10"
										cols="50" placeholder="내용을 입력해주세요"></textarea></td>
							</tr>
							<tr>
								<th>이미지</th>
								<td><input type="file" name="upload">*최대 업로드 파일
									크기:2 MB</td>
							</tr>
							<tr>
								<td><input type="hidden" name="hobby"
									value="<%=info.getHobby()%>"> <input type="hidden"
									name="writer" value="<%=writer%>"></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="button">
					<input type="submit" value="글쓰기">&nbsp;&nbsp; <input
						type="button" value="취소" onclick="location.href='reviewList.jsp'">
				</div>
			</article>
		</section>
	</form>


	<%@include file="/footer.jsp"%>
</body>
</html>