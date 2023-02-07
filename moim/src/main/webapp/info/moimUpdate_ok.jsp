<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="java.io.File" %>
<jsp:useBean id="mdto" class="com.moim.info.InfoDTO"></jsp:useBean>
<jsp:useBean id="mdao" class="com.moim.info.InfoDAO"></jsp:useBean>

<%
//저장 경로
String savepath=request.getRealPath("/userimg");
System.out.println("저장되는 경로:" + savepath);


MultipartRequest mr=
new MultipartRequest(request,savepath,2097152,"UTF-8");

int idx = Integer.parseInt((mr.getParameter("idx")));

//기존에 저장된 사진 이름
String bimg = mdao.getAdrImg(idx);
String imgname=bimg;
System.out.println("기존 사진명 : " + imgname);

String beforeImg=imgname;

//기존 사진명-> 실제로 삭제될 사진
String delImgName=request.getRealPath("/userimg")+beforeImg;
File delImg=new File(delImgName);

//기존 사진 경로에서 삭제
if(delImg.exists() && delImg.isFile()){
	delImg.delete();
	System.out.println("삭제된 기존 사진 : "+beforeImg);
}


//idx = Integer.parseInt((mr.getParameter("idx")));
mdto.setIdx(idx);

System.out.println("idx : " + idx);

mdto.setHobby(mr.getParameter("hobby"));
mdto.setMoimname(mr.getParameter("moimname"));
mdto.setContent(mr.getParameter("content"));
mdto.setLocal(mr.getParameter("local"));

int maxmem=Integer.parseInt((mr.getParameter("maxmem")));
mdto.setMaxmem(maxmem);

mdto.setImg(mr.getParameter("img"));

int result = mdao.updateInfo(mr, mdto, idx);
String msg = result > 0 ? "수정 성공" : "수정 실패";


%>
<script>
window.alert('<%=msg%>');
location.href='/moim/info/infoList.jsp';
</script>
