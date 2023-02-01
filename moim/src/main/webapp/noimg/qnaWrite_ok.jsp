<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mdto" class="com.moim.noimg.NoimgDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.moim.noimg.NoimgDAO" scope="session"></jsp:useBean>

<%
int idx_member=0;
int idx_info=0;
String subject=request.getParameter("subject");
String content=request.getParameter("content");

int result=mdao.setNoimg(idx_member, idx_info, subject, content);
String msg=result>0?"QnA 글이 등록되었습니다.":"글 등록에 실패하였습니다.";

%>
<script>
window.alert('<%=msg%>');
opener.location.reload();
window.self.close();
</script>