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

		<form method="POST" action="/np/board/freeboardEditOk.do" id="editform">
			<div class="qnaBG" style="height: 440px;">
				<input type="hidden" name="boardSeq" value="${dto.freeBoardSeq}">
				<input type="hidden" name="memberSeq" value="${dto.memberSeq}">
				<div class="qnaId qnaBoard_id">${dto.memberId}</div>
				<div class="question_talk" style="margin-bottom: 25px;">
					<div class="question_title">
						<input type="text" name="boardTitle" class="boardTitle"
							value="${dto.freeBoardTitle}"
							style="border: none; background-color: transparent;" size="80">
					</div>
				</div>
				<div class="question_talk">
					<div class="question_title">
						<textarea rows="3" cols="50"
							style="border: none; background-color: transparent;"
							class="boardTxt" name="boardTxt">${dto.freeBoardTxt}</textarea>
					</div>

				</div>
			</div>

			
			<div class="qnabar">

				<input type="text" name="boardTitle2"
					class="question_search boardTitle2" value="${dto.freeBoardTitle}">
				<input type="text" name="boardTxt2"
					class="question_search boardTxt2" value="${dto.freeBoardTxt}"
					style="display: none;">
				<button type="button" class="question_send" onclick="submit();">
					<i class="far fa-paper-plane"></i>
				</button>
			</div>

			<hr style="color: #ccc; margin-bottom: 50px;">
		</form>

	</section>

<br />
<br />
<br />
<br />
<br />
<br />
<br />

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
		
		
		// 하나 입력 시 동시에 입력되게 한다.
		$('.boardTitle2').keydown(function(event){
			$('.boardTitle').val($(this).val());
			
			if(event.keyCode == 13){
				$('.boardTitle2').css('display', 'none');
				$('.boardTxt2').css('display', 'inline-block').focus();
				
				$('.boardTxt2').keydown(function(event){
					$('.boardTxt').val($(this).val());
					
					if(event.keyCode == 13){
						
						var edit = confirm('수정하시겠습니까?');
						
						if(edit == true) {
							$('#editform').submit();
						}
						
						
						
					}
				});
			}
		});
		
		function submit(){
			
			$('#editform').submit();
			
		}
		
	</script>

</body>
</html>