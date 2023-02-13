<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>

section{
	width:800px;
	margin:0 auto;
}
section h2{
	margin:40px 0 20px 0;
}

section .memJoinWrite table{
	width:800px;
	border-top:3px solid #333333;
	border-bottom:3px solid #333333;
	padding:10px 20px 20px 20px;
	background:#f6f6f6;
}
section .memJoinWrite table th{
	text-align:left;
	font-size:18px;
	padding:14px 10px 14px 0;
}
section .memJoinWrite table td{
	padding:4px 0;
}

.memJoinWrite table tr{
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

input[type="password"] {
	border: 1px solid #999999; 
	border-radius: 0px; 
	padding:8px;
}

span{
	font-size:12px;
}

.button{
	text-align: center;
	padding:20px 0 40px 0;
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
	
	
	/**아이디, 이름, 이메일, 나이 유효성 검사*/
	function validate(){
		var id=document.getElementById("id");
		var name=document.getElementById("name");
		var email=document.getElementById("email");
		var age=document.getElementById("age");
		
		var id_error=document.getElementById("id_error");
		var name_error=document.getElementById("name_error");
		var email_error=document.getElementById("email_error");
		var age_error=document.getElementById("age_error");
	
		
		/**아이디*/
		if(id.value==""){
			id_error.innerHTML="아이디 중복검사를 해주세요";
			id_error.style.color="red";
			id.focus();
			return false;
		}
		
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
<body>
<%@include file="/header.jsp"%>
	<section>
		<article>
				<h2>회원가입</h2>
				<div class="memJoinForm">
					<div class="memJoinWrite">
					<form name="memJoin" action="memberJoin_ok.jsp" method="post" onsubmit="return validate()">
					<table>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id"  id="id" readonly>
							<input type="button" onclick="idcheck();" value="ID 중복 검사"></br>
							<span id="id_error">5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</span></td>
						</tr>
						
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pwd" id="pwd1" ></br>
							<span>8~16자 영문 대/소문자, 특수문자만 사용 가능합니다</span></td>
						</tr>
						
						<tr>
							<th>비밀번호 재확인</th>
							<td><input type="password" name="pwd2" id="pwd2" onchange="pwdCheck()" ></br>
							<span id="pwd_error"></span></td>
						</tr>
						
						<tr>
							<th>이름</th>
							<td><input type="text" name="name" id="name" ></br>
							<span id="name_error"></span></td>
						</tr>
						
						<tr>
							<th>본인 확인 이메일</th>
							<td><input type="text" name="email" id="email" ></br>
							<span id="email_error"></span>
							</td>
						</tr>
						
						<tr>
							<th>나이</th>
							<td><input type="text" name="age" id="age" ></br>
							<span id="age_error"></span></td>
						</tr>
						
						<tr>
							<th>지역</th>
							<td>
							<select name="local">
								<option value="서울" selected>서울</option>
								<option value="경기">경기</option>
								<option value="인천">인천</option>
								<option value="강원">강원</option>
								<option value="충북">충북</option>
								<option value="충남">충남</option>
								<option value="대전">대전</option>
								<option value="세종">세종</option>
								<option value="전북">전북</option>
								<option value="전남">전남</option>
								<option value="광주">광주</option>
								<option value="경북">경북</option>
								<option value="경남">경남</option>
								<option value="대구">대구</option>
								<option value="울산">울산</option>
								<option value="부산">부산</option>
								<option value="제주">제주</option>
							</select>
							</td>
						</tr>
							
						<tr>
							<th>관심사</th>
							<td>
							<select name="hobby">
								<option value="운동" selected>운동</option>
								<option value="게임">게임</option>
								<option value="여행">여행</option>
								<option value="공연">공연</option>
								<option value="요리">요리</option>
								<option value="음악">음악</option>
								<option value="봉사">봉사</option>
								<option value="댄스">댄스</option>
							</select>
							</td>
						</tr>	
					</table>	
				<div class="button">
					<input type="submit" value="회원가입">
				</div>
				</form>
				</div>
			</div>
		</article>
	</section>
<%@include file="/footer.jsp"%>
</body>
</html>