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
</head>
<%
int idx=1;
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
	<form>
	<fieldset>
		<ul>
			<li><label>이름:</label>
			<input type="text" value="<%=dto.getName()%>"></li>
			<li><label>아이디:</label>
			<input type="text" value="<%=dto.getId()%>"></li>
			<li><label>비밀번호:</label>
			<input type="password" value="<%=dto.getPwd()%>"></li>
			<li><label>이메일:</label>
			<input type="text" value="<%=dto.getEmail()%>"></li>
			<li><label>지역:</label>
			<select name="local">
			<option value="서울">서울</option>
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
			</select></li>
			<li><label>나이:</label>
			<input type="text" value="<%=dto.getAge()%>"></li>
			<li><label>관심사:</label>
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
			</li>
			</ul>
		
		<div>
		<input type="submit" value="수정하기">
		<input type="submit" value="탈퇴하기">
		</div>
	</fieldset>
	</form>>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>