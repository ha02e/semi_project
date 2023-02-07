<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moim.member.*" %>
<%@ page import="com.moim.noimg.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<jsp:useBean id="mdao" class="com.moim.member.MemberDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
Integer idx=(Integer)session.getAttribute("idx");
if(idx==null){
	idx=0;
}
MemberDTO dto=mdao.getMem(idx);
%>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h3>모임게시판 글쓰기</h3>
		<form name="writeChat" action="writeChat_ok.jsp">
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" value="<%=dto.getName()%>"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="subject">
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea rows="10" cols="55" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center"><input type="submit" value="글쓰기">
				</td>
			</tr>
		</table>
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>