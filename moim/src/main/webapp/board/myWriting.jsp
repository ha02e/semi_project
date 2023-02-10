<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moim.member.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page import="com.moim.noimg.*" %>
<%@ page import="com.moim.review.*" %>
<jsp:useBean id="mdao" class="com.moim.member.MemberDAO"></jsp:useBean>
<jsp:useBean id="rdao" class="com.moim.review.ReviewDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{
	width:1280px;
	margin:0px auto;
	padding:50px 0;
}

h2{
	font-size:32px;
	width: 85%;
	margin:0 auto;
	padding-bottom:20px;
	border-bottom:1px solid #A6A6A6;
}

/* 검색창 */
form{
	width: 85%;
	margin:40px auto 16px auto;
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
form input[type="submit"] {
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

/* 게시판 리스트 */
table {
	width: 85%;
	margin:0 auto 0px auto;
	text-align: center;
	border-collapse: collapse;
}

table a:link, table a:visited{
	text-decoration: none;
	color:#333333;
}
.subject_r a:hover{
	font-weight: 800;
	color:black;
}

.category_r{
	width:15%;
}
.moimname_r{
	width:30%;
}
.subject_r{
	width:55%;
}
td.subject_r{
	text-align: left;
	margin-left:20px;
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

table #idx {
	width: 5%;
}

table #subject {
	width: 70%;
	text-align: left;
}

table #writedate {
	width: 15%;
}

#b {
	text-align: center;
	margin: 10px;
}

.bottom{
	width:1280px;
}

.button {
	width:85%;
	margin:0 auto;
	text-align: right;
	padding: 0px 0 40px 0;
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
	background: #333333;
}

.button input:hover {
	background: #00cdac;
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
Integer idx=(Integer)session.getAttribute("idx");
if(idx==null){
	idx=0;
}
Integer idx_member=(Integer)session.getAttribute("idx_member");
if(idx_member==null){
	idx_member=0;
}

int totalCnt=mdao.getTotal("moim_review", idx, 1);
int listSize=5;
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
		<table >
			<thead>
				<tr>
				<th>카테고리</th>
				<th>제목</th>
				<th>등록일자</th>
				<th>수정 &nbsp; 삭제</th>
				</tr>
			</thead>
			<tbody>
			<%
			ReviewDTO dto = rdao.getContent(idx);
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
						<td id="subject"><a href="/moim/review/reviewContent.jsp?idx=<%=dto1.get(i).getIdx()%>"><%=dto1.get(i).getSubject() %></a></td>
						<td id="writedate"><%=dto1.get(i).getWritedate() %></td>
						<td id="update">
						<input type="button" value="수정" onclick="javascript:location.href='/moim/review/updateReview.jsp?idx=<%=dto1.get(i).getIdx()%>'">
						<input type="button" value="삭제" onclick="javascript:location.href='myWritingDelReview_ok.jsp?idx=<%=dto1.get(i).getIdx()%>'">
						</td>
					</tr>
					<%
				}
			}
			%>
			</tbody>
		</table>
			<div class = "bottom">
			<div class = "paging">
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
			</div>
			</div>
			</article>
			<article>
	
		<h3>내가 쓴 댓글(QnA)</h3>
			<table>
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
				ArrayList<NoimgDTO> dto2=mdao.getMyQna(2, idx_member,listSize,cp);
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
				
			</table>
			
				<div class = "bottom">
				<div class = "paging">
				<%
				if(userGroup!=0){
					%><a href="myWriting.jsp?=idx_member=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a><%
				}
				%>
				<%
				for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
					%>&nbsp;&nbsp;<a href="myWriting.jsp?idx_member=<%=idx%>&cp=<%=i%>"><%=i %></a>&nbsp;&nbsp;<%
					if(i==totalPage2)break;
				}
				%>
				<%
				if(userGroup!=(totalPage2/pageSize-(totalPage2%pageSize==0?1:0))){
					%><a href="myWriting.jsp?idx_member=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a><%
				}
				
				%>
				</div>
				</div>
				</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>
