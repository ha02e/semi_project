<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.moim.stat.*"%>
<jsp:useBean id="sdao" class="com.moim.stat.StatDAO"></jsp:useBean>
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
HashMap<Integer, String> hash = sdao.getName();
%>


<%
String idx_info_s = request.getParameter("idx_info");
if (idx_info_s == null || idx_info_s.equals("")) {
	idx_info_s = "0";
}
int idx_info = Integer.parseInt(idx_info_s);

String stat_s = request.getParameter("stat");
if (stat_s == null || stat_s.equals("")) {
	stat_s = "0";
}
int stat = Integer.parseInt(stat_s);

int totalCnt = sdao.getTotalCnt(idx_info, stat);

int listSize = 5;
int pageSize = 5;
String cp_s = request.getParameter("cp");
if (cp_s == null || cp_s.equals("")) {
	cp_s = "1";
}

int cp = Integer.parseInt(cp_s);

String ls_s = request.getParameter("ls");
if (ls_s == null || ls_s.equals("")) {
	ls_s = "1";
}
int ls = Integer.parseInt(ls_s);

int totalPage = totalCnt / listSize + 1;
if (totalCnt % listSize == 0)
	totalPage--;

int userGroup = cp / pageSize;
if (cp % pageSize == 0)
	userGroup--;
%>


<body>
	<%@include file="/board/sideBoard.jsp"%>
	<%@include file="/header.jsp"%>
	<section>
		<table>
			<article>
				<tr>
					<th>참여자</th>
					<th>가입일자</th>
					<th>관리</th>
				</tr>
				<tr>
					<%
					ArrayList<StatDTO> arr = sdao.getNewPerStatList(idx_info, stat, ls, cp);
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
					
					<td><%=hash.get(idx_info)%></td>
					<td><%=arr.get(i).getJoindate()%></td>
					<td><input type="button" value="탈퇴"></td>
				</tr>

				<%
				}
				}
				%>
				</tr>
				<tr>
					<td colspan="3">
						<%
						if (userGroup != 0) {
						%><a
						href="statList.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;
							&lt;</a> <%
 }
 %> <%
 for (int i = userGroup * pageSize + 1; i <= userGroup * pageSize + pageSize; i++) {
 %>&nbsp;&nbsp;<a href="statList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;<%
 if (i == totalPage)
 	break;
 }
 %> <%
 // 오른쪽 화살표
 if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
 %><a href="statList.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>">&gt;&gt;</a>
						<%
						}
						%>
					</td>
				</tr>
			</article>
			<article>
				<tr>
					<th>신청자</th>
					<th>가입일자</th>
					<th>관리</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><input type="button" value="내용보기" onclick="show()"></td>
				</tr>
				<tr>
					<td colspan="3">
						<%
						if (userGroup != 0) {
						%><a
						href="statList.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;
							&lt;</a> <%
 }
 %> <%
 for (int i = userGroup * pageSize + 1; i <= userGroup * pageSize + pageSize; i++) {
 %>&nbsp;&nbsp;<a href="statList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;<%
 if (i == totalPage)
 	break;
 }
 %> <%
 // 오른쪽 화살표
 if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
 %><a href="statList.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>">&gt;&gt;</a>
						<%
						}
						%>
					</td>
				</tr>
			</article>
		</table>
	</section>

	<%@include file="/footer.jsp"%>
</body>
</html>