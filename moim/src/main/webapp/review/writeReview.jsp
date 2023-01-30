<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
section{
margin:0px auto;
}
table{
	border:5px double dark;
	text-align : center;
}
</style>
</head>
<body>
	<section>
		<article>
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject"></td>
					<td rowspan ="4" width="300px">
					이미지
					<input type ="">
					</td>
				</tr>
				<tr>
					<th>모임이름</th>
					<td><input type="text" name="moimname"></td>
				</tr>
				<tr>
					<th>지역</th>
					<td><input type="text" name="local"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><input type="text" name="content"></td>
				</tr>
			</table>

		</article>
	</section>      



</body>
</html>