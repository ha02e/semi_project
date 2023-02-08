<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mdto" class="com.moim.noimg.NoimgDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.moim.noimg.NoimgDAO"></jsp:useBean>

<%
Integer idx = (Integer) session.getAttribute("idx");
int idx_member=idx;

String idx_info_s=request.getParameter("idx_info");
int idx_info=Integer.parseInt(idx_info_s);


String writer=(String)session.getAttribute("name");
String subject=request.getParameter("subject");
String content=request.getParameter("content");

int result=mdao.setNoimg(idx_member, idx_info, writer, subject, content);
String msg=result>0?"QnA 글이 등록되었습니다.":"글 등록에 실패하였습니다.";

%>
<script>
window.alert('<%=msg%>');
opener.location.reload();
window.self.close();
</script>