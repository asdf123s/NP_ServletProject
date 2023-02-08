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


	<section id="hi" class="container commuWrite_con">
		
		<h1 class="title_commuwrite title">글쓰기</h1>
		<form method="POST" action="/np/board/commuWriteOk.do" enctype="multipart/form-data">
			<div class="writeform">
			<input type="hidden" name="memSeq" value="${memberSeq }">
				<table>
					<tr>
						<td class="commu_sel">
							<select name="writeType" class="writeType">
								<option value="" selected id="default">게시판을 선택해주세요.</option>
								<option value="freeBoard">자유게시판</option>
								<option value="qnaBoard">QnA게시판</option>
							</select>
							<select name="qnaCategorySeq" class="qnaCategorySeq" style="display: none;">
								<option value="1">건강</option>
								<option value="2">다이어트</option>
								<option value="3">모발</option>
								<option value="4">피부</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="content">
							<input type="text" name="title" class="content_title content_border" size="154" placeholder="제목을 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td class="content">
							<textarea rows="10" cols="154" name="txt" class="content_border"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<input type="file" id="file" name="file">
						</td>
					</tr>
					
				</table>



				<div class="commu_btns">
					<input type="submit" class="backbtn submitbtn" value="등록하기" disabled>
					<button type="button" class="backbtn" onclick="history.back();">뒤로가기</button>
				</div>
				
			</div>
		</form>

	</section>


	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<%@ include file="/WEB-INF/inc/asset2.jsp"%>
	
	<script>
	
		$('.writeType').on('change', function(){
			//alert($('.writeType').val());
			$('.submitbtn').attr('disabled', false);
			if ($('.writeType').val() == "freeBoard") {
				//alert('');
				$('.qnaCategorySeq').css('display', 'none');
				$('.writeType').css('width', '1140px');
				$('#default').remove();
				
				
			} else if ($('.writeType').val() == "qnaBoard") {
				$('.qnaCategorySeq').css('display', 'inline-block').css('width', '415px');
				$('.writeType').css('width', '700px');
				$('#default').remove();
			}
		})
		
		
	</script>

</body>
</html>