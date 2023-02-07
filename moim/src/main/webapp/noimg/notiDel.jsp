<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ndao" class="com.moim.noimg.NoimgDAO"></jsp:useBean>

<%
String sidx=request.getParameter("idx");
if(sidx==null||sidx==""){
	sidx="0";
}
int idx=Integer.parseInt(sidx);

int result=ndao.delNoimg(idx);
String msg=result>0?"게시글이 삭제 되었습니다":"다시 시도해주세요";
%>
<script>
window.alert('<%=msg%>');
location.href='../noimg/notiList.jsp?idx_info=<%=session.getAttribute("idx_info")%>&category=<%=session.getAttribute("category")%>';
</script>