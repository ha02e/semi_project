<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%
	request.setCharacterEncoding("utf-8"); // 한글이 깨지지 않기 위해
	%>

<jsp:useBean id="rdto" class="com.moim.review.ReviewDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="rdto" />
<jsp:useBean id="rdao" class="com.moim.review.ReviewDAO" scope="session"></jsp:useBean>
<%
int result = rdao.setReview(rdto);
String msg = result > 0 ? "글쓰기 성공" : "글쓰기 실패";
%>

<script>
window.alert('<%=msg%>');
	location.href = "reviewList.jsp";
</script>

