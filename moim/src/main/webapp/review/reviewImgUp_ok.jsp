<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="com.oreilly.servlet.*"%>
<jsp:useBean id="rdao" class="com.moim.review.ReviewDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");

Integer idx_member = (Integer)session.getAttribute("idx");

String savepath = request.getRealPath("/review/img");
MultipartRequest mr = new MultipartRequest(request, savepath, 2097152, "utf-8");

String moimname = mr.getParameter("moimname");
String local = mr.getParameter("local");
String writer = mr.getParameter("writer");
String content = mr.getParameter("content");
String subject = mr.getParameter("subject");

boolean boo = true;
String msg = "작성 성공?";



if (moimname == null || moimname.equals("null") || local == null || local.equals("null") || writer == null
		|| writer.equals("") || content == null || content.equals("") || subject == null || subject.equals("")) {
	boo = false;
}
if (boo == true) {
	int result = rdao.addImage(mr,idx_member);
	msg = result > 0 ? "글 작성 성공" : "글 작성 실패";
} else {
	msg = "다시 작성하세요";

}
if (msg == "글 작성 성공") {
%>
<script>
     window.alert('<%=msg%>');
	location.href = "reviewList.jsp";
</script>

<%
}
%>
<script>
     window.alert('<%=msg%>');
	location.href = "writeReview.jsp";
</script>












