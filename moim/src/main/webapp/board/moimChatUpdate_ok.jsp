<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ndto" class="com.moim.noimg.NoimgDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ndto"/>
<jsp:useBean id="mdao" class="com.moim.member.MemberDAO"></jsp:useBean>
<%
int result=mdao.updateNoimg(ndto);
String msg=result>0?"글 수정 완료!":"수정 실패..";
%>
<script>
window.alert('<%=msg%>');
location.href='moimChat.jsp';
</script>
