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
참여중인 모임
<nav>
<table border="1">
	
	<tr>
	<th>카테고리</th>
	<th>모임 이름</th>
	<th>모임인원</th>
	<th>모임게시판,후기쓰기</th>
	</tr>
	
	<tr>
	<td><a href="">a</a></td>
	<td><a href="">a</a></td>
	<td><a href="">a</a></td>
	<td>
	<input type="submit" value="모임게시판">
	<input type="submit" value="후기쓰기">
	</td>
	</tr>
</table>
</nav>
<br>
내가 만든 모임
<nav>
<table border="1">
	<tr>
	<th>카테고리</th>
	<th>모임 이름</th>
	<th>모임 인원</th>
	<th>모임게시판,관리,삭제</th>
	</tr>
	<tr>
	<td><a href="">a</a></td>
	<td><a href="">a</a></td>
	<td><a href="">a</a></td>
	<td>
	<input type="submit" value="모임게시판">
	<input type="submit" value="모임관리">
	<input type="submit" value="모임삭제">
	</td>
	</tr>
</table>
</nav>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>