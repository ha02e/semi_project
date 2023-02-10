<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.moim.stat.*" %>
<jsp:useBean id="mdao" class="com.moim.member.MemberDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	width:1000px;
	text-align: center;
}
th{
	background-color: gray;
}
</style>
</head>
<%
Integer idx=(Integer)session.getAttribute("idx");
if(idx==null){
	idx=0;
}
String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);
String cp2_s=request.getParameter("cp2");
if(cp2_s==null||cp2_s.equals("")){
	cp2_s="1";
}
int cp2=Integer.parseInt(cp2_s);

int alltotalCnt=mdao.getMemTotalCnt(1,idx);
int mantotalCnt=mdao.getMemTotalCnt(0,idx);

int listSize=5;
int pageSize=5;


int alltotalPage=alltotalCnt/listSize+1;
if(alltotalPage%listSize==0)alltotalPage--;

int mantotalPage=mantotalCnt/listSize+1;
if(mantotalCnt%listSize==0)mantotalPage--;

int alluserGroup=cp/pageSize;
if(cp%pageSize==0)alluserGroup--;

int manuserGroup=cp/pageSize;
if(cp2%pageSize==0)manuserGroup--;
%>
<body>
<%@include file="/header.jsp" %>

<%@include file="sideBoard.jsp" %>
<section>
	<article>
		<h3>참여중인 모임</h3>
		<table border="1">
			<thead>
				<tr>
				<th>카테고리</th>
				<th>모임 이름</th>
				<th>모임인원</th>
				<th>모임게시판 후기쓰기</th>
				</tr>
			</thead>
			<tbody>
			<%
			HashMap<Integer,String> namemap=mdao.moimName();
			HashMap<Integer,String> hobbymap=mdao.moimCategory();
			HashMap<Integer,String> memmap=mdao.getNowMem();
			ArrayList<StatDTO> alldto=mdao.getMyStat(idx,listSize,cp,1);
			ArrayList<StatDTO> mandto=mdao.getMyStat(idx,listSize,cp,0);
			if(alldto==null||alldto.size()==0){
				%>
				<tr>
				<td>
				참여중인 모임이 없습니다.
				</td>
				</tr>
				<%
			}else{
				for(int i=0;i<alldto.size();i++){
					%>
					<tr>
					<td><%=hobbymap.get(alldto.get(i).getIdx_info())%></td>
					<td><%=namemap.get(alldto.get(i).getIdx_info())%></td>
					<td><%=memmap.get(alldto.get(i).getIdx_info()) %></td>
					<td>
					<input type="button" value="모임게시판" onclick="javascript:location.href='moimChat.jsp?idx=<%=alldto.get(i).getIdx_info()%>'">
					<input type="button" value="후기쓰기" onclick="javascript:location.href='/moim/review/writeReview.jsp?idx_info=<%=alldto.get(i).getIdx_info()%>'">
					</td>
					</tr>
					<%
				}
			}
			%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align="center">
					<%
					if(alluserGroup!=0){
						%><a href="myMoim.jsp?cp=<%=(alluserGroup-1)*pageSize+pageSize%>&cp2=<%=cp2%>">&lt;&lt;</a><%
					}
					%>
					<%
					for(int i=alluserGroup*pageSize+1;i<=alluserGroup*pageSize+pageSize;i++){
						%>&nbsp;&nbsp;<a href="myMoim.jsp?cp=<%=i%>&cp2=<%=cp2%>"><%=i %></a>&nbsp;&nbsp;<%
						if(i==alltotalPage)break;
					}
					%>
					<%
					if(alluserGroup!=(alltotalPage/pageSize-(alltotalPage%pageSize==0?1:0))){
						%><a href="myMoim.jsp?cp=<%=(alluserGroup+1)*pageSize+1%>&cp2=<%=cp2%>">&gt;&gt;</a><%
					}
					%>
					</td>
				</tr>
			</tfoot>
		</table>
		
		<br>
		<h3>내가 만든 모임</h3>
		<table border="1">
			<thead>
				<tr>
				<th>카테고리</th>
				<th>모임 이름</th>
				<th>모임 인원</th>
				<th>관리 삭제</th>
				</tr>
			</thead>
			<tbody>
			<%
			if(mandto==null||mandto.size()==0){
				%>
				<tr>
					<td colspan="5" align="center">
					내가 만든 모임이 없습니다.
					</td>
				</tr>
				<%
			}else{
				for(int i=0;i<mandto.size();i++){
					%>
					<tr>
					<td><%=hobbymap.get(mandto.get(i).getIdx_info()) %></td>
					<td><%=namemap.get(mandto.get(i).getIdx_info()) %></td>
					<td><%=memmap.get(mandto.get(i).getIdx_info())%></td>
					<td>
					<input type="button" value="모임관리" onclick="javascript:location.href='/moim/stat/statList.jsp?idx=<%=mandto.get(i).getIdx_info()%>'">
					<input type="button" value="모임삭제" onclick="javascript:location.href='/moim/info/moimDel_ok.jsp?idx=<%=mandto.get(i).getIdx_info()%>'">					
					</td>
					</tr>
					<%
				}
			}
			%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align="center">
					<%
					if(manuserGroup!=0){
						%><a href="myMoim.jsp?cp2=<%=(manuserGroup-1)*pageSize+pageSize%>&cp=<%=cp%>">&lt;&lt;</a><%
					}
					%>
					<%
					for(int i=manuserGroup*pageSize+1;i<=manuserGroup*pageSize+pageSize;i++){
						%>&nbsp;&nbsp;<a href="myMoim.jsp?cp2=<%=i%>&cp=<%=cp%>"><%=i %></a>&nbsp;&nbsp;<%
						if(i==mantotalPage)break;
					}
					%>
					<%
					if(manuserGroup!=(mantotalPage/pageSize-(mantotalPage%pageSize==0?1:0))){
						%><a href="myMoim.jsp?cp2=<%=(manuserGroup+1)*pageSize+1%>&cp=<%=cp%>">&gt;&gt;</a><%
					}
					%>
					</td>
				</tr>
			</tfoot>
		</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>
