<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moim.member.*" %>
<%@ page import="com.moim.noimg.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<jsp:useBean id="mdao" class="com.moim.member.MemberDAO" scope="session"></jsp:useBean>
<%

String idx_s=request.getParameter("idx");
if(idx_s==null||idx_s.equals("")){
	idx_s="0";
}
int idx=Integer.parseInt(idx_s);

String idx_info_s=request.getParameter("idx_info");
if(idx_info_s==null||idx_info_s.equals("")){
	idx_info_s="0";
}
int idx_info=Integer.parseInt(idx_info_s);

NoimgDTO dto=mdao.getContent(idx,3);
if(dto==null){
	%>
	<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	location.href='moimChat.jsp';
	</script>
	<%
	return;
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>모임게시판</title>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h2>모임게시판 보기</h2>
		<table border="1" width="600">
			<tr>
				<th>번호</th>
				<td><%=dto.getIdx() %></td>
				<th>작성날짜</th>
				<td><%=dto.getWritedate() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getWriter() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><%=dto.getSubject() %></td>
			</tr>
			<tr height="150">
				<td colspan="4">
					<%=dto.getContent().replaceAll("\n", "<br>") %>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
				<a href="moimChatUpdate.jsp?idx=<%=dto.getIdx() %>&writer=<%=dto.getWriter()%>&subject=<%=dto.getSubject()%>&content=<%=dto.getContent()%>&idx_info=<%=idx_info %>">수정</a> | <a href="moimChat.jsp?idx=<%=idx_info%>">목록</a> | <a href="writeReChat.jsp?subject=<%=dto.getSubject()%>&ref=<%=dto.getRef()%>&lev=<%=dto.getLev()%>&sunbun=<%=dto.getSunbun()%>">답변</a>
				</td>
			</tr>
		</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>