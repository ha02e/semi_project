<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moim.info.*" %>
<jsp:useBean id="mdto" class="com.moim.info.InfoDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.moim.info.InfoDAO"></jsp:useBean>    
    
<%--
String idx_s = request.getParameter("idx");
if (idx_s == null || idx_s.equals("")) {
	idx_s = "0";
}

int idx = Integer.parseInt(idx_s);


--%>  
<%
int idx=15;
InfoDTO dto = mdao.getMoimCon(idx);  
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{
	width:800px;
	margin:0 auto;
}
section h2{
	margin:40px 0 0 0;
}
section p{
	font-size: 14px;
	margin:10px 0 20px 0;
	color:#666666;
}
/*
section .moimcontent{
	display:flex;
	margin:0 auto;
	width:800px;
	height:260px;
	padding:10px 0 30px 0;
}
*/
/*
section .write{
	width:500px;
}
*/
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
select {
	width: 100px; 
	padding: 6px 18px; 
	border: 1px solid #999999; 
	border-radius: 0px; 
}
input[type="text"] {
	border: 1px solid #999999; 
	border-radius: 0px; 
	padding:7px;
}
textarea{
	border: 1px solid #999999; 
	border-radius: 0px; 
}

.button{
	text-align: center;
	padding:20px 0 40px 0;
}
.button input[type="submit"]{
	background:#333333;
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
.button input:hover{
	background: #00cdac;
	transition: 0.3s;
}
</style>
<script>
function pageBack(){
	location.href='';
}
</script>
</head>
<%
//int idx=11;
System.out.println(idx);
//String idx=request.getParameter("idx");
String hobby=request.getParameter("hobby");
String moimname=request.getParameter("moimname");
String content=request.getParameter("content");
String local=request.getParameter("");
String img=request.getParameter("img");

%>
<body>
<%@include file="/header.jsp" %>
<section>
<article>
	<h2>모임 수정하기</h2>
	<p>수정할 모임 정보를 입력해주세요 :)</p>
	<div class="moimcontent">
		<div class="contents write">
		<form name="moimUpdate" action="moimUpdate_ok.jsp" method="post" enctype="multipart/form-data">
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
						<input type="text" name="moimname" size="52" placeholder="<%=dto.getMoimname()%>">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" rows="10" cols="80"><%=dto.getContent() %></textarea>
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
							<option value="1">1</option>
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
					<td><input type="file" name="upload" value="이미지 올리기" accept="image/*"></td>
						<input type="hidden" name="idx" value="<%=dto.getIdx()%>">
				</tr>
			</table>
		</div>
		<!--  	
			<script>
			function preview(input){
				if(input.files && input.files[0]){
					var reader=new FileReader();
					reader.onload=function(e){
						document.getElementById('viewimg').src=e.target.result;
					}
					reader.readAsDataURL(input.files[0]);
				}else{
					documemt.getElementById('viewimg').src="";
				}
			}
			</script> 
	 
		<div class="contents imgupload">
			<div class="img"><img id="viewimg"></div>
			<form name="imgUpload" method="post" enctype="multipart/form-data">
			<input type="file" name="upload" value="이미지 올리기" accept="image/*" onchange="preview(this);">
			</form>
			</div>
		</div>
		-->
		<div class="button">
			<input type="button" value="취소하기" onclick="pageBack();">
			<input type="hidden" name="idx" value="<%=dto.getIdx()%>">
			<input type="submit" value="모임 수정하기">
		</div>
		</form>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>