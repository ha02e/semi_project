<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.moim.stat.*" %>
<jsp:useBean id="mdao" class="com.moim.member.MemberDAO"></jsp:useBean>

<%
Integer idx=(Integer)request.getAttribute("idx");
int result1=mdao.dropMem(idx);

ArrayList<StatDTO> statarr=mdao.getInMoim(idx);
if(statarr!=null){
	for(int i=0;i<statarr.size();i++){
		
	}
}
%>