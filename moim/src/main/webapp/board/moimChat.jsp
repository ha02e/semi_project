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
String keyword = "";
if (request.getParameter("keyword") != null) {
	keyword = request.getParameter("keyword");
}
String cul="전체";
if(request.getParameter("cul")!=null){
	cul=request.getParameter("cul");
}


int idx=21;
MemberDTO dto=mdao.getMem(idx);



int listSize=10;
int pageSize=5;

String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);
int totalCnt=mdao.searchTotal(0, 3, listSize, cp, cul, keyword);

int totalPage=totalCnt/listSize+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;

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
		ArrayList<NoimgDTO> dto2=mdao.getList(0, 3, listSize, cp,cul,keyword);
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
				%><a href="moimChat.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>&cul=<%=cul%>&keyword=<%=keyword%>">&lt;&lt;</a><%
			}
			%>
			<%
			for(int i=userGroup*pageSize+1;i<userGroup*pageSize+pageSize;i++){
				%>&nbsp;&nbsp;<a href="moimChat.jsp?cp=<%=i%>&cul=<%=cul%>&keyword=<%=keyword%>"><%=i %></a>&nbsp;&nbsp;<%
				if(i==totalPage)break;
			}
			%>	
			<%
			if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
				%><a href="moimChat.jsp?cp=<%=(userGroup+1)*pageSize+1%>&cul=<%=cul%>&keyword=<%=keyword%>">&gt;&gt;</a><%
			}
			%>
		</tr>
		</tfoot>
</table>
		<form name="writeChat" action="writeChat.jsp">
		<input type="submit" value="글작성">
		</form>
		<form name="search" action="moimChat.jsp">
		<div>
		<select name="cul">
		<option value="전체" selected>전체</option>
		<option value="작성자">작성자</option>
		<option value="제목">제목</option>
		</select>
		<input type="text" name="keyword">
		<input type="submit" value="검색">
		</div>
		</form>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>
