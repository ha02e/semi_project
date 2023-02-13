<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moim.stat.*" %>
<%@ page import="java.util.*" %>
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
    
<jsp:useBean id="mdto" class="com.moim.stat.StatDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>>
<jsp:useBean id="mdao" class="com.moim.stat.StatDAO"></jsp:useBean>
<jsp:useBean id="idao" class="com.moim.info.InfoDAO"></jsp:useBean>
    
    
<%
int idx_member=idx;

String idx_i=request.getParameter("idx_info");
int idx_info=Integer.parseInt(idx_i);


StatDTO dto_s=mdao.getUserStat(idx_member, idx_info);
int idx_d=dto_s.getIdx();

int result=mdao.delMem(idx_d, idx_info);
ArrayList<Integer> arr=new ArrayList<Integer>();
arr.add(idx_info);
if(result>0){
	mdao.makeMan(arr);
	result=mdao.minusMem(arr);
}
String msg=result>0?"모임에서 탈퇴되었습니다.":"모임 탈퇴에 실패하였습니다.";
%>
<script>
window.alert('<%=msg%>');
opener.location.href='/moim/info/infoList.jsp';
window.self.close();
</script>