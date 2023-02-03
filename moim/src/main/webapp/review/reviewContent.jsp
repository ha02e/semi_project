<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.moim.review.* "%>
<jsp:useBean id="rdao" class="com.moim.review.ReviewDAO" scope="session"></jsp:useBean>
<%
String idx_s = request.getParameter("idx");
if (idx_s == null || idx_s.equals("")) {
	idx_s = "0";
}

int idx = Integer.parseInt(idx_s);
ReviewDTO dto = rdao.getContent(idx);
if (dto == null) {
%>
<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다');
	location.href = 'reviewList.jsp';
</script>
<%
// 더이상 자바코드가 번역되지 않도록
return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
h2, h4 {
	text-align: center;
	margin: 0px auto;
}

table {
	text-align: center;
	margin: 0px auto;
}
</style>
<body>
	<%@include file="/header.jsp"%>

	<h2><%=dto.getSubject()%></h2>
	<input type="hidden" name="idx" value="<%=idx%>">
	<h4>
		-모임명 :
		<%=dto.getMoimname()%>&nbsp;&nbsp;&nbsp;&nbsp;-지역 :
		<%=dto.getLocal()%></h4>
	<section>
		<table>
			<thead>
				<article>
					<%
				if (dto.getImg() == null || dto.getImg().equals("")) {
				%>

				

					<%
				}else{
					%>
					<tr>
						<td><img alt="이미지" src="img/<%=dto.getImg()%>" width=200
							height=200></td>
						<td><img alt="이미지" src="img/<%=dto.getImg()%>" width=200
							height=200"></td>
						<td><img alt="이미지" src="img/<%=dto.getImg()%>" width=200
							height=200"></td>
					</tr>
					<%} %>
				</article>
			</thead>

			<tr height="150">
				<td colspan="3"><%=dto.getContent().replaceAll("\n","\r")%></td>
			</tr>
			<tfoot>
				<tr>
					<td colspan="3"><input type="button" value="목록"
						onclick="location.href='reviewList.jsp'"> <input
						type="button" name="modify" value="수정"
						onclick="javascript:location.href='updateReview.jsp?idx=<%=idx%>'">
						<input type="button" name="delete" value="삭제"
						onclick="javascript:location.href='reviewDel.jsp?idx=<%=idx%>'"></td>
				</tr>
			</tfoot>

		</table>
	</section>

	<%@include file="/footer.jsp"%>
</body>
</html>