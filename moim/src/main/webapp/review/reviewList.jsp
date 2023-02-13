<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.moim.review.*"%>

<jsp:useBean id="rdao" class="com.moim.review.ReviewDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 게시판</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">

<style>
section{
	width:1280px;
	margin:0px auto;
	padding:50px 0;
}

h2{
	font-size:45px;
	width: 85%;
	margin:0 auto;
	font-family: 'Black Han Sans', sans-serif;
	font-weight: normal;
	text-align: center;
}

/* 검색창 */
form{
	width: 85%;
	margin:10px auto 20px auto;
	text-align: right;
}
form select{
	border: 2px solid #00cdac; 
	border-radius: 0px; 
	padding:7px;
}
form input[type="text"] {
	border: 2px solid #00cdac; 
	border-radius: 0px; 
	padding:8px;
}
form input[type="submit"] {
	border:0; 
	background-color:transparent;
	background-image:url("/moim/img/search.png");
	background-position:center;
	background-repeat:no-repeat;
	width:30px;
	height:40px;
	cursor: pointer;
	margin:-16px 0;
}

/* 게시판 리스트 */
table {
	width: 85%;
	margin:0 auto 0px auto;
	text-align: center;
	border-collapse: collapse;
}

table a:link, table a:visited{
	text-decoration: none;
	color:#333333;
}
.subject_r a:hover{
	font-weight: 800;
	color:black;
}

.category_r{
	width:15%;
}
.writer_r{
	width: 15%;
}
.moimname_r{
	width:30%;
}
.subject_r{
	width:40%;
}
td.subject_r{
	text-align: left;
	margin-left:20px;
}
table th {
	height: 46px;
	border-top: 2px solid #4C7C77; 
	border-bottom: 1px solid #4C7C77;
	text-align: center;
	vertical-align: inherit;
	background: #f3f3f3;
}

table td {
	border-bottom: 1px solid #e5e5e5;
	height: 46px;	
}

table #idx {
	width: 5%;
}

table #subject {
	width: 70%;
	text-align: left;
}

table #writedate {
	width: 15%;
}

#b {
	text-align: center;
	margin: 10px;
}

.bottom{
	width:1280px;
}

.button {
	width:85%;
	margin:0 auto;
	text-align: right;
	padding: 0px 0 40px 0;
}

.button input{
	border: 0;
	outline: none;
	width: 160px;
	height: 40px;
	cursor: pointer;	
	color: white;
}

.button input[type="button"] {
	background: #00cdac;
}

.button input:hover {
	background: #333333;
	transition: 0.3s;
}

/* 페이징 */
.paging{
	width: 85%;
	margin: 20px auto;
	text-align: center;
}
.paging a{
	display: inline-block;
	width: 34px;
	height: 34px;
	line-height: 34px;
	transition:0.2s;
}
.paging a:link,a:visited{
	text-decoration: none;
	color:#333333;
}
.paging a:hover{	
	font-weight: 800;
	color:#ffffff;
	background:#00cdac;
	border-radius: 100%;
}

</style>
</head>
<%
String userhobby = "전체";

if (request.getParameter("hobby") != null) {
	userhobby = request.getParameter("hobby");
}

String keyword = "";
if (request.getParameter("keyword") != null) {
	keyword = request.getParameter("keyword");
}

boolean boo = true;
if (userhobby.equals("전체") && keyword.equals("")) {
	boo = false;
}

int listSize = 10;//내 맘
int pageSize = 5;//내 맘
String cp_s = request.getParameter("cp");
if (cp_s == null || cp_s.equals("")) {
	cp_s = "1";
}
int cp = Integer.parseInt(cp_s);//핵심요소 사용자로부터 / 사용자의 위치

int totalCnt = rdao.getTotalCnt(userhobby, keyword, boo);
ArrayList<ReviewDTO> arr = rdao.getList(listSize, cp, userhobby, keyword, boo);

int totalPage = totalCnt / listSize + 1;
if (totalCnt % listSize == 0)
	totalPage--;
%>
<%
////////////사용자 위치///////
int userGroup = cp / pageSize;
if (cp % pageSize == 0)
	userGroup--;
%>
<body>		
<%@include file="/header.jsp"%>
	<section>
		<article>
				<h2>모임 후기 보기</h2>
	
				<form name="search" action="reviewList.jsp">
					<div class ="search2">
						<select name="hobby">
							<option value="전체" selected>전체</option>
							<option value="운동">운동</option>
							<option value="게임">게임</option>
							<option value="여행">여행</option>
							<option value="공연">공연</option>
							<option value="요리">요리</option>
							<option value="음악">음악</option>
							<option value="봉사활동">봉사활동</option>
							<option value="댄스">댄스</option>
						</select> <input type="text" name="keyword" size="30"> <input type="submit"
							value="">
					</div>
				</form>
	
			<table>

				<thead>
					<tr>

						<th class="category_r">카테고리</th>
						<th class="writer_r">작성자</th>
						<th class="moimname_r">모임이름</th>
						<th class="subject_r">제목</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (arr == null || arr.size() == 0) {
					%>

					<tr>
						<td colspan="4">등록된 글이 없습니다</td>
					</tr>
					<%
					} else {
					for (int i = 0; i < arr.size(); i++) {
					%>

					<tr>
						<td class="category_r"><a href="reviewContent.jsp?idx=<%=arr.get(i).getIdx()%>"><%=arr.get(i).getHobby()%></a>
						</td>
						<td class ="writer_r"><a href="reviewContent.jsp?idx=<%=arr.get(i).getIdx()%>"><%=arr.get(i).getWriter()%></a></td>
						<td class="moimname_r"><a href="reviewContent.jsp?idx=<%=arr.get(i).getIdx()%>"><%=arr.get(i).getMoimname()%></a></td>
						<td class="subject_r"><a href="reviewContent.jsp?idx=<%=arr.get(i).getIdx()%>"><%=arr.get(i).getSubject()%></a></td>
					</tr>

					<%
					}
					}
					%>
				</tbody>

			</table>
			<div class="bottom">
			<div class="paging">
			<%
							if (userGroup != 0) {
							%><a
							href="reviewList.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>&hobby=<%=userhobby%>&keyword=<%=keyword%>">&lt;
								&lt;</a> <%
 }
 %> <%
 for (int i = userGroup * pageSize + 1; i <= userGroup * pageSize + pageSize; i++) {
 %>&nbsp;&nbsp;<a
							href="reviewList.jsp?cp=<%=i%>&hobby=<%=userhobby%>&keyword=<%=keyword%>"><%=i%></a>&nbsp;&nbsp;<%
 if (i == totalPage)
 	break;
 }
 %> <%
 // 오른쪽 화살표
 if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
 %><a
							href="reviewList.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>&hobby=<%=userhobby%>&keyword=<%=keyword%>">&gt;&gt;</a>
							<%
							}
							%>
			</div>
			<div class="button">
				<input type="button" onclick="location.href='/moim/board/myMoim.jsp'"
						value="후기쓰러가기">
			</div>
			</div>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>