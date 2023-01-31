<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.moim.review.*"%>

<jsp:useBean id="rdao" class="com.moim.review.ReviewDAO" scope="session"></jsp:useBean>

<%
String idx_s = request.getParameter("idx");
if (idx_s == null || idx_s.equals("")) {
	idx_s = "0";
}

int idx = Integer.parseInt(idx_s);
ReviewDTO dto = rdao.updateReviewForm(idx);
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
	<h2>독서 모임 후기</h2>
	<form name="reviewupdate" action ="updateReview_ok.jsp">
			<input type="hidden"name="idx" value="<%=idx %>">
<%System.out.println("222222"); %>
	<h4>
		-모임명 :
		<%=dto.getMoimname()%>&nbsp;&nbsp;&nbsp;&nbsp;-지역 :
		<%=dto.getLocal()%></h4>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<section>
		<article>
			<table>
				<thead>
					<tr>
						<th>이미지</th>

						<th>이미지</th>

						<th>이미지</th>
					</tr>
				</thead>
				<tr height="150">
					<td colspan="3"><%=dto.getContent().replaceAll("\n", "\r")%></td>
				</tr>
				<tfoot>
					<tr>
						<td colspan="3"><input type="reset" value="취소하기"> <input
							type="submit" value="수정하기"> <input type="button"
							value="취소하기"></td>
					</tr>
				</tfoot>

<% System.out.println("1111");%>
			</table>
		</article>
	</section>
	</form>
	<%@include file="/footer.jsp"%>
</body>
</html>