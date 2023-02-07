<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Integer idx = (Integer) session.getAttribute("idx");
if (idx==null) {
%>
<script>
	window.alert('로그인 후 이용가능합니다');
	window.self.close();
</script>
<%
return;
}
%>     
    
<%@ page import="com.moim.noimg.*" %>
<jsp:useBean id="mdto" class="com.moim.noimg.NoimgDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.moim.noimg.NoimgDAO"></jsp:useBean>


<%
int idx_d=mdto.getIdx();

int result=mdao.delNoimg(idx_d);
String msg=result>0?"삭제가 완료되었습니다.":"삭제 실패하였습니다..";
%>

<script>
window.alert('<%=msg %>');
location.href='/moim/info/moimContent.jsp';
opener.location.reload();
</script>