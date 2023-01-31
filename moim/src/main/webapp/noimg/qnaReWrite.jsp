<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
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
String ref=request.getParameter("ref");
String lev=request.getParameter("lev");
String sunbun=request.getParameter("sunbun");
System.out.println(ref);
System.out.println(lev);
System.out.println(sunbun);
%>
<body>
<h2>QnA 답변 작성하기</h2>
	<form name="qnaReWrite" action="qnaReWrite_ok.jsp" method="post">
	<input type="hidden" name="ref" value="<%=ref%>">
	<input type="hidden" name="lev" value="<%=lev %>">
	<input type="hidden" name="sunbun" value="<%=sunbun%>">
<table>
	<tr>
		<th>제목</th>
	</tr>
	<tr>
		<td>
			<input type="text" name="subject" size="38" value="ㄴ">
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
	<input type="submit" value="작성하기" class="abutton">
</div>
</form>
</body>
</html>