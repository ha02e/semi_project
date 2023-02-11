<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Integer idx = (Integer) session.getAttribute("idx");
if (idx==null) {
%>
<script>
	window.alert('로그인 후 이용가능합니다');
	location.href = '/moim/info/infoList.jsp';
</script>
<%
return;
}
%>
    
<jsp:useBean id="mdto" class="com.moim.info.InfoDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.moim.info.InfoDAO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">

<style>
section{
	width:800px;
	margin:0 auto;
	padding:50px 0;
}
section h2{
	font-size:45px;
	width: 85%;
	margin:0 auto;	
	font-family: 'Black Han Sans', sans-serif;
	font-weight: normal;
	text-align: center;
}
section p{
	font-size: 15px;
	margin:4px 0 20px 0;
	color:#666666;
	text-align: center;
}

section .write table{
	width:800px;
	border-top:3px solid #333333;
	border-bottom:3px solid #333333;
	padding:10px 20px 20px 20px;
	background:#f6f6f6;
}
section .write table th{
	text-align:left;
	font-size:18px;
	padding:14px 10px 14px 0;
}
section .write table td{
	padding:4px 0;
}

.write table tr{
	/*padding:40px 0;*/
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
textarea{
	border: 1px solid #999999; 
	border-radius: 0px; 
	padding:8px;
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
function pageBack(){
	location.href='infoList.jsp';
}

function validate(){
	var moimname=document.getElementById("moimname");
	var content=document.getElementById("content");
	
	if(moimname.value=="" || moimname==null){
		window.alert('모임이름을 입력해주세요');
		moimname.focus();
		return false;
	}
	if(content.value=="" || content==null){
		window.alert('내용을 입력해주세요');
		return false;
	}
}
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
<article>
	<h2>모임 만들기</h2>
	<p>모임의 기본 정보를 입력해주세요 :)</p>
	<div class="moimcontent">
		<div class="contents write">
		<form name="moimWrite" action="moimWrite_ok.jsp" method="post" 
			enctype="multipart/form-data" onsubmit="return validate()">
			<table>
				<tr>
					<th>카테고리</th>
					<td>
						<select name="hobby">
							<option value="운동">운동</option>
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
				<tr>
					<th>모임이름</th>
					<td>
						<input type="text" name="moimname" id="moimname" size="52" placeholder="모임이름을 입력해주세요.">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" id="content" rows="10" cols="80" placeholder="내용을 입력해주세요." style="resize:none" ></textarea>
					</td>
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
					<th>정원</th>
					<td>
						<select name="maxmem">
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>이미지</th>
					<td><input type="file" name="upload" value="이미지 올리기" accept="image/*">*최대 업로드 파일 크기:2 MB</td>
				</tr>
			</table>
		</div>

		<div class="button">
			<input type="submit" value="모임 만들기">
			<input type="button" value="취소하기" onclick="pageBack();">
		</div>
		</form>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>