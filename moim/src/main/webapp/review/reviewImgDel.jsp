<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.moim.review.*"%>
<jsp:useBean id="rdao" class="com.moim.review.ReviewDAO"></jsp:useBean>
<%

out.println("사용안함 똑같아");

String idx_s = request.getParameter("idx");
if (idx_s == null || idx_s.equals("")) {
	idx_s = "0";
}
int idx = Integer.parseInt(idx_s);



int result = rdao.imgDel(idx);
String msg = result > 0 ? "이미지 삭제 성공" : "이미지 삭제 실패";
%>
<script>
window.alert('<%=msg%>');
	location.href = "updateReview.jsp"
</script>




