<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moim.member.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page import="com.moim.stat.*" %>
<%@ page import="com.moim.noimg.*" %>
<%@ page import="com.moim.info.*" %>
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
int totalCnt3=mdao.getTotal("moim_stat", 22, 3);
int totalCnt4=mdao.getTotal("moim_stat", 22, 4);

int listSize=5;
int pageSize=5;

String idx_member_s=request.getParameter("idx_member");
if(idx_member_s==null||idx_member_s.equals("")){
	idx_member_s="1";
}
int idx_member=Integer.parseInt(idx_member_s);

int totalPage3=totalCnt3/listSize+1;
if(totalCnt3%listSize==0)totalPage3--;

int totalPage4=totalCnt4/listSize+1;
if(totalCnt4%listSize==0)totalPage4--;

int userGroup=idx_member/pageSize;
if(idx_member%pageSize==0)userGroup--;
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
				<th>모임게시판,후기쓰기</th>
				</tr>
			</thead>
			<tbody>
			<%
			ArrayList<StatDTO> dto3=mdao.getMyStat(21);
			ArrayList<InfoDTO> dto4=mdao.getNowMem(21);
			HashMap<Integer,String> map2=mdao.moimCategory();
			HashMap<Integer,String> map1=mdao.moimName();
			ArrayList<NoimgDTO> dto2=mdao.getMyQna(2, 1);
			ArrayList<StatDTO> dto1=mdao.getMyStat(21);
			if(dto1==null||dto1.size()==0){
				%>
				<tr>
				<td>
				참여중인 모임이 없습니다.
				</td>
				</tr>
				<%
			}else{
				for(int i=0;i<dto1.size();i++){
					%>
					<tr>
					<td><%=map2.get(dto1.get(i).getIdx_info())%></td>
					<td><%=map1.get(dto2.get(i).getIdx_info())%></td>
					<td><%=dto4.get(i).getNowmem()%>/<%=dto4.get(i).getMaxmem() %></td>
					<td>
					<input type="submit" value="모임게시판" onclick="javascript:location.href='보낼이름.jsp?idx=<%=dto1.get(i).getIdx()%>'">
					<!-- idx,지역,모임이름 -->
					<input type="submit" value="후기쓰기" onclick="javascript:location.href='보낼이름.jsp?idx=<%=dto1.get(i).getIdx()%>'">
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
					if(userGroup!=0){
						%><a href="myWriting.jsp?=idx_member=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a><%
					}
					%>
					<%
					for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
						%>&nbsp;&nbsp;<a href="myWriting.jsp?idx_member=<%=i%>"><%=i %></a>&nbsp;&nbsp;<%
						if(i==totalPage3)break;
					}
					%>
					<%
					if(userGroup!=(totalPage3/pageSize-(totalPage3%pageSize==0?1:0))){
						%><a href="myWriting.jsp?idx_member=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a><%
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
				<th>모임게시판,관리,삭제</th>
				</tr>
			</thead>
			<tbody>
			<%
			if(dto3==null||dto3.size()==0){
				%>
				<tr>
					<td colspan="5" align="center">
					내가 만든 모임이 없습니다.
					</td>
				</tr>
				<%
			}else{
				for(int i=0;i<dto3.size();i++){
					%>
					<tr>
					<td><%=map2.get(dto1.get(i).getIdx_info()) %></td>
					<td><%=map1.get(dto2.get(i).getIdx_info()) %></td>
					<td><%=dto4.get(i).getNowmem()%>/<%=dto4.get(i).getMaxmem() %></td>
					<td>
					<input type="submit" value="모임게시판" onclick="javascript:location.href='moimChat.jsp?idx=<%=dto1.get(i).getIdx()%>'">
					<!-- info_idx -->
					<input type="submit" value="모임관리" onclick="javascript:location.href='보낼이름.jsp?idx=<%=dto1.get(i).getIdx()%>'">
					<input type="submit" value="모임삭제" onclick="javascript:location.href='보낼이름.jsp?idx=<%=dto1.get(i).getIdx()%>'">					
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
					if(userGroup!=0){
						%><a href="myWriting.jsp?=idx_member=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a><%
					}
					%>
					<%
					for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
						%>&nbsp;&nbsp;<a href="myWriting.jsp?idx_member=<%=i%>"><%=i %></a>&nbsp;&nbsp;<%
						if(i==totalPage4)break;
					}
					%>
					<%
					if(userGroup!=(totalPage4/pageSize-(totalPage4%pageSize==0?1:0))){
						%><a href="myWriting.jsp?idx_member=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a><%
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