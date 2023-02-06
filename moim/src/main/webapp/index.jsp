<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.mainImg Img{
	width: 1280px;
}
.content div{
	height: 200px;
	border: 1px solid gray;
}

.notice div{
	height:200px;
	border: 1px solid gray;
}

table{
	width:80%;
	text-align:center;
	border:1px solid gray;
}

</style>
</head>
<body>
<%@include file="header.jsp" %>
<section class="mainImg">
<a href="/moim/review/reviewList.jsp"><img src="/moim/img/banner1-1.png" alt="매인 배너"></a>
</section>

<section class="content">
<div >
현재 모집 중인 소모임
</div>
</section>

<section class="notice">
<div>
<h4>공지사항</h4>
<span><a href="../notice/listNoti.jsp?idx_info=<%=session.getAttribute("idx_info")%>">더보기 > </a></span>
<table>
	<thead>
		<tr>
			<th>제목</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>1</td>
			<td>2</td>
		</tr>
	</tbody>

</table>
</div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>