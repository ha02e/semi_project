<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mdto" class="com.moim.info.InfoDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.moim.info.InfoDAO"></jsp:useBean>

<%
int result=mdao.setInfo(mdto);
String msg=result>0?"모임이 등록되었습니다.":"모임 등록에 실패하였습니다.";

%>
<script>
window.alert('<%=msg%>');
location.href='/moim/info/moimContent.jsp'; //(임시)모임리스트 게시판으로 이동
</script>