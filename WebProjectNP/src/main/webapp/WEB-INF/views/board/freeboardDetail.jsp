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
</head>
<body class="goto-here">


	<%@ include file="/WEB-INF/inc/header.jsp"%>


	<section id="hi" class="container">
		
		<div class="qnaBG">
			
			<div class="qnaBoard_id freeId">${dto.memberId}</div>
			<div class="question_talk" style="margin-bottom: 25px;">
				<div class="question_title">${dto.freeBoardTitle}</div>
			</div>
			<div class="question_talk">
				<div class="question_title">${dto.freeBoardTxt}</div>
				
				<!-- 로그인 했을 때만 보이도록 처리하기 -->
				<c:if test="${not empty memberSeq && id != dto.memberId}">
				<div class="question_thumbs" style="color: #999; cursor: pointer;" onclick="like();"><i class="far fa-thumbs-up"></i></div>
				</c:if>
				
				<c:if test="${not empty memberSeq && id == dto.memberId}">
				<!-- 로그인 했을 때만 보이도록 처리하기 -->
				<div class="boardbtns" style="display: none;">
					<div class="board_edit boardbtn"><a href="/np/board/freeboardEdit.do?boardSeq=${dto.freeBoardSeq}"><i class="fas fa-edit"></i></a></div>
					<div class="board_del boardbtn"><a href="javascript:del();"><i class="fas fa-trash"></i></a></div>
				</div>
				</c:if>
				
			</div>
			
		</div>
		
		<div class="qnabar">
		
			<!-- if문 바꿔주기 -->
			<form method="POST" action="/np/board/freeboardcommentAdd.do">
			<input type="hidden" name="boardSeq" value="${dto.freeBoardSeq}">
			<c:if test="${empty memberSeq}">
			<input type="text" name="question_search" class="question_search emptyauth" placeholder="로그인하고 의견을 남겨보세요." readonly>
			<button type="button" class="question_send" disabled><i class="far fa-paper-plane"></i></button>
			</c:if>
			
			<c:if test="${not empty memberSeq}">
			<input type="text" name="question_search" class="question_search" placeholder="의견을 남겨보세요.">
			<button type="submit" class="question_send"><i class="far fa-paper-plane"></i></button>
			</c:if>
			
			</form>
		</div>
		
		<hr style="color: #ccc;">
		
		<div class="qna_comment_view scrollBar">
			
			
			<c:if test="${empty dto.comment}">
			<!-- if 댓글이 없으면 -->
			<div class="no_comment">
				<span class="no_txt1">남겨진 댓글이 없습니다.</span>
				<span class="no_txt2">댓글을 작성해 보세요!</span>
			</div>
			</c:if>
			
			
			<c:if test="${not empty dto.comment}">
			<div class="qna_comment_list">
				
				<div class="qnacomment_icon">
					<i class="far fa-comment-dots"></i>
					<div class="qnacomment_cnt">${dto.comment}</div>
				</div>
				
				
				<c:forEach items="${clist}" var="cdto">
				
				<div class="qnacomment_info">
					<div class="qnacomment_id qnaBoard_id">${cdto.memberId}</div>
					
					<c:if test="${empty memberSeq}">
					<div class="qnacomment_txt">
						${cdto.commentContent}
					</div>
					</c:if>
					<c:if test="${not empty memberSeq}">
						<div class="qnacomment_txt" >
							<c:if test="${id == cdto.memberId}">
							<input type="hidden" class="commentContent" value="${cdto.commentContent}">
							<input type="hidden" class="commentSeq" value="${cdto.freeCommentSeq}">
							<div class="commentDel" style="display: none;"><a href="javascript:commentDel();">x</a></div>
							</c:if>
							<div class="commentContentEL">${cdto.commentContent}</div> 
							<c:if test="${id == cdto.memberId}">
							<div class="commentEdit" style="display: none;">
								<a href="javascript:void(0);" onclick="commentEdit(${cdto.freeCommentSeq});">수정</a>
							</div>
							</c:if>
						</div>
					</c:if>
					<div class="qnacomment_date">${cdto.freeDate}</div>
				</div>
				
				</c:forEach>
				
				
			</div>
			</c:if>
			
			
		</div>
		
	</section>


	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<%@ include file="/WEB-INF/inc/asset2.jsp"%>
	
	<script>
		// 아이디 끝 세자리 *로 대체
		$('.qnaBoard_id').each(function(){
			var id = $(this).text();
			var result = id.substr(id.length-3, id.length);
			$(this).text(id.replace(result, '***'));
		});
		
		$('.emptyauth').click(function(){
			
			alert('로그인이 필요합니다.');
			/* location.href = '/np/member/login.do'; */
			
		});
		
		
		var check = false;
		// 좋아요 누르면
		function like(){
			
			//alert('좋아요');
			var seq = $('input[name=boardSeq]').val();

				
			if (check == false) {
					
					$.ajax({
	
						type : 'GET',
						url : '/np/board/freeLike.do',
						data : 'seq=' + seq,
						dataType : 'json',
	
						success : function(result) {
							
	
							if (result.result == 0) {
								alert('failed');
							} else {
								$('.question_thumbs').css('color', '#fff').css(
										'background', '#82AE46');
							}
	
						},
						error : function(a, b, c) {
							console.log(a, b, c);
						}
	
					});
	
					check = true;
					
				} else {
					$.ajax({
						
						type : 'GET',
						url : '/np/board/freeLikedel.do',
						data : 'seq=' + seq,
						dataType : 'json',
	
						success : function(result) {
							
	
							if (result.result == 0) {
								alert('failed');
							} else {
								$('.question_thumbs').css('color', '#999').css('background', 'rgba(255, 255, 255, 0.8)');
							}
	
						},
						error : function(a, b, c) {
							console.log(a, b, c);
						}
	
					});
					
					check = false;
				}
		}
		
		//말풍선에 마우스 올리면 수정/삭제
		$('.question_talk').mouseover(function(){
			
			$('.boardbtns').css('display', 'block');
			
		});
		
		$('.question_talk').mouseleave(function(){
			
			$('.boardbtns').css('display', 'none');
			
		});
		
		
		
		//삭제
		function del(){
			
			var del = confirm('삭제하시겠습니까?');
			
			if(del == true) {
				
				location.href = "/np/board/freeboardDelOk.do?boardSeq=${dto.freeBoardSeq}";
				
			}
			
			
		}
		
		
		//마우스 올리면 댓글 삭제 수정
