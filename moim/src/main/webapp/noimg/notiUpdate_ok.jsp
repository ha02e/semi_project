<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="ndao" class="com.moim.noimg.NoimgDAO"></jsp:useBean>
<jsp:useBean id="ndto" class="com.moim.noimg.NoimgDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ndto"/>


<%
int result=ndao.updateNoimg(ndto);
String msg=result>0?"수정이 완료되었습니다":"수정에 실패했습니다\n다시 시도해주세요";
%>

<script>
window.alert('<%=msg%>');
location.href='../noimg/notiList.jsp?idx_info=<%=session.getAttribute("idx_info")%>&category=<%=session.getAttribute("category")%>';
</script>