<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	width:1000px;
	text-align: center;
}
th{
	background-color: gray;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<%@include file="sideBoard.jsp" %>
<section>
내가 쓴 후기
<nav>
<table border="1">
	<tr>
	<th>카테고리</th>
	<th>제목</th>
	<th>등록일자</th>
	<th>수정,삭제</th>
	</tr>
	<tr>
	<td><a href="">a</a></td>
	<td><a href="">a</a></td>
	<td><a href="">a</a></td>
	<td>
	<input type="submit" value="수정">
	<input type="submit" value="삭제">
	</td>
	</tr>
</table>
</nav>
<br>
내가 쓴 댓글(QnA)
<nav>
<table border="1">
	<tr>
	<th>모임이름</th>
	<th>제목</th>
	<th>등록일자</th>
	<th>삭제</th>
	</tr>
	<tr>
	<td><a href="">a</a></td>
	<td><a href="">a</a></td>
	<td><a href="">a</a></td>
	<td><input type="submit" value="삭제"></td>
	</tr>
</table>
</nav>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>