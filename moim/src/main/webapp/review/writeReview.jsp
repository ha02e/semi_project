<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="rdto" class="com.moim.review.ReviewDTO" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
	text-align: center;
	margin-right: 100px auto;
}

table {
	border: 5px double dark;
	text-align: center;
	margin: 0px auto;
}
</style>
</head>
<%
String idx_member_s = request.getParameter("idx_member");
 if (idx_member_s == null || idx_member_s.equals("")) {
	idx_member_s = "0";
}
int idx_member= Integer.parseInt(idx_member_s); 

String moimname = request.getParameter("moimname");
String local= request.getParameter("local");
String hobby = request.getParameter("hobby");
String writer= request.getParameter("writer");
/* String subect= request.getParameter("subject"); */
/* String content= request.getParameter("content"); */
String img = request.getParameter("img");
String ref = request.getParameter("ref");
String sunbun = request.getParameter("sunbun");
%>
<body>
<%-- <% 
String detail="";
if(request.getParameter("detail")!=null){
detail= request.getParameter("detail");
%> --%>


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