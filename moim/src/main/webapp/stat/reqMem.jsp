<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
<%@ page import="com.moim.stat.*" %>
<%
//로그인 체크
String id=(String)session.getAttribute("id");
if(id==null){
	%>
	<script>
		window.alert('로그인 후 이용 가능합니다.');
		window.self.close();
	</script>
	<%
	return;
}
%>
 --%> 

<jsp:useBean id="mdto" class="com.moim.stat.StatDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.moim.stat.StatDAO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2{
	margin:20px 0 0 0;
}
p{
	font-size:13px;
}
table th{
	text-align:left;
	color: #4facfe;
	padding:20px 0 10px 0;
}
table tr td textarea{
	border:1px solid #4facfe;
	padding:10px;
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
<h2>모임 가입하기</h2>
<p>모임 가입을 위해 인사말을 작성해주세요.</p>
<form name="reqMem" action="reqMem_ok.jsp">
<table>
	<tr>
		<th>인사말</th>
	</tr>
	<tr>
		<td>
		<textarea name="contentApply" rows="3" cols="36" maxlength="50">50자 이내로 입력해주세요.</textarea>
		</td>
	</tr>
</table>
<div>
	<input type="button" value="취소하기" onclick="popupclose()">
		<input type="submit" value="신청하기" class="abutton">
</div>
</form>
</body>
</html>