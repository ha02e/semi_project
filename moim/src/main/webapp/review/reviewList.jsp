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
div {
	text-align: center;
	margin: 0px auto;
}

table {
	border-top: 3px;
	border-left: 3px double dark;
	border-right: 3px solid dark;
	border-bottom: 3px solid dark;
	text-align: center;
	margin: 0px auto;
	width: 800px;
}

table thead {
	margin-bottom: 70px;
	margin: 0px auto;
	border-pacing: 70px;
}

table tfoot {
	text-align: center;
	margin: 0px auto;
}

div {
	margin: 0px auto;
	texxt-align: center;
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

int totalCnt = rdao.getTotalCnt(userhobby, keyword, boo); // db로부터 가져와야하는 정보
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
	<section>
		<article>
			<%@include file="/header.jsp"%>
			<form name="search" action="reviewList.jsp">
				<div>
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
			<table>

				<tfoot>
					<tr>
						<td></td>
						<td>
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
					
						<td><input type="button"
							onclick="location.href='writeReview.jsp'" value="후기쓰러가기">
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
						<td><%=arr.get(i).getMoimname()%></td>
						<td><%=arr.get(i).getSubject()%></td>
					</tr>

					<%
					}
					}
					%>
					<tr>
						<td></td>
						<td></td>

					</tr>
				</tbody>

			</table>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>