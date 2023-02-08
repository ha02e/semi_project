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
</head>
<style>
table{
	width:80%;
	margin-left:auto;
	margin-right:auto;
	text-align:center;
	border-collapse:collapse;
}

table th{
	height:30px;
	border-top:1px solid #f0f0f0;
	border-bottom:1px solid #f0f0f0;
	background-color:#f8f8f8;
	text-align:center;
	vertical-align:inherit;
}

table td{
	border-bottom:1px solid #f0f0f0;
	padding: 10px;
}

table #idx{
	width:30%;
}

table #subject{
	width:30%;
}

table #writedate{
	width:15%;
}

.button{
	border:0;
	outline:none;
	width:100px;
	height:30px;
	cursor: pointer;
	background:#999999;
	color:white;
}

.button:hover{
	background: #00cdac;
	transition: 0.3s;
}
</style>
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
   <%@include file="/board/sideBoard.jsp"%>
 <section>
 	<article>
 		<h3>&nbsp;&nbsp;&nbsp;참여자</h3>
 		<table>
 			<thead>
 				<tr>
 					<th>이름</th>
 					<th>가입일자</th>
 					<th></th>
 				</tr>
 			</thead>
 			<tbody>
 			<%for(int i=0;i<inarr.size();i++){ %>
 				<tr>
 					<td id="idx"><%=hm.get(inarr.get(i).getIdx_member()) %></td>
 					<td id="subject"><%=inarr.get(i).getJoindate() %></td>
 					<td id="joindate"><input type="button" class="button" value="내보내기" onclick="javascript:location.href='delMem_ok.jsp?idx=<%=inarr.get(i).getIdx()%>&idx_info=<%=idx_info%>'"></td>
 				</tr>
 			<%} %>
 			</tbody>
 			<tfoot>
 				<tr>
 					<td colspan="3" align="center">
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
 					</td>
 				</tr>
 			</tfoot>
 		</table>
 	</article>
 	<article>
 	<h3>&nbsp;&nbsp;&nbsp;대기자</h3>
 	<table>
 			<thead>
 				<tr>
 					<th>이름</th>
 					<th>가입일자</th>
 					<th></th>
 				</tr>
 			</thead>
 			<tbody>
 			<%for(int i=0;i<newarr.size();i++){ %>
 				<tr>
 					<td id="idx"><%=hm.get(newarr.get(i).getIdx_member()) %></td>
 					<td id="subject"><%=newarr.get(i).getJoindate() %></td>
 					<td id="joindate"><input type="button" class="button" value="내용보기" onclick="javascript:window.open('statContent.jsp?idx=<%=newarr.get(i).getIdx()%>','statcontet','width=550,height=250')"></td>
 				</tr>
 				
 			<%} %>
 			</tbody>
 			<tfoot>
 				<tr>
 					<td colspan="3" align="center">
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
 					</td>
 				</tr>
 			</tfoot>
 		</table>
 	</article>
 </section>
   <%@include file="/footer.jsp"%>
</body>
</html>



















