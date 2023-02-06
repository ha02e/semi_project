<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdto" class="com.moim.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.moim.member.MemberDAO"></jsp:useBean>
<%
String idx_s=request.getParameter("idx");
if(idx_s==null||idx_s.equals("")){
	idx_s="0";
}
int idx=Integer.parseInt(idx_s);

int result=mdao.delReview(idx);
String msg=result>0?"삭제 완료!":"삭제 실패..";
%>
<script>
window.alert('<%=msg%>');
location.href='myWriting.jsp';
</script>