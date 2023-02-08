<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moim.info.*" %>
<jsp:useBean id="mdto" class="com.moim.info.InfoDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.moim.info.InfoDAO"></jsp:useBean>
<%
Integer idx = (Integer) session.getAttribute("idx");
if (idx==null) {
%>
<script>
	window.alert('로그인 후 이용가능합니다');
	window.self.close();
</script>
<%
return;
}
%>    
<%
String idx_s=request.getParameter("idx_info");
int idx_info=Integer.parseInt(idx_s);
%>  
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
<body>
<h2>QnA 글 작성하기</h2>
	<form name="qnaWrite" action="qnaWrite_ok.jsp">
<table>
	<tr>
		<th>제목</th>
	</tr>
	<tr>
		<td>
			<input type="text" name="subject" size="38">
		</td>
	</tr>
	<tr>
		<th>내용</th>
	</tr>
	<tr>
		<td>
			<textarea name="content" rows="3" cols="38"></textarea>
		</td>
	</tr>
</table>
<div>
	<input type="button" value="취소하기" onclick="popupclose()">
	<input type="hidden" name="idx_info" value="<%=idx_info%>">
	<input type="submit" value="작성하기" class="abutton">
</div>
</form>
</body>
</html>