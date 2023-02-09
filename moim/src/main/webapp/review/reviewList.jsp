<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.moim.review.*"%>

<jsp:useBean id="rdao" class="com.moim.review.ReviewDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{
	width:1280px;
	margin:0 auto;
	border:1px solid red;
}

.review_top{
	width: 85%;
	display:flex;
	align-items:baseline;
	margin:0 auto;
}
h2{
	width:50%;
}

form{
	width: 50%;
	text-align: right;
}
form input[type="text"] {
	border: 1px solid #999999; 
	border-radius: 0px; 
	padding:8px;
}
form input[type="submit"] {
	border: 1px solid #999999; 
	border-radius: 0px; 
	padding:8px;
}

table {
	width: 85%;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	border-collapse: collapse;
}

table th {
	height: 30px;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	background-color: gray;
	text-align: center;
	vertical-align: inherit;
}

table td {
	border-bottom: 1px solid gray;
	padding: 10px;
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

.button {
	text-align: right;
	padding: 20px 0 40px 0;
}

.button input{
	border: 0;
	outline: none;
	width: 160px;
	height: 40px;
	cursor: pointer;
	background: #999999;
	color: white;
}

.button input[type="submit"] {
	background: #333333;
}

.button input:hover {
	background: #00cdac;
	transition: 0.3s;
}
.search2{
	textt-align :center;
	margin :10px auto;
	float : center;
	cursor : pointer;
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
			<div class="review_top">
				<h2>후기 게시판</h2>
	
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
						</select> <input type="text" name="keyword"> <input type="submit"
							value="검색">
					</div>
				</form>
			</div>
	
			<table>

				<tfoot>
					<tr>

						<td colspan="2" align="right">
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
						</td>
						<td>
							<div class="button">
								<input type="button" onclick="location.href='writeReview.jsp'"
									value="후기쓰러가기">
							</div>
						</td>
					</tr>
				</tfoot>

				<thead>
					<tr>

						<th>카테고리</th>
						<th>모임이름</th>
						<th>제목</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (arr == null || arr.size() == 0) {
					%>

					<tr>
						<td colspan="3">등록된 글이 없습니다</td>
					</tr>
					<%
					} else {
					for (int i = 0; i < arr.size(); i++) {
					%>

					<tr>
						<td><a href="reviewContent.jsp?idx=<%=arr.get(i).getIdx()%>"><%=arr.get(i).getHobby()%></a>
						</td>
						<td><a href="reviewContent.jsp?idx=<%=arr.get(i).getIdx()%>"><%=arr.get(i).getMoimname()%></a></td>
						<td><a href="reviewContent.jsp?idx=<%=arr.get(i).getIdx()%>"><%=arr.get(i).getSubject()%></a></td>
					</tr>

					<%
					}
					}
					%>
				</tbody>

			</table>

		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>