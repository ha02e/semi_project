<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.moim.stat.*"%>
<jsp:useBean id="sdao" class="com.moim.stat.StatDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 관리</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">

<style>
section{
	width:1280px;
	margin:0px auto;
	padding:50px 0;
	min-height: 550px;
}

h3.my-title{
	font-size:32px;
	margin:0 auto;
	padding-bottom:10px;
	width: 54%;
	font-family: 'Black Han Sans', sans-serif;
	font-weight: normal;
	color: #333333;
}

table {
	width: 74%;
	margin:0 auto 0px auto;
	text-align: center;
	border-collapse: collapse;
}

table th {
	height: 46px;
	border-top: 2px solid #4C7C77; 
	border-bottom: 1px solid #4C7C77;
	text-align: center;
	vertical-align: inherit;
}

table td {
	border-bottom: 1px solid #e5e5e5;
	height: 46px;	
}

table #name{
	width:40%;
}

table #joindate{
	width:30%;
}

table #sbutton{
	width:30%;
}

table input[type="button"]{
	outline: none;
	background:#999999;
	color:white;
	border:0;
	border-radius: 4px;
	padding:4px 10px;
	cursor:pointer;
}
table input[type="button"]:hover{
	transition: 0.3s;
	background: #00cdac;
}

/* 페이징 */
.paging{
	width: 85%;
	margin: 20px auto;
	text-align: center;
}
.paging a{
	display: inline-block;
	width: 34px;
	height: 34px;
	line-height: 34px;
	transition:0.2s;
}
.paging a:link,a:visited{
	text-decoration: none;
	color:#333333;
}
.paging a:hover{	
	font-weight: 800;
	color:#ffffff;
	background:#00cdac;
	border-radius: 100%;
}
</style>
</head>
<%
HashMap<Integer, String> hm = sdao.getName();
%>


<%
int idx_info=19;
if(request.getParameter("idx_info")!=null&&!request.getParameter("idx_info").equals("")){
	idx_info=Integer.parseInt(request.getParameter("idx_info"));
}
int cp=1;
if(request.getParameter("cp")!=null&&!request.getParameter("cp").equals("")){
	cp=Integer.parseInt(request.getParameter("cp"));
}
if(cp==0)cp=1;
int cp2=1;
if(request.getParameter("cp2")!=null&&!request.getParameter("cp2").equals("")){
	cp2=Integer.parseInt(request.getParameter("cp2"));
}
if(cp2==0)cp2=1;
int listSize = 5;
int pageSize = 5;
int totalCnt = sdao.getTotalCnt(idx_info, 1);
ArrayList<StatDTO> inarr=sdao.getNewPerStatList(idx_info, 1, listSize, cp);

int totalPage = totalCnt / listSize + 1;
if (totalCnt % listSize == 0)totalPage--;
int userGroup = cp / pageSize;
if (cp % pageSize == 0)userGroup--;

int totalCnt2 = sdao.getTotalCnt(idx_info, 2);
ArrayList<StatDTO> newarr=sdao.getNewPerStatList(idx_info, 2, listSize, cp);

int totalPage2 = totalCnt2 / listSize + 1;
if (totalCnt2 % listSize == 0)totalPage2--;
int userGroup2 = cp2 / pageSize;
if (cp2 % pageSize == 0)userGroup2--;
%>
<body>
   <%@include file="/header.jsp"%>
 <section>
	<%@include file = "/board/sideBoard.jsp" %>
 	<article>
 		<div class="mem1">
 		<h3 class="my-title">참여자</h3>
 		<table>
 			<thead>
 				<tr>
 					<th id="name">이름</th>
 					<th id="joindate">가입일자</th>
 					<th id="sbutton">&nbsp;</th>
 				</tr>
 			</thead>
 			<tbody>
 			<%for(int i=0;i<inarr.size();i++){ %>
 				<tr>
 					<td id="name"><%=hm.get(inarr.get(i).getIdx_member()) %></td>
 					<td id="joindate"><%=inarr.get(i).getJoindate() %></td>
 					<td id="sbutton">
 					<input type="button" class="button" value="내보내기" onclick="javascript:location.href='delMem_ok.jsp?idx=<%=inarr.get(i).getIdx()%>&idx_info=<%=idx_info%>'">
 					<input type="button" class="button" value="관리자 임명하기" onclick="javascript:location.href='giveMan_ok.jsp?idx=<%=inarr.get(i).getIdx()%>'">
 					</td>
 				</tr>
 			<%} %>
 			</tbody>
 		</table>
 		<div class="paging">
 					<%
							if(userGroup!=0){
								%><a href="statList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>&cp2=<%=cp2%>&idx_info=<%=idx_info%>">&lt;&lt;</a><%
							}
							%>
							<%
							for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
								%>&nbsp;&nbsp;<a href="statList.jsp?cp=<%=i%>&cp2=<%=cp2%>&idx_info=<%=idx_info%>"><%=i%></a>&nbsp;&nbsp;<%
								if(i==totalPage)break;
							}
							%>
							<%
							if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
								%><a href="statList.jsp?cp=<%=(userGroup+1)*pageSize+1%>&cp2=<%=cp2%>&idx_info=<%=idx_info%>">&gt;&gt;</a><%
							}
						%>
 		</div>
 		</div>
 	</article>
 	<article>
 	<div class="mem2">
		<h3 class="my-title">대기자</h3>
	 	<table>
	 			<thead>
	 				<tr>
	 					<th id="name">이름</th>
	 					<th id="subject">가입일자</th>
	 					<th id="sbutton"></th>
	 				</tr>
	 			</thead>
	 			<tbody>
	 			<%for(int i=0;i<newarr.size();i++){ %>
	 				<tr>
	 					<td id="name"><%=hm.get(newarr.get(i).getIdx_member()) %></td>
	 					<td id="subject"><%=newarr.get(i).getJoindate() %></td>
	 					<td id="sbutton"><input type="button" class="button" value="내용보기" onclick="javascript:window.open('statContent.jsp?idx=<%=newarr.get(i).getIdx()%>','statcontet','width=550,height=250')"></td>
	 				</tr>
	 				
	 			<%} %>
	 			</tbody>
	 		</table>
 		<div class="paging">
 					<%
							if(userGroup2!=0){
								%><a href="statList.jsp?cp2=<%=(userGroup2-1)*pageSize+pageSize%>&cp=<%=cp%>&idx_info=<%=idx_info%>">&lt;&lt;</a><%
							}
							%>
							<%
							for(int i=userGroup2*pageSize+1;i<=userGroup2*pageSize+pageSize;i++){
								%>&nbsp;&nbsp;<a href="statList.jsp?cp2=<%=i%>&cp=<%=cp%>&idx_info=<%=idx_info%>"><%=i%></a>&nbsp;&nbsp;<%
								if(i==totalPage2)break;
							}
							%>
							<%
							if(userGroup2!=(totalPage2/pageSize-(totalPage2%pageSize==0?1:0))){
								%><a href="statList.jsp?cp2=<%=(userGroup2+1)*pageSize+1%>&cp=<%=cp%>&idx_info=<%=idx_info%>">&gt;&gt;</a><%
							}
						%>

 		</div>
	</div>
 	</article>
 </section>
   <%@include file="/footer.jsp"%>
</body>
</html>



















