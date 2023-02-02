<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moim.noimg.*" %>
<jsp:useBean id="mdto" class="com.moim.noimg.NoimgDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.moim.noimg.NoimgDAO"></jsp:useBean>


<%
int idx=mdto.getIdx();

int result=mdao.delQna(idx);
String msg=result>0?"삭제가 완료되었습니다.":"삭제 실패하였습니다..";
%>

<script>
window.alert('<%=msg %>');
location.href='/moim/info/moimContent.jsp';
opener.location.reload();
</script>