<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.moim.review.*"%>
<%@page import="com.moim.info.*"%>
<jsp:useBean id="rdao" class="com.moim.review.ReviewDAO"></jsp:useBean>
<!-- login -->
<%
Integer idx_l = (Integer) session.getAttribute("idx");
if (idx_l==null) {
%>
<script>
	window.alert('로그인 후 이용가능합니다');
	location.href = '/moim/review/reviewList.jsp';

<%
return;
}
%>

function checkSize(input) {
    if (input.files && input.files[0].size > (2 * 1024 * 1024)) {
        alert("파일 사이즈가 2mb 를 넘습니다.");
        input.value = null;
    }
}
</script>
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
String img = request.getParameter("img");


if(idx_l != dto.getIdx_member()){
	%>
	<script>
		window.alert('자신의 게시물만 수정하실 수 있습니다.');
		location.href = '/moim/review/reviewList.jsp';
	</script>
	<%	
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
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
	margin:0 auto;	
	font-family: 'Black Han Sans', sans-serif;
	font-weight: normal;
	text-align: center;
}
section p{
	font-size: 15px;
	margin:4px 0 20px 0;
	color:#666666;
	text-align: center;
}

section .write table{
	width:800px;
	border-top:3px solid #333333;
	border-bottom:3px solid #333333;
	padding:10px 20px 20px 20px;
	background:#f6f6f6;
}
section .write table th{
	text-align:left;
	font-size:18px;
	padding:14px 10px 14px 0;
}
section .write table td{
	padding:4px 0;
}

.write table tr{
	/*padding:40px 0;*/
	margin:30px 0;
	border-top:1px solid #999999;
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
<script>
	function imgch() {
		document.getElementByld("imgchange").src = "";
	}
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<%
		if (dto.getImg() == null || dto.getImg().equals("")) {
		%>
		<article>				
			<h2>후기 수정하기</h2>
			<p>수정할 내용을 작성해주세요.</p>
			<form name="reviewupdate" action="updateReviewImg.jsp" method="post">
				<div class="moimcontent">
					<div class="contents write">
						<table>
							<tr>
								<th>제목</th>
								<td><input type="text" name ="subject" value="<%=dto.getSubject()%>" size="52"></td>
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
								<td><textarea name="content" rows="10" cols="80" style="resize:none">
								<%=dto.getContent()%></textarea></td>
							</tr>
							<tr>
								<th>이미지</th>
								<td><input type="file" name="upload" onchange ="checkSize(this)"></td>
							</tr>
<tr>							<td>
									<input type="hidden" name="hobby" value="<%=hobby%>">
									<input type="hidden" name="writer" value="<%=writer%>">
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="button">
					<input type="hidden" name="idx" value="<%=idx%>"> 
					<input type="submit" value="수정하기"> 
					<input type="button" onclick="location.href='reviewList.jsp'" value="취소">
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
								<td rowspan = "3"><div class="contents imgupload">
						<div class="img">
							<img alt="이미지" src="img/<%=dto.getImg()%>" width=200 height=200>
						</div>
					</div></td>
							</tr>
							<tr>
								<th>모임이름</th>
								<td><%=dto.getMoimname()%></td>
								
							</tr>
							<tr>
								<th>지역</th>
								<td><%=dto.getLocal()%></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="content" rows="10" cols="50" style="resize:none">
										<%=dto.getContent()%></textarea></td>
							</tr>
							<tr>
								<th>이미지</th>
								<td><input type="file" name="upload" onchange ="checkSize(this)"></td><td></td>
							</tr>
							<tr>
								<td>
									<input type="hidden" name="hobby" value="<%=hobby%>">
									<input type="hidden" name="writer" value="<%=writer%>">
								</td>
							</tr>
						</table>
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