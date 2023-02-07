<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.moim.info.*" %>
<jsp:useBean id="idao" class="com.moim.info.InfoDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임게시판</title>
<style>
div table{
	margin: 0px 100px;
}
.infotab{
	width:200px;
	height:200px;
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
	margin-right: 5px;

}
.infotable{
	width:200px;
	height:200px;
	float: left;
}
#buttondiv{
	text-align: right;

}
#detaildiv{
	height:100px;
	margin-top:20px;
}
/*세부사항 내 관심사*/
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
  section img{
  width: 200px;
  height: 200px;
  }
/*세부사항 토글관련*/
label.detail{
	border: 1px groove black;
	background-color: #f4f4f4;
}
input#detail{
	display:none;
}
div#detaildiv{
	display: none;
}
input#detail:checked + div#detaildiv{
	display: block;
}
</style>
</head>
<%
String detail="";
if(request.getParameter("detail")!=null){
detail=request.getParameter("detail");
}
String hobby="total";
if(session.getAttribute("hobby")!=null&&!session.getAttribute("hobby").equals("")){
	hobby=(String)session.getAttribute("hobby");
}
%>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<form name="infoSearch" action="infoSearch.jsp">
			<input type="submit" value="검색">
			<input type="text" name="keyword" placeholder="검색어를 입력하세요">
			<label class="detail" for="detail">세부검색</label>
			<input type="checkbox" id="detail">
				<div id="detaildiv">
				<fieldset>
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
						<td><input type="checkbox" name="hobby" value="봉사">봉사</td>
						<td><input type="checkbox" name="hobby" value="댄스">댄스</td>
					</tr>
					<tr>
					<th>지역</th>
					<td>
						<select name="local">
							<option value="전체" selected>전체</option>
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
						</select>
						</td>
					</tr>
				</table>
				</fieldset>
				</div>
		</form>
	</article>
	<hr>
	<article>
	<h3>맞춤 추천</h3>
		<div>
		<%
		ArrayList<InfoDTO> fitarr=idao.getList(hobby);
		if(fitarr!=null){
		for(int i=0;i<fitarr.size()&&i<=1;i++){ %>
			<table class="infotab">
				<tr>
					<td><img alt="fitimg<%=i%> %>" src="/moim/userimg/<%=fitarr.get(i).getImg()%>"></td>
				</tr>
			</table>
			<ul>
				<li><a href="moimContent.jsp?idx=<%=fitarr.get(i).getIdx()%>"><%=fitarr.get(i).getMoimname() %></a></li>
				<li><%=fitarr.get(i).getLocal() %></li>
				<li><%=fitarr.get(i).getHobby() %></li>
				<li><%=fitarr.get(i).getNowmem() %>/<%=fitarr.get(i).getMaxmem() %></li>
			</ul>
			<%
		}
		}else{%>
			<h3>모임이 없습니다.</h3>
		<%} %>
		</div>
	</article>
	<hr>
	<article>
		<h3 id="infoh3">현재 모집중인 소모임</h3>
		<h3 id="infoh32"><a href="infoSearch.jsp">더보기</a></h3>
		<div id="infodiv2">
		<%
		ArrayList<InfoDTO> needarr=idao.getList("total");
		if(needarr==null||needarr.size()==0){
			%><h2>현재 모집중인 모임이 없습니다</h2><%
		}else{
		for(int i=0;i<needarr.size()&&i<4;i++){ %>
			<table class="infotab" id="infotab">
				<tr>
					<td><img alt="needimg<%=i %>" src="/moim/userimg/<%=needarr.get(i).getImg()%>"></td>
				</tr>
			</table>
		<%} %>
		</div>
		<div id="infodiv2">
		<%for (int i=0;i<needarr.size()&&i<4;i++){ %>
		<table class="infotable" id="infotab">
				<tr>
					<td>
					<ul>
						<li><a href="moimContent.jsp?idx=<%=needarr.get(i).getIdx()%>"><%=needarr.get(i).getMoimname() %></a></li>
						<li><%=needarr.get(i).getLocal() %></li>
						<li><%=needarr.get(i).getHobby() %></li>
						<li><%=needarr.get(i).getNowmem() %>/<%=needarr.get(i).getMaxmem() %></li>
					</ul>
					</td>
				</tr>
			</table>
		<%}} %>
		</div>
		<hr>
		<div id="buttondiv">
		<input type="button" value="모임만들기" onclick="javascript:location.href='moimWrite.jsp'">
		</div>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>