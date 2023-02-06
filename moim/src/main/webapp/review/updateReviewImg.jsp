<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import = "java.io.*" %>
<jsp:useBean id="rdto" class="com.moim.review.ReviewDTO" scope="page"></jsp:useBean>
<jsp:useBean id="rdao" class="com.moim.review.ReviewDAO" scope="session"></jsp:useBean>


<%

DefaultFileRenamePolicy policy=  new DefaultFileRenamePolicy();

String savepath = request.getRealPath("/review/img");

MultipartRequest mr = new MultipartRequest(request, savepath, 2097152, "utf-8", policy);

System.out.println("저장되는 경로:" + savepath);

int idx = Integer.parseInt((mr.getParameter("idx")));

String beforeimg = rdao.getAdrImg(idx);

String fileName = beforeimg;
System.out.println("저장된 이름 : " + fileName);




String befimg = fileName;

String delimgname = request.getRealPath("/review/img/") + befimg;
File delimg = new File(delimgname);

if(delimg.exists() && delimg.isFile()){
	delimg.delete();
	System.out.println("삭제된 이전 사진 : "+ befimg);
}


rdto.setContent(mr.getParameter("content"));
idx = Integer.parseInt((mr.getParameter("idx")));
rdto.setIdx(idx);
int result2 = rdao.updateReview(rdto, mr);
String msg2 = result2 > 0 ? "이미지 수정 성공" : "이미지 수정 실패";
System.out.println(msg2);
%>

<script>
window.alert('<%=msg2%>');
	location.href = "/moim/review/reviewList.jsp";
</script>




