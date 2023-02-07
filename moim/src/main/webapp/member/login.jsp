<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style>

.login_form{
	border: 1px solid gray;
	justify-content:center;
	align-items:center;
	text-align:center;
	display:flex;
	margin:0px auto;
	

}
/* 
td{
	padding:5px;
} */

.button{
	text-align: center;
	padding:20px 0 40px 0;
}

.button input{
	border:0;
	outline:none;
	width:60px;
	height:60px;
	cursor: pointer;
	background:#999999;
	color:white;
}
.button input[type="submit"]{
	background:#333333;
}
.button input:hover{
	background: #00cdac;
	transition: 0.3s;
}
</style>

</head>
<body>
<%
String saveid="";
Cookie cks[]=request.getCookies();
if(cks!=null){
	for(int i=0;i<cks.length;i++){
		if(cks[i].getName().equals("saveid")){
			saveid=cks[i].getValue();
		}
	}
}
%>
<div class="login_form">
<form name="login" action="login_ok.jsp" method="post" enctype="UTF-8">
<table>
	<tr>
	<td><input type="text" name="id" placeholder="아이디" maxlength="45" value="<%=saveid%>"></td>
	<td class="button" rowspan="2"><input type="submit" value="로그인" class="button"></td>
	</tr>
	<tr>
	<td><input type="password" name="pwd" placeholder="비밀번호" maxlength="45">
	</td>
	</tr>
</table>
</br>
<div>
<input type="checkbox"  name="saveid" value="on" <%=saveid.equals("")?(""):"checked"%>>아이디 저장
</div>
</div>
</form>



</body>
</html>