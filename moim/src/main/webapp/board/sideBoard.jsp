<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moim.member.*" %>
<jsp:useBean id="mdao" class="com.moim.member.MemberDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.mymenu {
	position:sticky;
    display: block;
    width: 200px;
    height: 350px;
    background-color: gray;
    color: black;
    border-radius: 20px;
    padding: 10px;
    box-sizing: 500px;
	float:left;
	margin:left;
}
ul{
	list-style: none;
}
</style>
</head>
<%
int idx=21;
if(session.getAttribute("idx")!=null&&!session.getAttribute("idx").equals("")){
	String idx_s=(String)session.getAttribute("idx");
	idx=Integer.parseInt(idx_s);
}
MemberDTO dto=mdao.getMem(idx);
%>
<body>
<section>
<div class="mymenu">
	<img src="" alt="제목이미지">
	<ul>
	<li><%=dto.getIdx()%>님</li>
	<li><a href="myInfo.jsp" class="item"><h3>내 정보 변경</h3></a></li>
	<li><a href="myWriting.jsp" class="item"><h3>내가 쓴 글</h3></a></li>
	<li><a href="myMoim.jsp" class="item"><h3>참여중인 모임</h3></a></li>
	</ul>
</div>
</section>
</body>
</html>