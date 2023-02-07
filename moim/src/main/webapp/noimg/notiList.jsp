<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*" %>
<%@page import="com.moim.noimg.*" %>
<jsp:useBean id="ndao" class="com.moim.noimg.NoimgDAO" scope="session"></jsp:useBean>

<%
//ndao.getList 매개변수 1)idx_info 
String sidx_info=request.getParameter("idx_info");
if(sidx_info==null||sidx_info==""){
	sidx_info="0";
}
int idx_info=Integer.parseInt(sidx_info);

//ndao.getList 매개변수 2)category 
String scategory=request.getParameter("category");
if(scategory==null||scategory==""){
	scategory="1";
}
int category=Integer.parseInt(scategory);

//1)2) 값 추후 활용을 위해 세션에 저장
session.setAttribute("idx_info", idx_info);
session.setAttribute("category", category);

//ndao.getList 매개변수 3)ls
int totalContent=ndao.getNotiTotalCnt(idx_info);
int listsize=10;
int pageSize=5;
	
//ndao.getList 매개변수 4)cp
String scp=request.getParameter("cp");
if(scp==null||scp.equals("")){
	scp="1";
}
int cp=Integer.parseInt(scp);

//총 페이지 수 
int totalPage=totalContent/listsize+1;
if(totalContent%listsize==0){
	totalPage--;
}

//사용자 그룹 구하기
int userGroup=cp/pageSize;
if(cp%pageSize==0){
	userGroup--;
}
//member 테이블의 manager 값 가져오기(0:사용자/1:관리자)
Integer manager=(Integer)session.getAttribute("manager");
//로그인 안한 경우, manager값 -1로 지정
if(manager==null){
	manager=-1;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notiList</title>

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

table #idx{
	width:5%;
}

table #subject{
	width:70%;
	text-align:left;
}

table #writedate{
	width:15%;
}

.button{
	text-align: center;
	margin-left: 1000px;
	padding:20px 0 40px 0;
}
.button input{
	border:0;
	outline:none;
	width:160px;
	height:40px;
	cursor: pointer;
	background:#999999;
	color:white;
}
.button input[type="submit"]{
	background:#333333;
}
.button input:hover{
	background: #00cdac;
	transition: 0.3s;
}

/* #b{
	margin:10px 0px 10px 1100px;
} */

</style>

<script>
/*manager 값이 1이면 버튼(#b) 노출 <-> 0일 경우, 숨기기*/
function write_button(){
	var manager=<%=manager%>;
	if(manager==1){
		document.getElementById("b").style.display="block";
	}else{
		document.getElementById("b").style.display="none";
	}
	
} 
</script>

</head>
<body  onload="write_button();">
<%@include file="/header.jsp"%>
	<section >
		<article>
		<h3>공지사항</h3>
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tfoot>
				<tr>
				<td colspan="4" align="center">
				<%if(userGroup!=0){
				%>
					<a href="notiList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>"> &lt;&lt;</a>
				<%
				}
				%>
				<%
				for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
				%>
				&nbsp;&nbsp;
				<a href="notiList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;
				<%
					if(i==totalPage) break;
				}%>
				<%
				if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
				%>
					<a href="notiList.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a>
				<%
				}
				%>
				</tfoot>	
				<tbody>
				<%ArrayList<NoimgDTO> arr=ndao.getList(idx_info,category,listsize, cp);
						for(int i=0;i<arr.size();i++){	
							if(arr==null||arr.size()==0){
					%>
					<tr id="td">
					<td colspan="3">등록된 게시글이 없습니다</td>
					<%}else{ %>
					
						<td id="idx"><%=arr.get(i).getIdx()%></td>
						<td id="subject"><a href="notiContent.jsp?idx=<%=arr.get(i).getIdx()%>"><%=arr.get(i).getSubject() %></a></td>
						<td id="writedate"><%=arr.get(i).getWritedate() %></td>
					</tr>
					<%}
					}%>
				</tbody>
			</table>
	
			<div class="button">
					<input type="button" value="글쓰기" id="b" onclick="javascript:location.href='notiWrite.jsp'">
			</div>
	
		</article>
	</section>
<%@include file="/footer.jsp" %>
</body>
</html>