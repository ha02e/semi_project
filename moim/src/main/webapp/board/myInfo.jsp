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
<title>Insert title here</title>
<style>
fieldset{
	height:340px;
	width:800px;
	background-color: gray;
	float:center;
	font-size: 30px;
	margin:0px auto;
}
fieldset div{
	float:right;
}
select{
	font-size: 25px;
}
input{
	font-size: 25px;
}
</style>
<script>
function pwd_check(){
	var pwd1=document.getElementById('pwd').value;
	var pwd2=document.getElementById('pwd_confirm').value;
	var msg=document.getElementById('pwd_error');
	
	if(pwd1!=pwd2){
		msg.innerHTML="비밀번호 불일치";
		pwd_error.style.color="red";
	}else{
		msg.innerHTML="일치";
		pwd_error.style.color="green";}
}
</script>
</head>
<%
int idx=21;
if(session.getAttribute("idx")!=null&&!session.getAttribute("idx").equals("")){
	String idx_s=(String)session.getAttribute("idx");
	idx=Integer.parseInt(idx_s);
}
MemberDTO dto=mdao.getMem(idx);
%>
<body>
<%@include file="/header.jsp" %>
<%@include file="sideBoard.jsp" %>
<section>
<article>
	<form name="myInfoUpdate" action="myInfoUpdate_ok.jsp">
	<fieldset>
		<ul>
			<li>
			<input type="hidden" name="idx" value="<%=dto.getIdx()%>"></li>
			<li><label>이름:</label>
			<input type="text" name="name" value="<%=dto.getName()%>"></li>
			<li><label>아이디:</label>
			<input type="text" name="id" value="<%=dto.getId()%>"></li>
			<li><label>비밀번호:</label>
			<input type="password" name="pwd" value="<%=dto.getPwd()%>" id="pwd"></li>
			<li><label>비밀번호 재확인:</label>
			<input type="password" name="pwd_confirm" id="pwd_confirm" onchange="pwd_check()"></li>
			<span id="pwd_error"></span>
			<li><label>이메일:</label>
			<input type="text" name="email" value="<%=dto.getEmail()%>"></li>
			<li><label>지역:</label>
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
			</select></li>
			<li><label>나이:</label>
			<input type="text" name="age" value="<%=dto.getAge()%>"></li>
			<li><label>관심사:</label>
			<select name="hobby" id="check">
			<option value="운동" <%=dto.getHobby().equals("운동")?"selected":"" %>>운동</option>
			<option value="게임" <%=dto.getHobby().equals("게임")?"selected":"" %>>게임</option>
			<option value="여행" <%=dto.getHobby().equals("여행")?"selected":"" %>>여행</option>
			<option value="공연" <%=dto.getHobby().equals("공연")?"selected":"" %>>공연</option>
			<option value="요리" <%=dto.getHobby().equals("요리")?"selected":"" %>>요리</option>
			<option value="음악" <%=dto.getHobby().equals("음악")?"selected":"" %>>음악</option>
			<option value="봉사" <%=dto.getHobby().equals("봉사")?"selected":"" %>>봉사</option>
			<option value="댄스" <%=dto.getHobby().equals("댄스")?"selected":"" %>>댄스</option>
			</select>
			</li>
			</ul>
		<div>
		<input type="submit" value="수정하기">
		</div>
	</fieldset>
	</form>
	<form name="myInfoDelete" action="myInfoDelete_ok.jsp">	
		<input type="submit" value="탈퇴하기">
	</form>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>