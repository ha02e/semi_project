<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moim.stat.*" %>

<jsp:useBean id="mdto" class="com.moim.stat.StatDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.moim.stat.StatDAO"></jsp:useBean>

<%
//Integer idx_member=(Integer)session.getAttribute("idx_member");
int idx_member=0;  //session에서 받아오기

String content=request.getParameter("contentApply");

int result=mdao.reqMem(idx_member,content);
String msg=result>0?"가입 신청이 완료되었습니다.":"가입 신청을 실패하였습니다. 다시 시도해주세요.";
%>

<script>
window.alert('<%=msg%>');
opener.location.reload();
window.self.close();
</script>