<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moim.member.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<jsp:useBean id="mdao" class="com.moim.member.MemberDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 변경</title>
<style>
.container{
	display:flex;
	width:800px;
}
section{
	margin:0 auto;
}
section h2{
	margin:40px 0 20px 0;
}
section .myinfoForm table{
	width:800px;
	border-top:3px solid #333333;
	border-bottom:3px solid #333333;
	padding:10px 20px 20px 20px;
	background:#f6f6f6;
}
section .myinfoUp table th{
	text-align:left;
	font-size:18px;
	padding:14px 10px 14px 0;
}
section .myinfoUp  table td{
	padding:4px 0;
}
..myinfoUp  table tr{
	margin:30px 0;
	border-top:1px solid #999999;
}
select{
	width: 100px; 
	padding: 6px 18px; 
	border: 1px solid #999999; 
	border-radius: 0px; 
	font-size: 14px;
}
input[type="text"] {
	border: 1px solid #999999; 
	border-radius: 0px; 
	padding:8px;
}
span{
	font-size:12px;
}
.button{
	text-align: center;
	padding:20px 0 2px 0;
}
.button input{
	border:0;
	outline:none;
	width:160px;
	height:40px;
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

<script>
	function idcheck() {
		var w='500';
		var h='300';
		var l=Math.ceil((window.screen.width-w)/2);
		var t=Math.ceil((window.screen.height-h)/2);
		window.open('idCheck.jsp', 'idcheck', 'width='+w+',height='+h+',left='+l+',top='+t);
	}
	/**비밀번호*/
	function pwdCheck(){
	var pwd1=document.getElementById("pwd1");
		var pwd2=document.getElementById("pwd2");
	var pwd_error=document.getElementById("pwd_error");
	if(pwd1.value!=pwd2.value){
		pwd_error.innerHTML="비밀번호 불일치";
		pwd_error.style.color="red";
		pwd2.focus();
		return false;
	}else{
		pwd_error.innerHTML="일치";
		pwd_error.style.color="green";
	}
	}
	
	
	/**이름, 이메일, 나이 유효성 검사*/
	function validate(){
		var name=document.getElementById("name");
		var email=document.getElementById("email");
		var age=document.getElementById("age");
		
		var name_error=document.getElementById("name_error");
		var email_error=document.getElementById("email_error");
		var age_error=document.getElementById("age_error");
	
		/**이름*/
		if(name.value==""){
			name_error.innerHTML="이름을 입력해주세요";
			name_error.style.color="red";
			name.focus();
			return false;
		}else{
			name_error.innerHTML="";
		}
		
		/**이메일*/
		if(email.value==""){
			email_error.innerHTML="이메일을 입력해주세요";
			email_error.style.color="red";
			email.focus();
			return false;
		}else{
			email_error.innerHTML="";
		}
		
		
		/**나이*/
		if(!(1<=age.value&&age.value<=100)){
			age_error.innerHTML="숫자만 입력 가능합니다";
			age_error.style.color="red";
			age.focus();
			age.value='';
			return false;
		}else{
			age_error.innerHTML='';
		}
		
	}
	
</script>
</head>
<%
Integer idx=(Integer)session.getAttribute("idx");
if(idx==null){
	idx=0;
}
MemberDTO dto=mdao.getMem(idx);
%>
<body>
<%@include file="/header.jsp" %>
<div class="container">
<div>
<%@include file = "sideBoard.jsp" %>
</div>
<div>
<section>
<article>
	<h2>내 정보 변경</h2>
	<div class="myinfoForm">
	<div class="myinfoUp">
	<form name="myInfoUpdate" action="myInfoUpdate_ok.jsp" onsubmit="return validate()">
	<input type="hidden" name="idx" value="<%=dto.getIdx()%>">
	<table>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" id="name" value="<%=dto.getName()%>"><br/>
		<span id="name_error"></span></td>
	</tr>
	
	<tr>
		<th>아이디</th>
		<td><input type="text" name="id" value="<%=dto.getId()%>" readonly></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="pwd" id="pwd1" value="<%=dto.getPwd()%>"><br/>
		<span>8~16자 영문 대/소문자, 특수문자만 사용 가능합니다</span></td>
	</tr>
	<tr>
		<th>비밀번호 재확인</th>
		<td><input type="password" name="pwd2" id="pwd2" onchange="pwdCheck()" ><br/>
		<span id="pwd_error"></span></td>
	</tr>

	<tr>
		<th>본인 확인 이메일</th>
		<td><input type="text" name="email" id="email" value="<%=dto.getEmail()%>" ><br/>
		<span id="email_error"></span>
		</td>
	</tr>		
	
	<tr>
		<th>나이</th>
		<td><input type="text" name="age" id="age" value="<%=dto.getAge() %>" ><br/>
		<span id="age_error"></span></td>
	</tr>	
	<tr>
		<th>지역</th>
		<td>
			<select name="local" id="check">
			<option value="서울" <%=dto.getLocal().equals("서울")?"selected":""%>>서울</option>
			<option value="경기" <%=dto.getLocal().equals("경기")?"selected":""%>>경기</option>
			<option value="인천" <%=dto.getLocal().equals("인천")?"selected":""%>>인천</option>
			<option value="강원" <%=dto.getLocal().equals("강원")?"selected":""%>>강원</option>
			<option value="충북" <%=dto.getLocal().equals("충북")?"selected":""%>>충북</option>
			<option value="충남" <%=dto.getLocal().equals("충남")?"selected":""%>>충남</option>
			<option value="대전" <%=dto.getLocal().equals("대전")?"selected":""%>>대전</option>
			<option value="세종" <%=dto.getLocal().equals("세종")?"selected":""%>>세종</option>
			<option value="전북" <%=dto.getLocal().equals("전북")?"selected":""%>>전북</option>
			<option value="전남" <%=dto.getLocal().equals("전남")?"selected":""%>>전남</option>
			<option value="광주" <%=dto.getLocal().equals("광주")?"selected":""%>>광주</option>
			<option value="경북" <%=dto.getLocal().equals("경북")?"selected":""%>>경북</option>
			<option value="경남" <%=dto.getLocal().equals("경남")?"selected":""%>>경남</option>
			<option value="대구" <%=dto.getLocal().equals("대구")?"selected":""%>>대구</option>
			<option value="울산" <%=dto.getLocal().equals("울산")?"selected":""%>>울산</option>
			<option value="부산" <%=dto.getLocal().equals("부산")?"selected":""%>>부산</option>
			<option value="제주" <%=dto.getLocal().equals("제주")?"selected":""%>>제주</option>
			</select></td>
	</tr>
	<tr>
		<th>관심사</th>
		<td>
			<select name="hobby" id="check">
			<option value="운동" <%=dto.getHobby().equals("운동")?"selected":"" %>>운동</option>
			<option value="게임" <%=dto.getHobby().equals("게임")?"selected":"" %>>게임</option>
			<option value="여행" <%=dto.getHobby().equals("여행")?"selected":"" %>>여행</option>
			<option value="공연" <%=dto.getHobby().equals("공연")?"selected":"" %>>공연</option>
			<option value="요리" <%=dto.getHobby().equals("요리")?"selected":"" %>>요리</option>
			<option value="음악" <%=dto.getHobby().equals("음악")?"selected":"" %>>음악</option>
			<option value="봉사" <%=dto.getHobby().equals("봉사")?"selected":"" %>>봉사</option>
			<option value="댄스" <%=dto.getHobby().equals("댄스")?"selected":"" %>>댄스</option>
			</select></td>
	</tr>
	</table>
		<div class="button">
		<input type="submit" value="수정하기">
		</form>
	<form name="delMember" action="delMember_ok.jsp">	
		<input type="submit" value="탈퇴하기">
		<input type="hidden" name="idx" value="<%=dto.getIdx()%>">
	</form>
	</div>
	</div>
	</div>
</article>
</section>
</div>

<%@include file="/footer.jsp" %>
</body>
</html>