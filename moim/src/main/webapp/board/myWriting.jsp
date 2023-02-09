<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moim.member.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page import="com.moim.noimg.*" %>
<%@ page import="com.moim.review.*" %>
<jsp:useBean id="mdao" class="com.moim.member.MemberDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	border-top:1px solid gray;
	border-bottom:1px solid gray;
	background-color:gray;
	text-align:center;
	vertical-align:inherit;
}

table td{
	border-bottom:1px solid gray;
	padding: 10px;
}

table #hobby{
	width:20%;
}
table #moimname{
	width:20%;
}

table #subject{
	width:40%;
	text-align:center;
}

table #writedate{
	width:20%;
}
table #update{
	width:20%;
}
</style>
</head>
<%
Integer idx=(Integer)session.getAttribute("idx");
if(idx==null){
	idx=0;
}

int totalCnt=mdao.getTotal("moim_review", idx, 1);
int listSize=2;
int pageSize=5;

String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);

int totalPage=totalCnt/listSize+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;

int totalCnt2=mdao.getTotal("moim_noimg", idx, 2);

int totalPage2=totalCnt2/listSize+1;
if(totalCnt2%listSize==0)totalPage2--;


%>
<body>
<%@include file="/header.jsp" %>
<%@include file = "sideBoard.jsp" %>
<section>
	<article>
		<h3>내가 쓴 후기</h3>
		<table border="1">
			<thead>
				<tr>
				<th>카테고리</th>
				<th>제목</th>
				<th>등록일자</th>
				<th>수정,삭제</th>
				</tr>
			</thead>
			<tbody>
			<%
			ArrayList<ReviewDTO> dto1=mdao.getMyReview(idx,listSize,cp);
			if(dto1==null||dto1.size()==0){
				%>
				<tr id="id">
					<td colspan="5" align="center">
					등록된 후기가 없습니다.
					</td>
				</tr>
				<%
			}else{
				for(int i=0;i<dto1.size();i++){
					%>
					<tr>
						<td id="hobby"><%=dto1.get(i).getHobby() %></td>
						<td id="subject"><a href=""><%=dto1.get(i).getSubject() %></a></td>
						<td id="writedate"><%=dto1.get(i).getWritedate() %></td>
						<td id="update">
						<input type="button" value="수정" onclick="javascript:location.href='updateReview.jsp?idx=<%=dto1.get(i).getIdx()%>'">
						<input type="button" value="삭제" onclick="javascript:location.href='myWritingDelReview_ok.jsp?idx=<%=dto1.get(i).getIdx()%>'">
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
					%><a href="myWriting.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a><%
				}
				%>
				<%
				for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
					%>&nbsp;&nbsp;<a href="myWriting.jsp?cp=<%=i%>"><%=i %></a>&nbsp;&nbsp;<%
					if(i==totalPage)break;
				}
				%>
				<%
				if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
					%><a href="myWriting.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a><%
				}
				%>
				</td>
			</tr>
			</tfoot>
			
		</table>
		<br>
		<h3>내가 쓴 댓글(QnA)</h3>
			<table border="1">
				<thead>
					<tr>
					<th>모임이름</th>
					<th>제목</th>
					<th>등록일자</th>
					<th>삭제</th>
					</tr>
				</thead>
				<tbody>
				<%
				HashMap<Integer,String> map1=mdao.moimName();
				ArrayList<NoimgDTO> dto2=mdao.getMyQna(2, 21,1,cp);
				if(dto2==null||dto2.size()==0){
					%>
					<tr>
						<td colspan="5" align="center">
						등록된 댓글이 없습니다.
						</td>
					</tr>
					<%
				}else{
					for(int i=0;i<dto2.size();i++){
						%>
						<tr>
							<td id="moimname"><%=map1.get(dto2.get(i).getIdx_info())%></td>
							<td id="subject"><%=dto2.get(i).getSubject() %></td>
							<td id="writedate"><%=dto2.get(i).getWritedate() %></td>
							<td id="update"><input type="submit" value="삭제" onclick="javascript:location.href='myWritingDelQna_ok.jsp?idx=<%=dto2.get(i).getIdx()%>'"></td>
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
					%>&nbsp;&nbsp;<a href="myWriting.jsp?idx_member=<%=21%>&cp=<%=i%>"><%=i %></a>&nbsp;&nbsp;<%
					if(i==totalPage2)break;
				}
				%>
				<%
				if(userGroup!=(totalPage2/pageSize-(totalPage2%pageSize==0?1:0))){
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