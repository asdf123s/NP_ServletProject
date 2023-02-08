<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>뉴핏</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/inc/asset.jsp"%>
<style>
.btn.btn-primary.admin-btn:first-child {
	border: solid 1px #28a745;
	background-color: transparent;
	color: #28a745;
}

input:read-only {
	border: none !important;
}

#memViewDetailtbl input {
	border: solid 1px #CCC;
	width: 90%;
	border-radius: 10px;
	padding: 5px;
	margin: 0 auto;
	outline: none;
}

#memViewDetailtbl tr {
	line-height: 20px;
}
#content{
	height:200px;
}
</style>
</head>
<body class="goto-here">


	<%@ include file="/WEB-INF/inc/header.jsp"%>
	<div class="container">

		<form method="POST" action="/np/admin/noticeAddOk.do" id="form" enctype="multipart/form-data">
			<h4 class="memViewDetailId">공지사항 등록</h4>
			<table id="memViewDetailtbl">

				<tr>
					<th>제목</th>
					<td><input type="text" name="title" id="title"></td>
					
				</tr>
				<tr>
					<th>내용</th>
					<td><input type="text" name="content" id="content"></td>
					
				</tr>
				<tr>
					<th>이미지</th>
					<td><input type="file" name="img" id="img"></td>
				
				</tr>

			</table>

			<div class="memVeiwDetailbtns">
				<button type="button" onclick="check();"
					class="btn btn-primary admin-btn">등록하기</button>
				<button type="button"
					onclick="location.href='/np/admin/chart.do?type=product';"
					class="btn btn-primary admin-btn">뒤로가기</button>
			</div>
		</form>
	</div>

	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<%@ include file="/WEB-INF/inc/asset2.jsp"%>

	<script>
		function check() {
			
			var title = $('#title').val().trim();
			var content = $('#content').val().trim();
			
			if(title.length == 0){
				alert("제목을 입력해주세요.")
			}else if(content.length == 0){
				alert("내용을 입력해주세요.")
			}else{
			
				if (confirm('등록하시겠습니까?')) {
					document.getElementById('form').submit();
				}
			}
		}
	</script>

</body>
</html>