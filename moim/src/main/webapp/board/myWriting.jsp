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
	width:1000px;
	text-align: center;
}
th{
	background-color: gray;
}
</style>
</head>
<%
int idx=22;

%>
<body>
<%@include file="/header.jsp" %>
<%@include file="sideBoard.jsp" %>
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
			ArrayList<ReviewDTO> dto1=mdao.getMyReview(2, 1);
			if(dto1==null||dto1.size()==0){
				%>
				<tr>
					<td colspan="5" align="center">
					등록된 후기가 없습니다.
					</td>
				</tr>
				<%
			}else{
				for(int i=0;i<dto1.size();i++){
					%>
					<tr>
						<td><%=dto1.get(i).getHobby() %></td>
						<td><a href=""><%=dto1.get(i).getSubject() %></a></td>
						<td><%=dto1.get(i).getWritedate() %></td>
						<td>
						<input type="button" value="수정" onclick="javascript:location.href='보낼이름.jsp?idx=<%=dto1.get(i).getIdx()%>'">
						<input type="button" value="삭제" onclick="javascript:location.href='보낼이름.jsp?idx=<%=dto1.get(i).getIdx()%>'">
						</td>
					</tr>
					<%
				}
			}
			%>
			</tbody>
			
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
				ArrayList<NoimgDTO> dto2=mdao.getMyQna(2, 1);
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
							<td><%=map1.get(dto2.get(i).getIdx_info())%></td>
							<td><%=dto2.get(i).getSubject() %></td>
							<td><%=dto2.get(i).getWritedate() %></td>
							<td><input type="submit" value="삭제"></td>
						</tr>
						<%
					}
				}
				%>
				</tbody>
			</table>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>