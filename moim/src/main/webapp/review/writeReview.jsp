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
<body>
<%-- <% 
String detail="";
if(request.getParameter("detail")!=null){
detail= request.getParameter("detail");
%> --%>
	<%@include file="/header.jsp"%>
	<form name="write" action="writeReview_ok.jsp" method="post">
		<section>
			<article>
				<table>
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject"></td>
						
						<td rowspan="4" width="300px">이미지<br> <input
							type="button" value="사진 업로드"><br> <input
							type="submit" value="글쓰기">
						</td>

					</tr>
					<tr>
						<th>모임이름</th>
						<td><input type="text" name="moimname" value="값가져오기"></td>
					</tr>
					<tr>
						<th>지역</th>
						<td><input type="text" name="local" value="값가져오기"></td>
					</tr>


					<tr>
						<th>내용</th>
						<td><input type="text" name="content" value="값가져오기"></td>
					</tr>
					<tr>
					<input type = "hidden" name="idx_memeber" >;
					<input type = "hidden" name="hobby">;
					<input type = "hidden" name="writer">;
					<input type = "hidden" name="writedate">;
					<input type = "hidden" name="ref">;
					<input type = "hidden" name="sunbun">;
					</tr>
				</table>

			</article>
		</section>
	</form>


	<%@include file="/footer.jsp"%>
</body>
</html>