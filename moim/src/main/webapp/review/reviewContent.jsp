<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</style>
<body>
	<%@include file="/header.jsp"%>
	<h2>독서 모임 후기</h2>
	<h4>-모임명 : +moimname&nbsp;&nbsp;&nbsp;&nbsp;-지역 : +local</h4>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<section>
		<article>
			<table>
				<thead>
					<tr>
						<th>이미지</th>

						<th>이미지</th>

						<th>이미지</th>
					</tr>
				</thead>
				<tr>
					<td colspan="3"><textarea rows="10" cols="50" name="content"></textarea>

					</td>
				</tr>
				<tfoot>
					<tr>
						<td colspan="3"><input type="button" value="목록"
							onclick="location.href='reviewList.jsp'"> <input
							type="submit" name="modify" value="수정"> <input
							type="button" name="delete" value="삭제"></td>


					</tr>
				</tfoot>

			</table>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>