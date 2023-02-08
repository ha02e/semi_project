<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sdao" class="com.moim.stat.StatDAO"></jsp:useBean>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.button{
	border:0;
	outline:none;
	width:100px;
	height:30px;
	cursor: pointer;
	background:#999999;
	color:white;
}

.button:hover{
	background: #00cdac;
	transition: 0.3s;
}
ul{
	list-style: none;
}
div{
text-align: center;
}
</style>
</head>
<%
int idx=1;
if(request.getParameter("idx")!=null&&!request.getParameter("idx").equals("")){
	idx=Integer.parseInt(request.getParameter("idx"));
}
ArrayList<Object> arr=sdao.getStatInfo(idx);
%>
<body>
<section>
	<div>
	<ul>
		<li>이름:<%=arr.get(0) %></li>
		<li>나이:<%=arr.get(1) %></li>
		<li>인사말:<%=arr.get(2) %></li>
	</ul>
	</div>
	<div>
		<input type="button" class="button" value="수락하기" onclick="javascript:location.href='statAcc_ok.jsp?idx=<%=idx%>&idx_info=<%=arr.get(3)%>'">
		<input type="button" class="button" value="거절하기" onclick="javascript:location.href='statDel_ok.jsp?idx=<%=idx%>'">
	</div>
</section>
</body>
</html>