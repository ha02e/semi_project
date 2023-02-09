<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.moim.noimg.*" %>
<%@ page import="com.moim.info.*" %>
<%@ page import="com.moim.stat.*" %>

<%
Integer idx_member = (Integer) session.getAttribute("idx");
if (idx_member==null) {
%>
<script>
	window.alert('로그인 후 이용가능합니다');
	window.self.close();
</script>
<%
return;
}
%> 

<jsp:useBean id="mdto" class="com.moim.noimg.NoimgDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.moim.noimg.NoimgDAO"></jsp:useBean>

<jsp:useBean id="mdto2" class="com.moim.info.InfoDTO" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao2" class="com.moim.info.InfoDAO" scope="session"></jsp:useBean>

<jsp:useBean id="mdto3" class="com.moim.stat.StatDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto3"/>
<jsp:useBean id="mdao3" class="com.moim.stat.StatDAO"></jsp:useBean>
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
	margin:50px 0 10px 0;
}
section .moiminfo{
	width:800px;
	height:240px;
	display: flex;
	margin-bottom:30px;
}
.moimimg{
	padding:10px 0;
}
section .img{
	width:284px;
	height:226px;
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
.moim-content{
	width:320px;
	height:130px;
	overflow:auto;
	word-wrap:break-word;
}
.con-icon1{
	display:inline-block;
	width:18px;
	height:18px;
	vertical-align: top;
	background-image: url("/moim/img/icon01.png");
	background-size: cover;
}
.con-icon2{
	display:inline-block;
	width:18px;
	height:18px;
	vertical-align: top;
	background-image: url("/moim/img/icon02.png");
	background-size: cover;
}
.moiminfo table{
	width:650px;
	margin:0 10px 0 6px;
	border-spacing:10px;
}
.moiminfo table td{
	padding:4px 6px;
	border:2px solid #f0f0f0;
	border-radius: 4px;
	background:#f8f8f8;
}

section .button{
	display:flex;
	flex-direction: column;
}
section .button div{
	margin:10px;
	align-items: center;
}
.button a.moim-btn:link, a.moim-btn:visited{
	background-color: #999999;
	color:white;
    width:90px;
    heigth:30px;
    padding: 10px 20px;
    border-radius:6px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size:14px;
}

.nolist{
	text-align:center;
	padding:10px 20px;
	border:1px solid #e8e8e8;
}
.qnabbs-title{
	list-style: none;
	width:800px;
	padding:30px 0 0 0;
	border-top:1px solid #999999;
}
.qnabbs-title li{
	display: inline-block;
	width:396px;
}
.qnabbs-title h2{
	margin:0;
}
.qnabbs-btn{
	text-align:right;
}
.qnabbs-btn input{
	border:0;
	outline:none;
	width:100px;
	height:30px;
	cursor: pointer;
	background:#999999;
	color:white;
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
	
	background:#f3f3f3;
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

#qnabbs-write{
	display:none;
}

.rewrite fieldset{
	width:700px;
	margin:0 auto 20px auto;
	border:1px solid #999999;
	
}
.rewrite textarea{
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
	margin:10px 0 30px 0;
}
.paging a:link, .paging a:visited{
	color:#333333;
    text-decoration: none;
    font-size:13px;
}
.bottom-btn{
	text-align: center;
	padding:20px 0 40px 0;
}
.bottom-btn a.list-btn:link, .bottom-btn a.list-btn:visited{
	display:inline-block;
	padding:10px 50px;
	background:#999999;
	color:white;
	text-decoration: none;
	font-size: 14px;
	cursor: pointer;
}
.bottom-btn a.list-btn:hover{
	background: #00cdac;
	transition: 0.3s;
}
</style>
<%
	String idx_s=request.getParameter("idx");
	int idx=Integer.parseInt(idx_s);
	InfoDTO dto=mdao2.getInfo(idx);
	int idx_info=idx;
%>	
<script>
function moimApply(){
	var w=500;
	var h=340;
	 
	// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	var left=Math.ceil((window.screen.width-w)/2);
	var top=Math.ceil((window.screen.height-h)/2); 
	 
	window.open('/moim/stat/reqMem.jsp?idx_info=<%=idx_info%>', 'reqMem', 'width='+w+', height='+h+', left='+left+', top='+top);
}
function moimOut(){
	
	var msg=confirm("모임에서 탈퇴하시겠습니까?");
	if(msg){
		window.open('/moim/stat/delMemCon_ok.jsp?idx_info=<%=idx_info%>', 'delMemCon', 'width=500px, height=340px')
	}else{
	}
}
function qnaWrite(){
	var w=500;
	var h=340;
	 
	// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	var left=Math.ceil((window.screen.width-w)/2);
	var top=Math.ceil((window.screen.height-h)/2);  
	 
	window.open('/moim/noimg/qnaWrite.jsp?idx_info=<%=idx_info%>', 'qnaWrite', 'width='+w+', height='+h+', left='+left+', top='+top);
}
</script>
</head>

<%
int listSize=5;
int pageSize=5;

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
		<div class="moiminfo">
		<div class="moimContent moimimg">
			<div class="img"><img src="/moim/userimg/<%=dto.getImg()%>"></div>
		</div>	
		<table class="moimContent">
			<tr class="moimtext">
				<td><span class="con-icon1"></span>&nbsp;지역 : <%=dto.getLocal()%></td>
            </tr>
            <tr class="moimtext">
				<td><span class="con-icon2"></span>&nbsp;인원 : <%=dto.getNowmem() %>/<%=dto.getMaxmem() %></td>
            </tr>
            <tr class="moimtext">
				<td>
					<div class="moim-content">
						<span class="con-icon3"></span>
						내용 :<br>
						<%=dto.getContent().replaceAll("\n","<br>") %>
					</div>
				</td>
            </tr>
         </table>
      <div class="button">
      <%
      StatDTO dto_s=mdao3.getUserStat(idx_member,idx_info);

    	if(dto_s==null){  //모임에 신청or참여되어 있지 않은 상태
    		%>
    		<div id="apply-btn"><a href="javascript:moimApply()" class="moim-btn">참여하기</a></div>
    		<%
    	}else{ 
    		if(dto_s.getStat()==0||dto_s.getStat()==1){
    			%>
    			<div id="chat-btn"><a href="/moim/board/myMoim.jsp" class="moim-btn">채팅하러 가기</a></div>
    			<div id="out-btn"><a href="javascript:moimOut()" class="moim-btn">탈퇴하기</a></div>
    			<%
    		}else{
        		%>
        		<div id="apply-btn"><a href="javascript:moimApply()" class="moim-btn">참여하기</a></div>
        		<%
    		}	
    	}
      %>
      </div>
      </div>
</article>
<article>
	<ul class="qnabbs-title">
	<li><h2>QnA</h2></li>
	<li class="qnabbs-btn">
	<input type="submit" value="문의하기" onclick="qnaWrite();">
	</li>
	</ul>
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
			<div class="nolist">모임에 대해 궁금한 내용을 남겨주세요 :)</div>
			<%
		}else{
			for(int i=0;i<arr.size();i++){
			%>
			<div class="qnacontent">
				<input type="checkbox" name="qnacontent" id="click<%=i%>">
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
					<div id="qnabbs-write">
						<ul>
							<li><span class="title">제목</span><span><input type="text" name="subject"></span></li>
							<li><span class="text">내용</span><span><textarea name="content" rows="10" cols="50">내용을 입력해주세요.</textarea></span></li>
						</ul>
						<div>
							<span class="qnabbs-write-btn">취소</span>
							<span class="qnabbs-write-btn btn-ok"><input type="submit" value="수정" onclick="open_write();"></span>
						</div>
					</div>
					<p><%=arr.get(i).getContent()%></p>
					<div class="qnabutton">
						<input type="button" value="수정" 
								onclick="javascript:window.open('/moim/noimg/qnaUpdate.jsp?idx=<%=arr.get(i).getIdx() %>&subject=<%=arr.get(i).getSubject() %>&content=<%=arr.get(i).getContent() %>', 
								'qnaUpdate', 'width=500px, height=340px')">
								
						<form name="qnaDelete">
						<script>
							function qnaDel(){
								var msg=confirm("문의글을 정말 삭제하시겠습니까??");
								if(msg){
									window.open('/moim/noimg/qnaDelete_ok.jsp?idx=<%=arr.get(i).getIdx()%>', 'qnaDel', 'width=500px, height=340px')
								}else{
								}
							}
						</script>
							<input type="button" value="삭제" onclick="javascript:qnaDel()">
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
										<textarea name="content" rows="3" cols="94" style="resize:none"></textarea>
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
	</form>
	<div class="bottom-btn">
		<a href="infoList.jsp" class="list-btn">목록으로</a>
	</div>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>