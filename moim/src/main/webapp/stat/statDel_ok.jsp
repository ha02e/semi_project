<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sdao" class="com.moim.stat.StatDAO"></jsp:useBean>
<%
int idx=1;
if(request.getParameter("idx")!=null&&!request.getParameter("idx").equals("")){
	idx=Integer.parseInt(request.getParameter("idx"));
}
int result=sdao.outMem(idx);
String msg=result>0?"멤버 거절 성공":"멤버 거절 실패";
%>
<script>
window.alert('<%=msg%>');
opener.location.reload();
window.self.close();
</script>