<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String detail="";
if(request.getParameter("detail")!=null){
detail=request.getParameter("detail");
}
%>
<style>
div table{
	margin: 0px 100px;
}
.infotab{
	width:150px;
	height:150px;
	background-color: gray;
	float: left;
}
section ul{
	list-style: none;
	float:left;
}
section hr{
	clear: both;
}
table ul{
	float:left;
}
#infoh3{
	float:left;
	width: 550px;
}
#infoh32{
	float: right;
}
#infodiv2{
	clear:both;
	margin-top: 20px;
}
#infotab{
	margin-right: 20px;
}
.infotable{
	width:150px;
	height:150px;
	float: left;
}
#buttondiv{
	text-align: right;

}
#detaildiv{
	height:100px;
	background-color: gray;
	margin-top:20px;
}
input[type="checkbox"] {
    width: 10px;
    height: 10px;
    border-radius: 50%;
    border: 1px solid #999;
    appearance: none;
    cursor: pointer;
  }

  input[type="checkbox"]:checked {
    background: black;
    border: none;
  }
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<form name="infoSearch" action="infoSearch.jsp">
			<input type="submit" value="검색">
			<input type="text" name="moimname">
			<%if(detail.equals("on")){ %>
			<input type="button" value="세부 검색" onclick="javascript:location.href='infoList.jsp'">
				<div id="detaildiv">
				<table>
					<tr>
					<th>
					관심사
					</th>
						<td><input type="checkbox" name="hobby" value="운동">운동</td>
						<td><input type="checkbox" name="hobby" value="게임">게임</td>
						<td><input type="checkbox" name="hobby" value="여행">여행</td>
						<td><input type="checkbox" name="hobby" value="공연">공연</td>
						<td><input type="checkbox" name="hobby" value="요리">요리</td>
						<td><input type="checkbox" name="hobby" value="음악">음악</td>
						<td><input type="checkbox" name="hobby" value="봉사활동">봉사활동</td>
						<td><input type="checkbox" name="hobby" value="댄스">댄스</td>
					</tr>
					<tr>
					<th>지역</th>
					<td>
						<select name="local">
							<option value="전체" selected>전체</option>
							<option value="서울">서울</option>
							<option value="경기도">경기도</option>
							<option value="인천">인천</option>
							<option value="강원도">강원도</option>
							<option value="충청북도">충청북도</option>
							<option value="충청남도">충청남도</option>
							<option value="대전">대전</option>
							<option value="세종">세종</option>
							<option value="전라북도">전라북도</option>
							<option value="전라남도">전라남도</option>
							<option value="광주">광주</option>
							<option value="경상북도">경상북도</option>
							<option value="경상남도">경상남도</option>
							<option value="대구">대구</option>
							<option value="울산">울산</option>
							<option value="부산">부산</option>
							<option value="제주">제주</option>
						</select>
						</td>
					</tr>
				</table>
				</div>
			<%}else{
				%>
				<input type="button" value="세부 검색" onclick="javascript:location.href='infoList.jsp?detail=on'">
				<%}
				%>
		</form>
	</article>
	<hr>
	<article>
	<h3>맞춤 추천</h3>
		<div>
		<%for(int i=0;i<=1;i++){ %>
			<table class="infotab">
				<tr>
					<td></td>
				</tr>
			</table>
			<ul>
				<li>제목</li>
				<li>지역</li>
				<li>카테고리</li>
				<li>인원</li>
			</ul>
			<%} %>
		</div>
	</article>
	<hr>
	<article>
		<h3 id="infoh3">현재 모집중인 소모임</h3>
		<h3 id="infoh32">더보기</h3>
		<div id="infodiv2">
		<%for(int i=1;i<=4;i++){ %>
			<table class="infotab" id="infotab">
				<tr>
					<td></td>
				</tr>
			</table>
		<%} %>
		</div>
		<div id="infodiv2">
		<%for (int i=1;i<=4;i++){ %>
		<table class="infotable" id="infotab">
				<tr>
					<td>
					<ul>
						<li>제목</li>
						<li>지역</li>
						<li>카테고리</li>
						<li>인원</li>
					</ul>
					</td>
				</tr>
			</table>
		<%} %>
		</div>
		<hr>
		<div id="buttondiv">
		<input type="button" value="모임만들기">
		</div>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>