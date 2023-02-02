<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<jsp:useBean id="rdao" class="com.moim.review.ReviewDAO" scope ="session"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
/* 로그인 관련 */
/* String sid= (String)session.getAttribute("sid"); */

// request.getRealPath = 경로
String savepath=request.getRealPath("/review/img");
MultipartRequest mr = new MultipartRequest(request, savepath , 2097152,"utf-8");
/* MultipartRequest mr = new MultipartRequest(request, "c:/student_java" , 2097152,"utf-8"); */
//C:\student_java\jspstudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\myweb\gallery\img
/* 로그인 관련  */
int result = rdao.addImage(mr/* , sid */);
String msg =result>0? "이미지 업로드 성공"	: "이미지 업로드 실패";
%>

<script>
window.alert('<%=msg%>');
location.href="/moim/review/reviewList.jsp";
</script>