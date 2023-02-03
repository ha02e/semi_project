<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moim.noimg.*" %>
<jsp:useBean id="mdto" class="com.moim.noimg.NoimgDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table th{
	text-align:left;
	color: #4facfe;
	padding:0px 0 6px 0;
}
table td input{
	margin-bottom:10px;
}
div input{
	border:0;
	outline: none;
	width:150px;
	height:30px;
	margin-top:24px;
	cursor:pointer;
}
.abutton{
	background: gray;
	color:white;
}
</style>
<script>
function popupclose(){
	window.close();
}
</script>
</head>
<%
String idx=request.getParameter("idx");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
%>
<body>
<h2>QnA 글 수정하기</h2>
	<form name="qnaUpdate" action="qnaUpdate_ok.jsp">
	<input type="hidden" name="idx" value="<%=mdto.getIdx() %>">
<table>
	<tr>
		<th>제목</th>
	</tr>
	<tr>
		<td>
			<input type="text" name="subject" size="38" value="<%=mdto.getSubject()%>">
		</td>
	</tr>
	<tr>
		<th>내용</th>
	</tr>
	<tr>
		<td>
			<textarea name="content" rows="3" cols="38"><%=mdto.getContent()%></textarea>
		</td>
	</tr>
</table>
<div>
	<input type="button" value="취소하기" onclick="popupclose()">
	<input type="submit" value="작성하기" class="abutton">
</div>
</form>
</body>
</html>