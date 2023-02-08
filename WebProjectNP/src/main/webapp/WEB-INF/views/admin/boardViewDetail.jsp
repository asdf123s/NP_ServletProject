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

img {
	width: 100px;
}

.boardViewDetailtbl tr th {
	width: 10%;
}

.boardViewDetailtbl tr td:nth-child(2) {
	width: 20%;
}

.boardViewDetailtbl img {
	width: 100%;
}

.boardViewCommentWrap {
	margin-bottom: 150px;
}
</style>
</head>
<body class="goto-here">


	<%@ include file="/WEB-INF/inc/header.jsp"%>
	<div class="container">


		<c:if test="${type eq 'notice' }">
			<c:forEach items="${noticeDTO }" var="dto">
				<h4 class="memViewDetailId">공지사항</h4>
				<table id="memViewDetailtbl" class="boardViewDetailtbl">
					<tr>
						<th>제목</th>
						<td colspan="3">${dto.noticeSubject }</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>admin${dto.adminSeq }</td>
						<th>날짜</th>
						<td>${dto.noticeRegdate }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><img src="/np/asset/images/notice0${dto.noticeSeq }.jpg"></td>
						<td colspan="2">${dto.noticeContent }</td>

					</tr>

				</table>

				<div class="memVeiwDetailbtns">
					<button type="button"
						onclick="location.href='/np/admin/boardEdit.do?type=notice&seq=${dto.noticeSeq}';"
						class="btn btn-primary admin-btn">수정하기</button>
					<button type="button" onclick="check('notice');"
						class="btn btn-primary admin-btn">삭제하기</button>
				</div>
			</c:forEach>



		</c:if>




		<c:if test="${type eq 'qna' }">
			<c:forEach items="${qnaDTO }" var="dto">
				<h4 class="memViewDetailId">QnA</h4>
				<table id="memViewDetailtbl" class="qnaViewDetailtbl">
					<tr>
						<th>제목</th>
						<td>${dto.qnaBoardTitle }</td>
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
							<td colspan="2">${dto.qnaBoardTxt }</td>
						</c:if>
						<c:if test="${empty dto.qnaBoardImg }">
							<td colspan="3">${dto.qnaBoardTxt }</td>
						</c:if>
					</tr>

				</table>



				<div class="memVeiwDetailbtns">
					<button type="button"
						onclick="location.href='/np/admin/boardEdit.do?type=qna&seq=${dto.qnaBoardSeq}';"
						class="btn btn-primary admin-btn">수정하기</button>
					<button type="button" onclick="check('qna')"
						class="btn btn-primary admin-btn">삭제하기</button>
				</div>
			</c:forEach>

			<div class="boardViewCommentWrap">
				<c:forEach items="${qnaComment}" var="comment">
					<div class="boardViewComment">
						<div class="boardViewComment-id">${comment.memberName }</div>
						<div class="boardViewComment-content">${comment.commentContent }</div>
						<div id="boardViewCommentbtns">
							<button type="button"
								onclick="location.href='/np/admin/commentEdit.do?seq=${comment.freeCommentSeq}&type=qna'"
								class="btn btn-primary admin-btn">수정하기</button>
							<button type="button"
								onclick="commentDel('qna', ${comment.freeCommentSeq})"
								class="btn btn-primary admin-btn">삭제하기</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>



		<c:if test="${type eq 'free' }">
			<c:forEach items="${freeDTO }" var="dto">
				<h4 class="memViewDetailId">자유게시판</h4>
				<table id="memViewDetailtbl" class="qnaViewDetailtbl">
					<tr>
						<th>제목</th>
						<td>${dto.freeBoardTitle }</td>
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
							<td colspan="2">${dto.freeBoardTxt }</td>
						</c:if>
						<c:if test="${empty dto.freeBoardImage }">
							<td colspan="3">${dto.freeBoardTxt }</td>
						</c:if>
					</tr>

				</table>

				<div class="memVeiwDetailbtns">
					<button type="button"
						onclick="location.href='/np/admin/boardEdit.do?type=free&seq=${dto.freeBoardSeq}';"
						class="btn btn-primary admin-btn">수정하기</button>
					<button type="button" onclick="check('free')"
						class="btn btn-primary admin-btn">삭제하기</button>
				</div>
			</c:forEach>




			<div class="boardViewCommentWrap">
				<c:forEach items="${freeComment}" var="comment">
					<div class="boardViewComment">
						<div class="boardViewComment-id">${comment.memberName }</div>
						<div class="boardViewComment-content">${comment.commentContent }</div>
						<div id="boardViewCommentbtns">

							<button type="button"
								onclick="location.href='/np/admin/commentEdit.do?seq=${comment.freeCommentSeq}&type=free'"
								class="btn btn-primary admin-btn">수정하기</button>
							<button type="button"
								onclick="commentDel('free', ${comment.freeCommentSeq})"
								class="btn btn-primary admin-btn">삭제하기</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>



	</div>

	<script>
		function check(type) {

			if (confirm('삭제하시겠습니까?')) {
				location.href = '/np/admin/boardDelOk.do?seq=' + $
				{
					seq
				}
				+'&type=' + type;
			}
		}

		function commentDel(type, seq) {

			if (confirm('삭제하시겠습니까?')) {
				location.href = '/np/admin/commentDelOk.do?seq='
						+ seq + '&type=' + type + '&mainSeq=' + ${seq};
			}
		}
	</script>


	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<%@ include file="/WEB-INF/inc/asset2.jsp"%>

</body>
</html>