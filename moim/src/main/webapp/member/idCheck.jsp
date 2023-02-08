<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheck</title>
<script>
function check(){
	var userid=document.getElementById("userid");
	if(userid.value==''){
		alert('아이디를 입력해주세요.');
		userid.focus();
		return false;
	}else{
		idcheck.submit();
	}

}

</script>
</head>
<body>
<fieldset>
<legend>아이디 중복 확인</legend>
<form name="idcheck" action="idCheck_ok.jsp">
<input type="text" name="id" id="userid" placeholder="아이디를 입력해주세요" >
<input type="button" value="중복 검색" onclick="check();">
</form>
</fieldset>
</body>
</html>