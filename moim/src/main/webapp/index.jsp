<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<<<<<<< HEAD
<jsp:useBean id="sdao" class="com.moim.stat.StatDAO"></jsp:useBean>
=======
<jsp:useBean id="dao" class="com.moim.stat.StatDAO"></jsp:useBean>
>>>>>>> 5047a854d50bf4a41a034a2f6436483f62acfdb9
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<<<<<<< HEAD
<%=dao.test() %>
=======
<%@include file="/header.jsp" %>
>>>>>>> dfa4fc7db55e19818854b4064637d7e03b873010
<h1>index</h1>
<h2>index2</h2>
<%=sdao.test() %>
<%@include file="/footer.jsp" %>
</body>
</html>