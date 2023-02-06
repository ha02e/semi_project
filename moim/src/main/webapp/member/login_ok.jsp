<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@page import ="java.util.*" %>
<%@page import="com.moim.member.*"%>
<jsp:useBean id="mdao" class="com.moim.member.MemberDAO" scope="session"></jsp:useBean>


<%
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
String saveid=request.getParameter("saveid");

MemberDTO dto=mdao.login(id, pwd);
//로그인 검증 및 session 값 저장
if(dto==null){
%>
<script>
window.alert('아이디 또는 비밀번호를 잘못 입력했습니다\n입력하신 내용을 다시 한번 확인해주세요');
location.href='login.jsp';
</script>
<%}else{
	session.setAttribute("idx", dto.getIdx());
	session.setAttribute("name", dto.getName());
	session.setAttribute("manager", dto.getManager());
	session.setAttribute("hobby", dto.getHobby());

	//아이디 저장하기
	if(saveid==null){
		Cookie cookie=new Cookie("saveid",id);
		cookie.setMaxAge(60);
		response.addCookie(cookie);
	}else{
		Cookie cookie=new Cookie("saveid",id);
		cookie.setMaxAge(60*60*24*30);
		response.addCookie(cookie);
	}
%>
<script>
window.alert('<%=dto.getName()%>님 환영합니다!');
opener.location.reload();
window.close();
</script>
<%}%>