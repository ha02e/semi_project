<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@page import="com.moim.noimg.*" %>
<jsp:useBean id="ndto" class="com.moim.noimg.NoimgDTO"></jsp:useBean>


<%
String sidx=request.getParameter("idx");
if(sidx==null||sidx==""){
	sidx="0";
}
int idx=Integer.parseInt(sidx);

String subject=request.getParameter("subject");
String content=request.getParameter("content");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notiUpdate</title>
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

<table>
<tr>
<th>제목</th>
<form name="update2" action="notiUpdate_ok.jsp" >
<input type="hidden" name="idx" value="<%=idx %>">
<td><input type="text" name="subject" value="<%=subject%>"></td>
</tr>
<tr>
<td colspan="2"><textarea name="content" rows="15" cols="100"><%=content%></textarea></td>

</tr>
</table>
<div><input type="submit" name="update" value="등록"></div>
</form>
<%@include file="/footer.jsp" %>
</body>
</html>