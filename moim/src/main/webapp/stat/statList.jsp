<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.moim.stat.*"%>
<%@page import="com.moim.info.*"%>
<jsp:useBean id="sdao" class="com.moim.stat.StatDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table {
	text-align: center;
	margin: 0px auto;
	border-pacing: 70px;
}
</style>



<%
int idx_info = request.getParameter("idx_info");


int stat= request.getParameter("stat");


int totalCnt = sdao.getTotalCnt(idx_info, stat);
int listSize = 5;
int pageSize = 5;
String cp_s = request.getParameter("cp");
if (cp_s == null || cp_s.equals("")) {
	cp_s = "1";
}
int cp = Integer.parseInt(cp_s);//핵심요소 사용자로부터 / 사용자의 위치

int totalPage = totalCnt / listSize + 1;
if (totalCnt % listSize == 0)
	totalPage--;
%>


<body>
	<%@include file="/board/sideBoard.jsp"%>
	<%@include file="/header.jsp"%>
	<section>
		<table>
			<article>
				<tr>
					<td>참여자</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>참여자</th>
					<th>가입일자</th>
					<th>관리</th>
				</tr>
				<tr>
					<td>1</td>
					<td>2</td>
					<td><input type="button" value="탈퇴"></td>
				</tr>
			</article>
			<article>
				<tr>
					<td>신청자</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>참여자</th>
					<th>가입일자</th>
					<th>관리</th>
				</tr>
				<tr>
					<td>1</td>
					<td>2</td>
					<td><input type="button" value="내용보기"></td>
				</tr>
			</article>
		</table>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>