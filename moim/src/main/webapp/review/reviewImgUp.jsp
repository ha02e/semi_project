<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- method/ enctype -->
	<form name="imgUpload" method="post" action="reviewImgUp_ok.jsp"
		enctype="multipart/form-data">
		<fieldset>
			<legend>이미지 올리기</legend>
			<ul>
				<li><label>이미지</label><input type="file" name="upload">
				</li>
			</ul>
			<div>
				<input type="submit" value="이미지 올리기">
			</div>
		</fieldset>
	</form>
</body>
</html>