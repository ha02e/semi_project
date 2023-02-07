<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sdao" class="com.moim.stat.StatDAO"></jsp:useBean>
<%
int idx=0;
if(request.getParameter("idx")!=null&&!request.getParameter("idx").equals(""))idx=Integer.parseInt(request.getParameter("idx"));
int idx_info=0;
if(request.getParameter("idx_info")!=null&&!request.getParameter("idx_info").equals(""))idx_info=Integer.parseInt(request.getParameter("idx_info"));
int result=sdao.delMem(idx, idx_info);
String msg=result>0?"삭제 완료":"삭제 실패";
%>
<script type="text/javascript">
window.alert('<%=msg%>');
location.href='statList.jsp?idx_info=<%=idx_info%>';
</script>