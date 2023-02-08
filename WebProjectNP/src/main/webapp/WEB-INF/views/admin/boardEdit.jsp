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


		<c:if test="${type eq 'notice' }">
			<form action="/np/admin/noticeEditOk.do" method="POST"
				enctype="multipart/form-data" id="form">
				<c:forEach items="${noticeDTO }" var="dto">
					<h4 class="memViewDetailId">공지사항</h4>
					<input type="hidden" name="seq" value="${dto.noticeSeq }">
					<table id="memViewDetailtbl">

						<tr>
							<th>제목</th>
							<td><input type="text" name="title" id="title"
								value="${dto.noticeSubject }"></td>

						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="content" id="content">${dto.noticeContent }</textarea></td>

						</tr>
						<tr>
							<th>이미지</th>
							<td><input type="file" name="img" id="img"></td>

						</tr>

					</table>
				</c:forEach>


				<div class="memVeiwDetailbtns">
					<button type="button" onclick="check();"
						class="btn btn-primary admin-btn">수정하기</button>
					<button type="button"
						onclick="location.href='/np/admin/baordViewDetail.do?type=notice&seq=${dto.noticeSeq}';"
						class="btn btn-primary admin-btn">뒤로가기</button>
				</div>
			</form>
		</c:if>




		<c:if test="${type eq 'qna' }">
			<form action="/np/admin/boardEditOk.do" method="POST" id="form">
				<c:forEach items="${qnaDTO }" var="dto">
					<h4 class="memViewDetailId">QnA</h4>
					<input type="hidden" name="type" value="qna">
					<input type="hidden" name="seq" value="${dto.qnaBoardSeq }">
					<table id="memViewDetailtbl" class="qnaViewDetailtbl">
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" id="title"
								value="${dto.qnaBoardTitle }"></td>
							<th>추천수</th>
							<td>${dto.qnaBoardChu }</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>admin${dto.memberId }</td>
							<th>날짜</th>
							<td>${dto.qnaBoardDate }</td>
						</tr>
						<tr>
							<th>내용</th>
							<c:if test="${not empty dto.qnaBoardImg }">
								<td><img src="/np/asset/images/${dto.qnaBoardImg }"></td>
								<td colspan="2"><textarea name="content" id="content">${dto.qnaBoardTxt }</textarea></td>
							</c:if>
							<c:if test="${empty dto.qnaBoardImg }">
								<td colspan="3"><textarea name="content" id="content">${dto.qnaBoardTxt }</textarea></td>
							</c:if>
						</tr>

					</table>
				</c:forEach>


				<div class="memVeiwDetailbtns">
					<button type="button" onclick="check();"
						class="btn btn-primary admin-btn">수정하기</button>
					<button type="button"
						onclick="location.href='/np/admin/baordViewDetail.do?type=qna&seq=${dto.qnaBoardSeq}';"
						class="btn btn-primary admin-btn">뒤로가기</button>
				</div>
			</form>
		</c:if>
		
		
		
		<c:if test="${type eq 'free' }">
		<form action="/np/admin/boardEditOk.do" method="POST" id="form">
			<c:forEach items="${freeDTO }" var="dto">
				<h4 class="memViewDetailId">QnA</h4>
				<input type="hidden" name="type" value="free">
				<input type="hidden" name="seq" value="${dto.freeBoardSeq }">
				<table id="memViewDetailtbl" class="qnaViewDetailtbl">
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" id="title"
								value="${dto.freeBoardTitle }"></td>
						<th>추천수</th>
						<td>${dto.freeBoardChu }</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>admin${dto.memberId }</td>
						<th>날짜</th>
						<td>${dto.freeBoardDate }</td>
					</tr>
					<tr>
						<th>내용</th>
						<c:if test="${not empty dto.freeBoardImage }">
							<td><img src="/np/asset/images/${dto.freeBoardImage }"></td>
							<td colspan="2"><textarea id="content" name="content">${dto.freeBoardTxt }</textarea></td>
						</c:if>
						<c:if test="${empty dto.freeBoardImage }">
							<td colspan="3"><textarea id="content" name="content">${dto.freeBoardTxt }</textarea></td>
						</c:if>
					</tr>

				</table>
				
				<div class="memVeiwDetailbtns">
				<button type="button" onclick="check();"
					class="btn btn-primary admin-btn">수정하기</button>
				<button type="button" onclick="recommendFinalCheck()"
					class="btn btn-primary admin-btn">삭제하기</button>
			</div>
			</c:forEach>
			</form>
			</c:if>


	</div>

	<script>
		function check() {

			var title = $('#title').val().trim();
			var content = $('#content').val().trim();

			if (title.length == 0) {
				alert("제목을 입력해주세요.")
			} else if (content.length == 0) {
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