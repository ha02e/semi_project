<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.moim.stat.*" %>
<%
//로그인 체크
Integer idx = (Integer) session.getAttribute("idx");
if(idx==null){
	%>
	<script>
		window.alert('로그인 후 이용 가능합니다.');
		window.self.close();
	</script>
	<%
	return;
}

%>

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
<%
String idx_s=request.getParameter("idx_info");
int idx_info=Integer.parseInt(idx_s);

StatDTO dto_s=mdao.getUserStat(idx,idx_info);
if(dto_s==null){ //신청하지 않은 상태
	
}else if(dto_s.getStat()==2){ //신청한 상태
	%>
	<script>
		window.alert('이미 신청하셨습니다. 관리자가 수락하면 가입 완료됩니다.');
		window.self.close();
	</script>
	<%
}
%>

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
		<textarea name="contentApply" rows="3" cols="36" maxlength="50" placeholder="50자 이내로 입력해주세요."></textarea>
		</td>
	</tr>
</table>
<div>
	<input type="button" value="취소하기" onclick="popupclose()">
	<input type="hidden" name="idx_info" value="<%=idx_info%>">
		<input type="submit" value="신청하기" class="abutton">
</div>
</form>
</body>
</html>