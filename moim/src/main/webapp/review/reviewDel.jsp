<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdto" class="com.moim.review.ReviewDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="rdto" />
<jsp:useBean id="rdao" class="com.moim.review.ReviewDAO" scope="session"></jsp:useBean>
<%
int result = rdao.delReview(rdto);
String msg = result > 0 ? "후기 삭제 완료" : "후기 삭제 실패";
%>

<script>
window.alert('<%=msg%>');
	location.href = "reviewList.jsp";
</script>

