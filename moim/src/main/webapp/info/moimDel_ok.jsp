<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="idao" class="com.moim.info.InfoDAO"></jsp:useBean>
<%

int idx_info=0;
if(request.getParameter("idx")!=null&&!request.getParameter("idx").equals("")){
	idx_info=Integer.parseInt(request.getParameter("idx"));
}

int result=idao.delInfo(idx_info);
String msg="실패!";
if(result>0){
	result=idao.delStat(idx_info);
	msg=result>0?"삭제 완료!":"삭제 실패";
}

%>
<script type="text/javascript">
window.alert('<%=msg%>');
location.href='/moim/board/myMoim.jsp';
</script>