<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.moim.noimg.*" %>
<%@ page import="com.moim.info.*" %>

<jsp:useBean id="mdto" class="com.moim.noimg.NoimgDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.moim.noimg.NoimgDAO"></jsp:useBean>

<jsp:useBean id="mdto2" class="com.moim.info.InfoDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao2" class="com.moim.info.InfoDAO"></jsp:useBean>

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
	background:gray;
	width:240px;
	height:160px;
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
#accordion{
	width:800px;
	text-align:center;
	/*border-collapse: collapse;*/
}
#accordion li{
	list-style: none;
	width:100%;
	margin-bottom:10px;
	padding:10px;
}
#accordion li label{
	padding:10px;
	display:flex;
	align-items:center;
	justify-content:space-between;
	cursor:pointer;
	border:1px solid #eeeeee;
}
#accordion label + input[type="radio"]{
	/*display:none;*/
}
#accordion .content{
	padding:0 10px;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.5s;
	background:#eeeeee;
}
#accordion label + input[type="radio"]:checked + .content{
	max-height:400px;
	padding:40px 20px;
	text-align:center;
}
/*
.recruit td,th{
	border-top:1px solid #999999;
	border-bottom:1px solid #999999;
	height:34px;
} 
*/
.qnasubject{
	text-align:left;
	padding-left:20px;
	cursor:pointer;
}
#qnacontent{
	display:none;
	/**background:#eeeeee;*/
	text-align:center;
	padding:20px;
}
#qnacontent td{
	border:0;
}
.rebutton{
	background-color: #999999;
	color:white;
    width:48px;
    heigth:16px;
    padding:4px 6px;
    border-radius:4px;
    font-size:12px;
}
.rebutton a:link, a:visited{
	text-decoration: none;
	cursor:pointer;
	color:white;
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
.paging a:link, a:visited{
	color:#333333;
    text-decoration: none;
    font-size:13px;
}
</style>
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
function qnaReWrite(){
	var w=320;
	var h=340;
	 
	// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	var left=Math.ceil((window.screen.width-w)/2);
	var top=Math.ceil((window.screen.height-h)/2);  
	window.open('/moim/noimg/qnaReWrite.jsp', 'qnaReWrite', 'width='+w+', height='+h+', left='+left+', top='+top);
}

function qnaDisplay(){
	var qna=document.getElementById('qnacontent');
    if(qna.style.display=='none'){ 		
    	qna.style.display = 'block'; 	
    }else{ 		
    	qna.style.display = 'none'; 	
    } 
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
int idx=3;  //int idx=Integer.parseInt(idx_s);
InfoDTO dto=mdao2.getInfo(idx);

%>
<%
int idx_info=0;
int totalCnt=mdao.getTotalCnt(idx_info);
int listSize=5;
int pageSize=5;

String cp_s=request.getParameter("cp");
if(cp_s==null || cp_s.equals("")){
   cp_s="1";
}
int cp=Integer.parseInt(cp_s);

int totalPage=(totalCnt/listSize)+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>
<body>
<%@include file="/header.jsp" %>
<section>
<article>
   <h2>홍대 독서모임</h2>
   <div class="content">
      <div class="moiminfo">
      <form name="moimContent">
         <table>
            <tr>
               <td rowspan="4" class="moimimg">
                  <div class="img"></div>
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
   <form name="qna" method="post">
 	<ul id="accordion">
	<!-- 
	<li>
			<div>
				<span class="qnawriter">작성자</span>
				<span class="qnasubject">제목</span>
				<span class="qnadate">날짜</span>
				<span class="qnabutton">답글</span>
			</div>
		</li>
		<li>
	 -->
	 <li>
	 <%
		ArrayList<NoimgDTO> arr=mdao.getQnaList(idx_info,listSize,cp);
		if(arr==null || arr.size()==0){
			%>
			<span>등록된 글이 없습니다.</span>
			<%
		}else{
			for(int i=0;i<arr.size();i++){
				%>
				<label for="<%=i%>">
					<span><%=arr.get(i).getWriter() %></span>
					<span><%=arr.get(i).getSubject() %></span>
					<span><%=arr.get(i).getWritedate() %></span>
					<span class="rebutton"><a href="javascript:qnaReWrite();">답변작성</a></span>
				</label>
				
				<input type="radio" name="accordion" id="first">
				
				<div class="content">
				<p><%=arr.get(i).getContent() %></p>
					<div>
							<a href="">수정</a>
							<a href="">삭제</a>
					</div>
				</div>
				<%
				}
			}
	 %>
		
	</li>
	</ul>
	
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