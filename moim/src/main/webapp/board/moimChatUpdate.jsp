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
String writer=request.getParameter("writer");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
MemberDTO dto2=mdao.getMem(idx);
%>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h3>모임게시판 글 수정하기</h3>
		<form name="moimChatUpdate" action="moimChatUpdate_ok.jsp" enctype="UTF-8">
		<input type="hidden" name="idx" value="<%=idx%>">
		<input type="hidden" name="idx_info" value="<%=idx_info%>">
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" value="<%=writer%>"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="subject" value="<%=subject%>">
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea rows="10" cols="55" name="content"><%=content%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center"><input type="submit" value="수정하기">
				</td>
			</tr>
		</table>
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>