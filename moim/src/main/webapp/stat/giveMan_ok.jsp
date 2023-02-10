<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sdao" class="com.moim.stat.StatDAO"></jsp:useBean>
<%
int idx=0;
if(request.getParameter("idx")!=null&&!request.getParameter("idx").equals("")){
	idx=Integer.parseInt(request.getParameter("idx"));
}
int result=sdao.giveMan(idx);
String msg=result>0?"권한 주기 완료!":"권한주기 실패...";
%>
<script>
window.alert('<%=msg%>');
opener.location.reload();
window.close();
</script>