<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sdao" class="com.moim.stat.StatDAO"></jsp:useBean>
<%
int idx=0;
if(request.getParameter("idx")!=null&&!request.getParameter("idx").equals("")){
	idx=Integer.parseInt(request.getParameter("idx"));
}
int idx_info=0;
if(request.getParameter("idx_info")!=null&&!request.getParameter("idx_info").equals("")){
	idx_info=Integer.parseInt(request.getParameter("idx_info"));
}
int result=sdao.giveMan(idx);
String msg=result>0?"권한 주기 완료!":"권한주기 실패...";
%>
<script>
window.alert('<%=msg%>');
location.href='statList.jsp?idx_info=<%=idx_info%>';
</script>