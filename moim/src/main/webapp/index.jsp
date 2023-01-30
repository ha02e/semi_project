<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="sdao" class="com.moim.stat.StatDAO"></jsp:useBean>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>index</h1>
<h2>index2</h2>
<%=sdao.test()%>
</body>
</html>