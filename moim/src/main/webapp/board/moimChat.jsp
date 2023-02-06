<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moim.member.*" %>
<%@ page import="com.moim.noimg.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<jsp:useBean id="mdao" class="com.moim.member.MemberDAO"></jsp:useBean>
<jsp:useBean id="ndto" class="com.moim.noimg.NoimgDTO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	width:500px;
	text-align: center;
}
thead{
	background-color: gray;
}
form{
	margin-left: 450px;
	
}
</style>
</head>
<%

int idx=22;
int category=3;
MemberDTO dto=mdao.getMem(idx);

int totalCnt=mdao.getTotal("moim_noimg", 22, 5);

int listSize=10;
int pageSize=5;

String idx_member_s=request.getParameter("idx_member_s");
if(idx_member_s==null||idx_member_s.equals("")){
	idx_member_s="1";
}
int idx_member=Integer.parseInt(idx_member_s);

int totalPage=totalCnt/listSize+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=idx_member/pageSize;
if(idx_member%pageSize==0)userGroup--;

%>
<body>
<%@include file="/header.jsp" %>
<section>
<article>
	<h3>모임 이름</h3> <!-- 모임이름 가져오기 -->
	<table>
		<thead>
			<tr>
			<th>작성자 이름</th>
			<th>제목</th>
			<th>작성 날짜</th>
			</tr>
		</thead>
		<tbody>
		<%
		ArrayList<NoimgDTO> dto2=mdao.getList(0, 3, 5, 1);
		if(dto2==null||dto2.size()==0){
			%>
			<tr>
				<td colspan="5" align="center">
				등록된 글이 없습니다.
				</td>
			</tr>
			<%
		}else{
			for(int i=0;i<dto2.size();i++){
				%>
				<tr>
					<td><%=dto2.get(i).getWriter() %></td>
					<td>
						<%
						for(int z=0;z<dto2.get(i).getLev();z++){
							out.println("&nbsp;&nbsp;");
						}
						%>
						<a href="moimChatContent.jsp?idx=<%=dto2.get(i).getIdx()%>"><%=dto2.get(i).getSubject() %></a></td>
					<td><%=dto2.get(i).getWritedate() %></td>
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
				%><a href="moimChat.jsp?idx_member=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a><%
			}
			%>
			<%
			for(int i=userGroup*pageSize+1;i<userGroup*pageSize+pageSize;i++){
				%>&nbsp;&nbsp;<a href="moimChat.jsp?idx_member=<%=i%>"><%=i %></a>&nbsp;&nbsp;<%
				if(i==totalPage)break;
			}
			%>	
			<%
			if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
				%><a href="moimChat.jsp?idx_member=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a><%
			}
			%>
		</tr>
		</tfoot>
</table>
		<form name="writeChat" action="writeChat.jsp">
		<input type="submit" value="글작성">
		</form>
		<select>
		<option>작성자</option>
		<option>제목</option>
		</select>
		<input type="text" value="">
		<input type="button" value="검색">
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>