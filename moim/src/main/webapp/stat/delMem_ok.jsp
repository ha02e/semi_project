<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="sdao" class="com.moim.stat.StatDAO"></jsp:useBean>
<%
int idx=0;
if(request.getParameter("idx")!=null&&!request.getParameter("idx").equals(""))idx=Integer.parseInt(request.getParameter("idx"));
int idx_info=0;
if(request.getParameter("idx_info")!=null&&!request.getParameter("idx_info").equals(""))idx_info=Integer.parseInt(request.getParameter("idx_info"));
int result=sdao.delMem(idx, idx_info);
ArrayList<Integer> arr=new ArrayList<Integer>();
arr.add(idx_info);
String msg="실패";
if(result>0){
	result=sdao.makeMan(arr);
	msg=result>0?"관리자 임명 성공":"관리자 임명 실패";
}
if(result>0){
	result=sdao.minusMem(arr);
	msg=result>0?"탈퇴 성공!":"탙퇴 실패...";
}

%>
<script type="text/javascript">
window.alert('<%=msg%>');
location.href='statList.jsp?idx_info=<%=idx_info%>';
</script>