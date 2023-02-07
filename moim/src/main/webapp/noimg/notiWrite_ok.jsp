<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.*" %>

<%request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="ndao" class="com.moim.noimg.NoimgDAO" scope="session"></jsp:useBean>

<%
//idx_member 값 받기
String sidx_member="0";
if(request.getParameter("idx_member")!=null&&request.getParameter("idx_member")!=""){
	sidx_member=request.getParameter("idx_member");
}

int idx_member=Integer.parseInt(sidx_member);

String subject=request.getParameter("subject");
String content=request.getParameter("content");
int result=ndao.setNoti(idx_member, subject, content);
String msg=result>0?"등록 완료되었습니다":"등록이 실패했습니다\n다시 시도해주세요";
%>
<script>
window.alert('<%=msg%>');
location.href='../noimg/notiList.jsp?idx_info=<%=session.getAttribute("idx_info")%>&category=<%=session.getAttribute("category")%>';
</script>
