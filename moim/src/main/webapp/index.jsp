<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.moim.noimg.*" %>
<jsp:useBean id="ndao" class="com.moim.noimg.NoimgDAO" scope="session"></jsp:useBean>
<%@ page import="com.moim.info.*" %>
<jsp:useBean id="idao" class="com.moim.info.InfoDAO"></jsp:useBean>

<%
//ndao.getList 매개변수 1)idx_info 
String sidx_info=request.getParameter("idx_info");
if(sidx_info==null||sidx_info==""){
	sidx_info="0";
}
int idx_info=Integer.parseInt(sidx_info);

//ndao.getList 매개변수 2)category 
String scategory=request.getParameter("category");
if(scategory==null||scategory==""){
	scategory="1";
}
int category=Integer.parseInt(scategory);

//1)2) 값 추후 활용을 위해 세션에 저장
session.setAttribute("idx_info", idx_info);
session.setAttribute("category", category);

//ndao.getList 매개변수 3)ls
int totalContent=ndao.getNotiTotalCnt(idx_info);
int listsize=5;
int pageSize=5;
	
//ndao.getList 매개변수 4)cp
String scp=request.getParameter("cp");
if(scp==null||scp.equals("")){
	scp="1";
}
int cp=Integer.parseInt(scp);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.mainImg Img{
	width: 1280px;
}
.content h2{
	text-align:center;
}

.content div{
	height: 250px;
}

.infotable h2{
	text-align: center;
}

.notice{
	height:300px;
	border: 1px solid gray;
} 

.notice h2{
	text-align:center;
}

.notice #notice_tb{
	justify-content:center;
	align-items:center;
	text-align:center;
	display:felx;
	width:70%;
	margin: auto;
	padding: 10px 29px 10px 29px;
}

.notice #notice_tb td, th{
	border-bottom:1px solid gray;

}

.notice table #idx{
	width: 5%;
}

.notice table #subject{
	width: 40%;
	text-align: left;
	padding-left: 40px;
	font-weight:bold;
	
}

.notice table #writedate{
	width: 10%;
}

.notice #moreInfo{
	text-align:right;
}

.current_moim{
	align-content: center;
	margin:0px auto;
	display:flex;
	justify-content:space-between;
	width:800px;
}

.content #content_tb{
	border:1px solid red;
}


</style>
</head>
<body>
<%@include file="header.jsp" %>
<section class="mainImg">
<a href="/moim/noimg/listNoti.jsp"><img src="/moim/img/banner_main.jpg" alt="매인 배너"></a>
</section>

<section class="content">
<h2>현재 모집 중인 소모임</h2>
<div class="current_moim">
<%
		ArrayList<InfoDTO> needarr=idao.getList("total");
		if(needarr==null||needarr.size()==0){
			%><h2>현재 모집중인 모임이 없습니다</h2>
		<%
		}else{
		for(int i=0;i<needarr.size();i++){ %>
			<div id="content_tb">
			<table >
				<tr>
					<td rowspan="3"><img alt="needimg<%=i%>" src="<%=needarr.get(i).getImg()%>"></td>
					<td><a href="infoContent.jsp?idx=<%=needarr.get(i).getIdx()%>"><%=needarr.get(i).getMoimname() %></a></td>

				</tr>
				<tr>
					<td><%=needarr.get(i).getLocal() %></td>
				</tr>
				<tr>
					<td><%=needarr.get(i).getHobby() %></td>
					</tr>
	
				
				</table>
</div>
	<%}} %>
</div>
</section>

<section class="notice">
<h2>공지사항</h2>
<div id="moreInfo"><a href="/moim/noimg/notiList.jsp?idx_info=<%=session.getAttribute("idx_info")%>">더보기 > </a></div>
<div id="notice_tb"> 
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody>
			<%ArrayList<NoimgDTO> arr=ndao.getList(idx_info,category,listsize, cp);
					for(int i=0;i<arr.size();i++){	
						if(arr==null||arr.size()==0){
				%>
				<tr id="td">
				<td colspan="3"></td>
				<%}else{ %>
					<td id="idx"><%=arr.get(i).getIdx()%></td>
					<td id="subject"><a href="/moim/noimg/notiContent.jsp?idx=<%=arr.get(i).getIdx()%>"><%=arr.get(i).getSubject() %></a></td>
					<td id="writedate"><%=arr.get(i).getWritedate() %></td>
				</tr>
				<%}
				}%>
	</tbody>
</table>
</div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>