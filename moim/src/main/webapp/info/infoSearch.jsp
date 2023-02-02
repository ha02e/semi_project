<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.moim.info.*" %>
<jsp:useBean id="idao" class="com.moim.info.InfoDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 가입</title>
<style>
section {
	width:1280px;
	padding: 20px;
}
section table{
	margin: 0px auto;
	width: 1200px;
	border-spacing: 0px;
	border-collapse: collapse;
}
section img{
	width: 200px;
	heigth:200px;
}
section table .intab{
	border-bottom: 1px solid black;
	height: 200px;
}
input[type="checkbox"] {
    width: 10px;
    height: 10px;
    border-radius: 50%;
    border: 1px solid #999;
    appearance: none;
    cursor: pointer;
  }

  input[type="checkbox"]:checked {
    background: black;
    border: none;
  }
#detaildiv{
	margin-top: 10px;
}
</style>
</head>
<%
String hobby[]=null;		//취미
if(request.getParameterValues("hobby")!=null){
hobby=request.getParameterValues("hobby");
}
String detail="";			//세부검색 열렸는지 여부
if(request.getParameter("detail")!=null){
	detail=request.getParameter("detail");
}
String keyword="";		//키워드
if(request.getParameter("keyword")!=null){
	keyword=request.getParameter("keyword");
}
String local="전체";			//지역
if(request.getParameter("local")!=null){
	local=request.getParameter("local");
}
%>
<%
int listSize=2;//내맘
int pageSize=5;//내맘


String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);//핵심요소 사용자로부터
ArrayList <InfoDTO> arr=null;
	int totalCnt=idao.getTotalCnt();//DB
if(keyword==""&&hobby==null&&local.equals("전체")){	
	arr=idao.searchInfo("", listSize, cp);
}else if(keyword!=""&&hobby==null&&local.equals("전체")){
	arr=idao.searchInfo(keyword,listSize,cp);
	totalCnt=idao.getTotalCntDeatil(hobby, keyword, local);
}else if(keyword!=""){
	arr=idao.searchDetailInKey(hobby, local, keyword, listSize, cp);
	totalCnt=idao.getTotalCntDeatil(hobby, keyword, local);
}else{
	arr=idao.searchDeatilNoKey(hobby, local,listSize,cp);
	totalCnt=idao.getTotalCntDeatil(hobby, keyword, local);
}

int totalPage=totalCnt/listSize+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<form name="infoSearch" action="infoSearch.jsp">
			<input type="submit" value="검색">
			<input type="text" name="keyword">
			<%if(detail.equals("on")){ %>
			<input type="button" value="세부 검색" onclick="javascript:location.href='infoSearch.jsp'">
				<div id="detaildiv">
				<fieldset>
				<table>
					<tr>
					<th>
					관심사
					</th>
						<td><input type="checkbox" name="hobby" value="운동">운동</td>
						<td><input type="checkbox" name="hobby" value="게임">게임</td>
						<td><input type="checkbox" name="hobby" value="여행">여행</td>
						<td><input type="checkbox" name="hobby" value="공연">공연</td>
						<td><input type="checkbox" name="hobby" value="요리">요리</td>
						<td><input type="checkbox" name="hobby" value="음악">음악</td>
						<td><input type="checkbox" name="hobby" value="봉사">봉사</td>
						<td><input type="checkbox" name="hobby" value="댄스">댄스</td>
					</tr>
					<tr>
					<th>지역</th>
					<td>
						<select name="local">
							<option value="전체" selected>전체</option>
							<option value="서울">서울</option>
							<option value="경기">경기</option>
							<option value="인천">인천</option>
							<option value="강원">강원</option>
							<option value="충북도">충북</option>
							<option value="충남">충남</option>
							<option value="대전">대전</option>
							<option value="세종">세종</option>
							<option value="전북">전북</option>
							<option value="전남">전남</option>
							<option value="광주">광주</option>
							<option value="경북">경북</option>
							<option value="경남">경남</option>
							<option value="대구">대구</option>
							<option value="울산">울산</option>
							<option value="부산">부산</option>
							<option value="제주">제주</option>
						</select>
						</td>
					</tr>
				</table>
				</fieldset>
				</div>
			<%}else{
				%>
				<input type="button" value="세부 검색" onclick="javascript:location.href='infoSearch.jsp?detail=on'">
				<%}
				%>
		</form>
	</article>
	<article>
		<table>
		<%
		
			if(arr!=null){
				for(int i=0;i<arr.size();i++){
		%>
			<tr>
				<td class="intab"><img alt="img<%=i %>" src="<%=arr.get(i).getImg()%>"></td>
				<td class="intab"><a href="infoContent.jsp?idx=<%=arr.get(i).getIdx()%>"><%=arr.get(i).getMoimname() %></a></td>
				<td class="intab"><%=arr.get(i).getLocal() %></td>
				<td class="intab"><%=arr.get(i).getHobby() %></td>
				<td class="intab"><%=arr.get(i).getNowmem() %>/<%=arr.get(i).getMaxmem() %></td>
			</tr>
		<%		}		
			}else{ %>
			<tr>
				<td colspan="4"><h2>게시글이 없습니다</h2></td>
			</tr>
			
			<%} %>
		<tfoot>
				<tr>
					<td colspan="4" align="center">
						<%
							if(userGroup!=0){
								%><a href="infoSearch.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>&local=<%=local%>&keyword=<%=keyword%>
								<%if(hobby!=null)for(int i=0;i<hobby.length;i++){
									%>&hobby=<%=hobby[i]%><%
								}%>">&lt;&lt;</a><%
							}
							%>
							<%
							for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
								%>&nbsp;&nbsp;<a href="infoSearch.jsp?cp=<%=i%>&local=<%=local%>&keyword=<%=keyword%>
								<%if(hobby!=null)for(int z=0;z<hobby.length;z++){
									%>&hobby=<%=hobby[z]%><%
								}%>"><%=i%></a>&nbsp;&nbsp;<%
								if(i==totalPage)break;
							}
							%>
							<%
							if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
								%><a href="infoSearch.jsp?cp=<%=(userGroup+1)*pageSize+1%>&local=<%=local%>&keyword=<%=keyword%>
								<%if(hobby!=null)for(int i=0;i<hobby.length;i++){
									%>&hobby=<%=hobby[i]%><%
								}%>">&gt;&gt;</a><%
							}
						%>
					</td>
				</tr>
			</tfoot>
		</table>
	</article>
	<hr>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>