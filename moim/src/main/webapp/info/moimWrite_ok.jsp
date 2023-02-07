<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>

<jsp:useBean id="mdto" class="com.moim.info.InfoDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.moim.info.InfoDAO"></jsp:useBean>

<%
String savepath=request.getRealPath("/userimg");

MultipartRequest mr=
	new MultipartRequest(request,savepath,2097152,"UTF-8");

int result=mdao.setInfo(mr,mdto);
String msg=result>0?"모임이 등록되었습니다.":"모임 등록에 실패하였습니다.";

%>
<script>
window.alert('<%=msg%>');
location.href='/moim/info/infoList.jsp'; 
</script>