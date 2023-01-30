<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
String str[]=null;
if(request.getParameterValues("hobby")!=null){
str=request.getParameterValues("hobby");
}
String detail="";
if(request.getParameter("detail")!=null){
	detail=request.getParameter("detail");
}
%>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<form name="infoSearch" action="infoSearch.jsp">
			<input type="submit" value="검색">
			<input type="text" name="moimname">
			<%if(detail.equals("on")){ %>
			<input type="button" value="세부 검색" onclick="javascript:location.href='infoSearch.jsp'">
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
				<input type="button" value="세부 검색" onclick="javascript:location.href='infoSearch.jsp?detail=on'">
				<%}
				%>
		</form>
	</article>
	<article>
		<table>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</article>
	<hr>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>