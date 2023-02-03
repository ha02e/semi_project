<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.moim.noimg.*" %>
<%@ page import="com.moim.info.*" %>

<jsp:useBean id="mdto" class="com.moim.noimg.NoimgDTO" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.moim.noimg.NoimgDAO" scope="session"></jsp:useBean>

<jsp:useBean id="mdto2" class="com.moim.info.InfoDTO" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao2" class="com.moim.info.InfoDAO" scope="session"></jsp:useBean>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{
	width:800px;
	margin:0 auto;
}
section h2{
}
section .content{
	display:flex;
	margin:0 auto;
	width:800px;
	padding:10px 0 30px 0;
}
section .moiminfo{
	width:600px;
}
section .img{
	width:240px;
	height:160px;
	position: relative;
	overflow: hidden;
}
section .img img{
	position:absolute;
	width: 100%;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
section .moiminfo table{
	width:600px;
	border:1px solid #eeeeee;
}
section .moiminfo table th{
	text-align:left;
	font-size:18px;
	padding-right:10px;
}
section .moiminfo table td{
	padding:4px 6px;
}

section .button{
	width:200px;
	padding:0 20px;
	display:flex;
	flex-direction: column;
}
section .button div{
	margin:10px;
	align-items: center;
}
.button a:link, a:visited{
	background-color: #999999;
	color:white;
    width:110px;
    heigth:30px;
    padding: 10px 20px;
    border-radius:6px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size:14px;
}

input[id*="click"]{
	display:none;
}
input[id*="click"] + label{
	display:block;
	padding:10px 20px;
	border:1px solid #e8e8e8;
	cursor:pointer;
}
input[id*="click"] + label span.go{
	display:inline-bolck;
	width:30px;
	height:30px;
	margin-left:10px;
	font-weight:900;
	color:red;
}
input[id*="click"] + label + div{
	max-height:0;
	transition:max-height 0.5s;
	overflow: hidden;
	background:#eeeeee;
	border-left:1px solid #eeeeee;
	border-right:1px solid #eeeeee;
}
input[id*="click"] + label + div p{
	display:inline-block;
	padding:10px 40px 0 40px;
}
input[id*="click"]:checked + label + div{
	max-height:500px;
}
.qnabutton{
	text-align: center;
	margin:0 0 20px 0;
}
.qnabutton form{
	display:inline;
}
.display p{
	width:100%;
}

.qnahead{
	padding:10px 20px;
	border:1px solid #e8e8e8;
}
.qnawriter{
	display:inline-block;
	width:100px;
	text-align:center;
}
.qnasubject{
	display:inline-block;
	width:460px;
	padding-left:20px;
}
.qnadate{
	display:inline-block;
	width:140px;
	text-align:center;
}
.qnahead .qnasubject{
	text-align:center;
}
.Q,.A{
	font-weight:900;
	color:red;
}
.rewrite fieldset{
	width:700px;
	margin:0 auto 20px auto;
	border:1px solid #999999;
	
}
.rewrite input[type="textarea"]{
	margin:0 auto;
}
.rewrite td{
	text-align: right;
}
.writebutton{
	text-align:right;
	margin:0 0 20px 0;
}
.writebutton input{
	border:0;
	outline:none;
	width:100px;
	height:30px;
	cursor: pointer;
}
.paging{
	text-align:center;
	margin:10px 0 0 0;
}
.paging a:link, .paging a:visited{
	color:#333333;
    text-decoration: none;
    font-size:13px;
}
</style>
<%
//int idx=mdto.getIdx();
%>
		
<script>
function moimApply(){
	var w=320;
	var h=340;
	 
	// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	var left=Math.ceil((window.screen.width-w)/2);
	var top=Math.ceil((window.screen.height-h)/2); 
	 
	window.open('/moim/stat/reqMem.jsp', 'reqMem', 'width='+w+', height='+h+', left='+left+', top='+top);
}
function qnaWrite(){
	var w=320;
	var h=340;
	 
	// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	var left=Math.ceil((window.screen.width-w)/2);
	var top=Math.ceil((window.screen.height-h)/2);  
	 
	window.open('/moim/noimg/qnaWrite.jsp', 'qnaWrite', 'width='+w+', height='+h+', left='+left+', top='+top);
}

function qnaUpdate(){
	var w=320;
	var h=340;
	 
	var left=Math.ceil((window.screen.width-w)/2);
	var top=Math.ceil((window.screen.height-h)/2);  
	window.open('/moim/noimg/qnaUpdate.jsp', 'qnaUpdate', 'width='+w+', height='+h+', left='+left+', top='+top);
}

</script>
</head>
<%
/**
String idx_s=request.getParameter("idx");
if(idx_s==null || idx_s.equals("")){
	idx_s="0";
}
*/
int idx=10;  //int idx=Integer.parseInt(idx_s);
InfoDTO dto=mdao2.getInfo(idx);
%>
<%
int listSize=5;
int pageSize=5;

int idx_info=0;
int totalCnt=mdao.getQnaTotalCnt(idx_info);
int totalPage=(totalCnt/listSize)+1;
if(totalCnt%listSize==0)totalPage--;

String cp_s=request.getParameter("cp");
if(cp_s==null || cp_s.equals("")){
   cp_s="1";
}
int cp=Integer.parseInt(cp_s);
int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>
<body>
<%@include file="/header.jsp" %>
<section>
<article>
   <h2><%=dto.getMoimname()%></h2>
   <div class="content">
      <div class="moiminfo">
      <form name="moimContent">
         <table>
            <tr>
               <td rowspan="4" class="moimimg">
                  <div class="img">
                  	<img src="/moim/userimg/<%=dto.getImg()%>">
                  </div>
               </td>
            </tr>
            <tr class="moimtext">
               <td>지역 : <%=dto.getLocal()%></td>
            </tr>
            <tr class="moimtext">
               <td>인원 : 1/<%=dto.getMaxmem() %></td>
            </tr>
            <tr class="moimtext">
               <td>
                  내용 :<br>
                  <%=dto.getContent() %>
               </td>
            </tr>
         </table>
      </form>
      </div>
      <div class="button">
         <div><a href="">채팅하러 가기</a></div>
         <div><a href="javascript:moimApply()">참여하기</a></div>
         <div><a href="">탈퇴하기</a></div>
      </div>
   </div>
</article>
<article>
   <h2>QnA</h2>
   <form name="qna">
	<div class="qnabbs">
		<div class="qnahead">
			<span class="qnawriter">작성자</span>
			<span class="qnasubject">제목</span>
			<span class="qnadate">날짜</span>
		</div>
		<%
		ArrayList<NoimgDTO> arr=mdao.getQnaList(idx_info,listSize,cp);
		if(arr==null || arr.size()==0){
			%>
			<span>등록된 글이 없습니다.</span>
			<%
		}else{
			for(int i=0;i<arr.size();i++){
			%>
			<div class="qnacontent">
				<input type="radio" name="qnacontent" id="click<%=i%>">
				<label for="click<%=i%>">
				<span class="qnawriter"><%=arr.get(i).getWriter() %></span>
				<span class="qnasubject">
					<%
					for(int z=0;z<arr.get(i).getLev();z++){
						out.println("&nbsp;&nbsp;"+"ㄴ&nbsp;"+"<span class='A'>A.&nbsp;</span>");
					}
					if(arr.get(i).getLev()==0){
						%>
						<span class="Q">Q.&nbsp;</span><%=arr.get(i).getSubject() %><span class="go">&gt;</span>
						<%
					}else{
						%>
						<%=arr.get(i).getSubject() %><span class="go">&gt;</span>
						<%
					}
					%>
				</span>
				<span class="qnadate"><%=arr.get(i).getWritedate() %></span>
				</label>
				
				<div class="display">
					<p><%=arr.get(i).getContent()%></p>
					<div class="qnabutton">
						<form name="qnaUpdate" action="/moim/noimg/qnaUpdate.jsp">
							<input type="hidden" name="idx" value="<%=arr.get(i).getIdx() %>">
							<input type="hidden" name="subject" value="<%=arr.get(i).getSubject() %>">
							<input type="hidden" name="content" value="<%=arr.get(i).getContent() %>">
							<input type="submit" value="수정" onclick="qnaUpdate();">
						</form>
						
						<form name="qnaDelete" action="/moim/noimg/qnaDelete_ok.jsp">
							<input type="hidden" name="idx" value="<%=arr.get(i).getIdx() %>">
							<input type="submit" value="삭제">
						</form>
					</div>
					<%
					if(arr.get(i).getLev()==0){	
					%>
						<div class="rewrite">
							<fieldset>
							<legend>답변작성</legend>
							<form name="qnaReWrite" method="post" action="/moim/noimg/qnaReWrite_ok.jsp?subject=<%=arr.get(i).getSubject()%>&ref=<%=arr.get(i).getRef() %>">
							<table>
								<tr> 
									<td>
										<textarea name="content" rows="3" cols="94"></textarea>
									</td>
								</tr>
								<tr>
									<td>		
										<input type="submit" value="작성">
									</td>
								</tr>
							</table>
							</form>
							</fieldset>
						</div>
						<%
					}
					%>

				</div>
			</div>
		</div>
			<%
			}
		}
		%>
	</div>
	
	<div class="paging">
      <%
      if(userGroup!=0){
		%>
		<a href="moimContent.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
		<%
      }
      %>
      <%
      for(int i=userGroup*pageSize+1;
			i<=userGroup*pageSize+pageSize;i++){
		%>
		&nbsp;&nbsp;<a href="moimContent.jsp?cp=<%=i %>"><%=i %></a>&nbsp;&nbsp;
		<%
		if(i==totalPage)break;
      }
      %>
      <%
      if(userGroup!=((totalPage/pageSize)-(totalPage%pageSize==0?1:0))){
		%>
		<a href="moimContent.jsp?cp=<%=(userGroup+1)*pageSize+1 %>">&gt;&gt;</a>
		<%
      }
      %>
	</div>
	<div class="writebutton">
		<input type="submit" value="글작성" onclick="qnaWrite()">
	</div>
	</form>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>