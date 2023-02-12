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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">

<style>
section{
	width:1280px;
	margin:0px auto;
	padding:50px 0;
}

h2{
	font-size:45px;
	width: 85%;
	margin:0 auto;	
	font-family: 'Black Han Sans', sans-serif;
	font-weight: normal;
	text-align: center;
}


/* 검색창 */
form{
	width: 85%;
	margin:10px auto 20px auto;
	text-align: right;
}
form select{
	border: 2px solid #00cdac; 
	border-radius: 0px; 
	padding:7px;
}
form input[type="text"] {
	border: 2px solid #00cdac; 
	border-radius: 0px; 
	padding:8px;
}
.search-bar input[type="submit"] {
	border:0; 
	background-color:transparent;
	background-image:url("/moim/img/search.png");
	background-position:center;
	background-repeat:no-repeat;
	width:30px;
	height:40px;
	cursor: pointer;
	margin:-16px 0;
}

table {
	width: 85%;
	margin:0 auto 0px auto;
	text-align: center;
	border-collapse: collapse;
	text-align: center;
}
table th {
	height: 46px;
	border-top: 2px solid #4C7C77; 
	border-bottom: 1px solid #4C7C77;
	text-align: center;
	vertical-align: inherit;
	background: #f3f3f3;
}
table td {
	border-bottom: 1px solid #e5e5e5;
	height: 46px;	
}
.name{
	width:20%;
}
.title{
	width:60%;
}
td.title{
	text-align:left;
	padding-left:30px;
}
.writedate{
	width:20%;
}
table a:link, table a:visited{
	text-decoration: none;
	color:#333333;
}
td.title a:hover{
	font-weight: 800;
	color:black;
}

/*글쓰기 버튼*/
.button {
	margin:0 auto;
	text-align: right;
	padding: 0px 0 20px 0;
}
.button input{
	border: 0;
	outline: none;
	width: 160px;
	height: 40px;
	cursor: pointer;
	background: #999999;
	color: white;
}
.button input[type="submit"] {
	background: #00cdac;
}
.button input:hover {
	background:#333333;
	transition: 0.3s;
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
	<h2>모임게시판</h2>
		<form name="search" action="moimChat.jsp">
		<div class ="search-bar">
		<select name="cul">
			<option value="전체" selected>전체</option>
			<option value="작성자">작성자</option>
			<option value="제목">제목</option>
		</select>
		<input type="text" name="keyword" size="30">
		<input type="submit" value="">
		</div>
		</form>
		
	<table>
		<thead>
			<tr>
				<th class="name">작성자 이름</th>
				<th class="title">제목</th>
				<th class="writedate">작성 날짜</th>
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
					<td class="name"><%=dto2.get(i).getWriter() %></td>
					<td class="title">
						<%
						for(int z=0;z<dto2.get(i).getLev();z++){
							out.println("&nbsp;&nbsp;");
						}
						%>
						<a href="moimChatContent.jsp?idx=<%=dto2.get(i).getIdx()%>"><%=dto2.get(i).getSubject() %></a></td>
					<td class="writedate"><%=dto2.get(i).getWritedate() %></td>
				</tr>
				<%
			}
		}
		%>
		</tbody>
</table>
		<div class="paging">
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
		</div>
		<div class="button">
			<form name="writeChat" action="writeChat.jsp">
			<input type="submit" value="글작성">
			</form>
		</div>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>
