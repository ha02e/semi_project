<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.moim.stat.*" %>
<jsp:useBean id="mdao" class="com.moim.member.MemberDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참여중인 모임</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<style>
section{
	width:1280px;
	margin:0px auto;
	padding:50px 0;
	min-height: 560px;
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

/* 게시판 리스트 */
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
table a{
	text-decoration: none;
	color:#333333;
}
table a:hover{
	font-weight: bold;
}
table a:visited, .my-review a:link{
	color:#333333;
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
table #hobby {
	width: 10%;
	text-align: center;
}
table #moimname {
	width: 55%;
}
table #mem {
	width: 10%;
}
table #sbutton{
	width: 25%;
}

table #hobby2 {
	width: 10%;
	text-align: center;
}
table #moimname2 {
	width: 50%;
}
table #mem2 {
	width: 10%;
}
table #sbutton2{
	width: 30%;
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
.paging2{
	padding-left:140px;
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
if(alltotalCnt%listSize==0)alltotalPage--;

int mantotalPage=mantotalCnt/listSize+1;
if(mantotalCnt%listSize==0)mantotalPage--;

int alluserGroup=cp/pageSize;
if(cp%pageSize==0)alluserGroup--;

int manuserGroup=cp2/pageSize;
if(cp2%pageSize==0)manuserGroup--;
%>
<body>
<%@include file="/header.jsp" %>
<section>
<%@include file="sideBoard.jsp" %>
	<article>
		<h3 class="my-title">참여중인 모임</h3>
		<table class="moim1">
			<thead>
				<tr>
				<th id="hobby">카테고리</th>
				<th id="moimname">모임 이름</th>
				<th id="mem">모임인원</th>
				<th id="sbutton">모임게시판&nbsp;&nbsp;후기쓰기</th>
				</tr>
			</thead>
			<tbody>
			<%
			HashMap<Integer,String> namemap=mdao.moimName();
			HashMap<Integer,String> hobbymap=mdao.moimCategory();
			HashMap<Integer,String> memmap=mdao.getNowMem();
			ArrayList<StatDTO> alldto=mdao.getMyStat(idx,listSize,cp,1);
			ArrayList<StatDTO> mandto=mdao.getMyStat(idx,listSize,cp2,0);
			if(alldto==null||alldto.size()==0){
				%>
				<tr>
					<td colspan="4" text-align:center;>
					참여중인 모임이 없습니다.
					</td>
				</tr>
				<%
			}else{
				for(int i=0;i<alldto.size();i++){
					%>
					<tr>
						<td id="hobby"><%=hobbymap.get(alldto.get(i).getIdx_info())%></td>
						<td id="moimname"><a href="/moim/info/moimContent.jsp?idx=<%=alldto.get(i).getIdx_info()%>"><%=namemap.get(alldto.get(i).getIdx_info())%></a></td>
						<td id="mem"><%=memmap.get(alldto.get(i).getIdx_info())%></td>
						<td id="sbutton">
							<input type="button" value="모임게시판" onclick="javascript:location.href='moimChat.jsp?idx=<%=alldto.get(i).getIdx_info()%>'">
							<input type="button" value="후기쓰기" onclick="javascript:location.href='/moim/review/writeReview.jsp?idx_info=<%=alldto.get(i).getIdx_info()%>'">
						</td>
					</tr>
					<%
				}
			}
			%>
			</tbody>
		</table>
		<div class="bottom">
			<div class="paging">
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
			</div>
		</div>
					
		<h3 class="my-title">내가 만든 모임</h3>
		<table class="moim2">
			<thead>
				<tr>
				<th id="hobby2">카테고리</th>
				<th id="moimname2">모임 이름</th>
				<th id="mem2">모임 인원</th>
				<th id="sbutton2">관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭제</th>
				</tr>
			</thead>
			<tbody>
			<%
			if(mandto==null||mandto.size()==0){
				%>
				<tr>
					<td colspan="4" align="center">
					내가 만든 모임이 없습니다.
					</td>
				</tr>
				<%
			}else{
				for(int i=0;i<mandto.size();i++){
					%>
					<tr>
					<td id="hobby2"><%=hobbymap.get(mandto.get(i).getIdx_info()) %></td>
					<td id="moimname2"><a href="/moim/info/moimContent.jsp?idx=<%=mandto.get(i).getIdx_info()%>"><%=namemap.get(mandto.get(i).getIdx_info()) %></a></td>
					<td id="mem2"><%=memmap.get(mandto.get(i).getIdx_info())%></td>
					<td id="sbutton2">
					<input type="button" value="모임관리" onclick="javascript:location.href='/moim/stat/statList.jsp?idx=<%=mandto.get(i).getIdx_info()%>'">
					<input type="button" value="모임수정" onclick="javascript:location.href='/moim/info/moimUpdate.jsp?idx=<%=mandto.get(i).getIdx_info()%>'">
					<input type="button" value="모임삭제" onclick="javascript:location.href='/moim/info/moimDel_ok.jsp?idx=<%=mandto.get(i).getIdx_info()%>'">					
					</td>
					</tr>
					<%
				}
			}
			%>
			</tbody>
		</table>
		<div class="bottom">
			<div class="paging paging2">
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
			</div>
		</div>
	</article>
</section>

<%@include file="/footer.jsp" %>
</body>
</html>
