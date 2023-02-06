<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdto" class="com.moim.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.moim.member.MemberDAO"></jsp:useBean>
<%
int result=mdao.updateMem(mdto);
String msg=result>0?"내 정보 변경 완료!":"내 정보 변경 실패..";
%>
<script>
window.alert('<%=msg%>');
location.href='myInfo.jsp';
</script>