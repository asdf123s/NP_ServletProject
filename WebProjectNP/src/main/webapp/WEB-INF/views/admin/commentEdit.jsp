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

#content {
	height: 200px;
}

#content {
	border: solid 1px #CCC;
	width: 90%;
	border-radius: 10px;
	padding: 5px;
	outline: none;
	resize: none;
}
</style>
</head>
<body class="goto-here">


	<%@ include file="/WEB-INF/inc/header.jsp"%>
	<div class="container">

		<c:if test="${type eq 'qna' }">
			<form action="/np/admin/commentEditOk.do" method="POST" id="form">
				<c:forEach items="${comment }" var="dto">
					<h4 class="memViewDetailId">QnA 댓글 수정</h4>
					<input type="hidden" name="type" value="qna">
					<input type="hidden" name="seq" value="${seq }">
					<table id="memViewDetailtbl" class="qnaViewDetailtbl">
						<tr>
							<th>아이디</th>
							<td>${dto.memberName }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="content" id="content">${dto.commentContent }</textarea></td>
						</tr>

					</table>
				</c:forEach>


				<div class="memVeiwDetailbtns">
					<button type="button" onclick="check();"
						class="btn btn-primary admin-btn">수정하기</button>
					<button type="button"
						onclick="location.href='/np/admin/boardViewDetail.do?type=qna&seq=${dto.freeBoardSeq}';"
						class="btn btn-primary admin-btn">뒤로가기</button>
				</div>
			</form>
		</c:if>
		
		
		
		<c:if test="${type eq 'free' }">
		<form action="/np/admin/commentEditOk.do" method="POST" id="form">
			<c:forEach items="${comment }" var="dto">
				<h4 class="memViewDetailId">자유게시판 댓글 수정</h4>
				<input type="hidden" name="type" value="free">
				<input type="hidden" name="seq" value="${seq }">
				<table id="memViewDetailtbl" class="qnaViewDetailtbl">
						<tr>
							<th>아이디</th>
							<td>${dto.memberName }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="content" id="content">${dto.commentContent }</textarea></td>
						</tr>

				</table>
				
				<div class="memVeiwDetailbtns">
				<button type="button" onclick="check();"
					class="btn btn-primary admin-btn">수정하기</button>
				<button type="button" onclick="location.href='/np/admin/boardViewDetail.do?type=free&seq=${dto.freeBoardSeq}';"
					class="btn btn-primary admin-btn">뒤로가기</button>
			</div>
			</c:forEach>
			</form>
			</c:if>


	</div>

	<script>
		function check() {

			var content = $('#content').val().trim();

			if (content.length == 0) {
				alert("내용을 입력해주세요.")
			} else {

				if (confirm('수정하시겠습니까?')) {
					document.getElementById('form').submit();
				}
			}
		}
	</script>

	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<%@ include file="/WEB-INF/inc/asset2.jsp"%>

</body>
</html>