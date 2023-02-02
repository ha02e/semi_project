<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class="com.moim.review.ReviewDAO"></jsp:useBean>
<%@page import="com.moim.review.*"%>




<%
/* int idx= (int)session.getAttribute("idx");
int result = imgdao.imgDel(idx); */

/* String idx_s=request.getParameter("idx"); 아래로 축약 */

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




