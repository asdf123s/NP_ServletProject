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
		
		<h1 id="title" class="title-community title">커뮤니티 <span class="title_icon"><i class="far fa-paper-plane"></i></span></h1>
		<div class="title_txt">여러 정보를 소통해보세요.</div>
		
		<ul class="commu_category">
			<li><a href="/np/community.do">ALL</a></li>
			<li style="background-color: #92AC60;"><a href="/np/board/freeBoard.do" style="color: white;">자유게시판</a></li>
			<li><a href="/np/board/qnaBoard.do">QnA게시판</a></li>
		</ul>

		<form method="GET" action="/np/community.do">
			<div class="commu_search">
				<input type="text" name="word" class="search_key"
					placeholder="제품명을 입력하세요.">
				<button type="submit" class="search_btn">검색</button>
			</div>
		</form>

		<div class="commu_write">
			<span class="write_txt"><a href="/np/board/commuWrite.do">글쓰기</a></span>
			<span class="write_icon"><a href="/np/board/commuWrite.do">+</a></span>
		</div>

		<div class="commu_content">
		
			<c:forEach items="${freeList}" var="dto">
			<div class="content_info">
				<!-- if문 걸어서 자유글이면 boardDetail.do / qna글이면 qnaDetail.do -->
				<a href="/np/board/freeboardDetail.do?boardSeq=${dto.freeBoardSeq}" class="content_link">
				<div class="content_title title">${dto.freeBoardTitle}</div>
				<input type="hidden" name="freeBoardSeq" value="${dto.freeBoardSeq}">
				</a>
				<div class="content_txt">${dto.freeBoardTxt}</div>
				<div class="content_comment">
					<span class="comment_icon"><i class="far fa-comment-dots"></i></span>
					<span class="comment_cnt">${dto.comment }</span>
				</div>
			</div>
			</c:forEach>
		</div>


		<div class="commu_page">
			<ul class="pagebar">
				${pagebar}
			</ul>
		</div>

	</section>


	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<%@ include file="/WEB-INF/inc/asset2.jsp"%>


	<script>
		$('.commu_category > li').mouseover(function(){
			$('.commu_category > li:nth-child(2)').css('background-color', '#fff');
			$('.commu_category > li:nth-child(2) > a').css('color', '#82AE46');
			$(this).css('background-color', '#82AE46');
			$(this).children().css('color', '#fff');
		});
		$('.commu_category > li').mouseleave(function(){
			$(this).css('background-color', '#fff');
			$(this).children().css('color', '#82AE46');
		});
	</script>

</body>
</html>