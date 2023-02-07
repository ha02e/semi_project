<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notiWrite</title>
<style>
body{
	width:1280px;
}

table{
	border:1px solid gray;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<form name="writenoti" action="notiWrite_ok.jsp" method="post">

<table>
<tr>
<th>제목</th>
<td><input type="text" name="subject" placeholder="제목을 입력해주세요"></td>
</tr>
<tr>
<td colspan="2"><textarea name="content" rows="15" cols="100" placeholder="내용을 입력해주세요"></textarea></td>
</tr>
</table>
<input type="hidden" name="idx_member" value="<%=session.getAttribute("idx")%>">
<div><input type="submit" value="등록"></div>
</form>
<%@include file="/footer.jsp" %>
</body>
</html>