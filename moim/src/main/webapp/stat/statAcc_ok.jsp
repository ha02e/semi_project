<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sdao" class="com.moim.stat.StatDAO"></jsp:useBean>
<%
int idx=1;
if(request.getParameter("idx")!=null&&!request.getParameter("idx").equals("")){
	idx=Integer.parseInt(request.getParameter("idx"));
}
int idx_info=1;
if(request.getParameter("idx_info")!=null&&!request.getParameter("idx_info").equals("")){
	idx_info=Integer.parseInt(request.getParameter("idx_info"));
}
boolean boo=sdao.checkMem(idx_info);
String msg="";
if(boo){
	int result=sdao.inMem(idx, idx_info);
	msg=result>0?"수락 완료":"수락 실패";
}else{
	msg="이미 모임 인원이 꽉찼습니다.";
}
%>
<script>
window.alert('<%=msg%>');
opener.location.reload();
window.self.close();
</script>