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
<title>Insert title here</title>
</head>
<style>
table {
   text-align: center;
   margin: 0px auto;
   border-pacing: 70px;
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
 		<label>참여자</label>
 		<table>
 			<thead>
 				<tr>
 					<th>참여자</th>
 					<th>가입일자</th>
 					<th></th>
 				</tr>
 			</thead>
 			<tbody>
 			<%for(int i=0;i<inarr.size();i++){ %>
 				<tr>
 					<td><%=hm.get(inarr.get(i).getIdx_member()) %></td>
 					<td><%=inarr.get(i).getJoindate() %></td>
 					<td><input type="button" value="내보내기" onclick="javascript:location.href='delMem_ok.jsp?idx=<%=inarr.get(i).getIdx()%>&idx_info=<%=idx_info%>'"></td>
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
 	<label>대기자</label>
 	<table>
 			<thead>
 				<tr>
 					<th>참여자</th>
 					<th>가입일자</th>
 					<th></th>
 				</tr>
 			</thead>
 			<tbody>
 			<%for(int i=0;i<newarr.size();i++){ %>
 				<tr>
 					<td><%=hm.get(newarr.get(i).getIdx_member()) %></td>
 					<td><%=newarr.get(i).getJoindate() %></td>
 					<td><input type="button" value="내용보기"></td>
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



















