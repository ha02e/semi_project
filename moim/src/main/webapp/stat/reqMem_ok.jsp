<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moim.stat.*" %>

<jsp:useBean id="mdto" class="com.moim.stat.StatDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.moim.stat.StatDAO"></jsp:useBean>


<%
Integer idx = (Integer) session.getAttribute("idx");
int idx_member=idx;  //session에서 받아오기

String idx_info_s=request.getParameter("idx_info");
int idx_info=Integer.parseInt(idx_info_s);



String content=request.getParameter("contentApply");

int result=mdao.reqMem(idx_member, idx_info, content);
String msg=result>0?"가입 신청이 완료되었습니다.":"가입 신청을 실패하였습니다. 다시 시도해주세요.";
%>
<script>
	window.alert('<%=msg%>');
	opener.location.reload();
	window.self.close();
</script>



