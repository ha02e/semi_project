<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="ndto" class="com.moim.noimg.NoimgDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ndto"/>
<jsp:useBean id="mdao" class="com.moim.member.MemberDAO" scope="session"></jsp:useBean>
<jsp:useBean id="ndao" class="com.moim.noimg.NoimgDAO"></jsp:useBean>
<%
int result=mdao.writeReChat(ndto);
String msg=result>0?"답변 글쓰기 성공":"답변 글쓰기 실패!";
%>
<script>
window.alert('<%=msg%>');
location.href='moimChat.jsp?idx=<%=ndto.getIdx_info()%>';
</script>