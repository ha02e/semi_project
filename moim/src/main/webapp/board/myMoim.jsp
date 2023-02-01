<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moim.member.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page import="com.moim.stat.*" %>
<%@ page import="com.moim.noimg.*" %>
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
					<td>모임 인원</td>
					<td>
					<input type="submit" value="모임게시판">
					<input type="submit" value="후기쓰기">
					</td>
					</tr>
					<%
				}
			}
			%>
			</tbody>
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
				<tr>
				<td><a href="">카테고리</a></td>
				<td><a href="">모임 이름</a></td>
				<td><a href="">모임 인원</a></td>
				<td>
				<input type="submit" value="모임게시판">
				<input type="submit" value="모임관리">
				<input type="submit" value="모임삭제">
				</td>
				</tr>
			</tbody>
		</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>