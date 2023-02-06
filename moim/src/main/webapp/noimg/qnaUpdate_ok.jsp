<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mdto" class="com.moim.noimg.NoimgDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.moim.noimg.NoimgDAO"></jsp:useBean>

<%
int result=mdao.updateQna(mdto);
String msg=result>0?"QnA 글이 수정되었습니다.":"QnA 글 수정에 실패하였습니다.";
%>
<script>
window.alert('<%=msg%>');
opener.location.reload();
window.self.close();
</script>