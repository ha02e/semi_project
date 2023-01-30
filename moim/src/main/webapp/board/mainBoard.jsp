<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
document.write('관심사<select name="hobby"');
function hobby(){
	var hobby=new Array(8);
	hobby[0]='운동';
	hobby[1]='게임';
	hobby[2]='여행';
	hobby[3]='공원';
	hobby[4]='요리';
	hobby[5]='음악';
	hobby[6]='봉사활동';
	hobby[7]='댄스';
	
	for(var i=0;i<=7;i++){
	document.write('<option value="'+hobby[i]'"');		
	}
	document.write('</select>');
}
</script>
<style>
table{
	display: block;
	align-items: center;
	background-color: gray;
}

</style>
</head>
<body>
<section>
<article>
	<form>
	<table>
		<tr>
			<th>이름:</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>아이디:</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>주소:</th>
			<td><input type="text" name="addr"></td>
		</tr>
		
		<tr>
			<th>관심사:</th>
			<td><a href="javascript:hobby();"><input type="text" name="hobby"></a></td>
		</tr>
		
	</table>
	</form>>
</article>
</section>
<%@include file="sideBoard.jsp" %>
</body>
</html>