/* 		$('.qnacomment_txt').each(function(){
			
			
			
		}); */
		
		$('.qnacomment_txt').mouseover(function(){
			
			$(this).children($('.commentEdit')).css('display', 'block');
			$(this).children($('.commentDel')).css('display', 'block');
			
		});	
		

		$('.qnacomment_txt').mouseleave(function() {

			$('.commentEdit').css('display', 'none');
			$('.commentDel').css('display', 'none');

		});
		
		function commentDel(){
			var del = confirm('삭제하시겠습니까?');
			var commentSeq = $('.commentSeq').val();
			if(del == true) location.href="/np/board/freeboardcommentDel.do?commentSeq=" +commentSeq + "&boardSeq=${dto.freeBoardSeq}";
		}
		
		
		
		//댓글 수정 > 로그인 구현되면 작업하기
		function commentEdit(freeCommentSeq){
			//alert('수정');
			var txt1 = $(event.target).parent().siblings($('.commentContentEL'));
			var txt2 = $(event.target).parent().parent($('.qnacomment_txt'));
			
			txt1.text('');
			
			$(event.target).text('');
/* 			let temp = `
				<form method="POST" action="/np/board/freeboardcommentEdit.do">
				<input type="hidden" name="commentSeq" value="$('.commentSeq')">
				<input type="text" name="comment" style="border: none; width: 300px;" autofocus value="$('.commentContent')">
				<input type="submit" value="수정">
				</form>
				`;
			txt2.append(temp); */
			var content = $(".commentContent");
			var seq = $(".commentSeq");
			txt2.append('<form method="POST" action="/np/board/freeboardcommentEdit.do"><input type="hidden" name="commentSeq" value="'+seq.val()+'"><input type="hidden" name="boardSeq" value="'+${dto.freeBoardSeq}+'"><input type="text" name="comment" style="border: none; width: 300px;" autofocus value="'+content.val()+'"><input type="submit" value="수정" class="commenteditbtn"></form>');
			
			
		}
		img = '${dto.freeBoardImage}';
		if(img == ''){
			$('.qnaBG').css('height', '430px');
		} else {
			$('.qnaBG').css('height', '540px');
			$('.freeId').css('top', '16%');
			$('.question_thumbs').css('top', '87%');
		}
	</script>

</body>
</html>