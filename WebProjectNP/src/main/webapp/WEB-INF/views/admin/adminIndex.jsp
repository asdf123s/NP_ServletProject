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
	footer{
		margin-top:100px;
	}
	.admin-board-category a:hover{
		color:white;
	}
</style>
</head>
<body class="goto-here">


	<%@ include file="/WEB-INF/inc/header.jsp"%>


	<div class="container">
		<!--   유저 수정(회원번호, 생년월일, id 수정불가), 삭제(활동상태 n)    -->
		<div class="admin-title">
			<h2>유저 관리</h2>
			<a href="/np/admin/chart.do?type=member">
			<div class="admin-see-more">+ 더보기</div>
			</a>
		</div>
		<table id="admin-tbl">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>등급</th>
				<th>활동상태</th>
				<th></th>
			</tr>
			<c:forEach items="${memberList }" var="memdto" begin="0" end="4" step="1" varStatus="status">
				<tr>
					<td>${memdto.memberSeq }</td>
					<td>${memdto.name }</td>
					<td>${memdto.id }</td>
					<td>${memdto.email }</td>
					<td>${memdto.lvName }</td>
					<td>${memdto.state }</td>
					<td>
						<button type="button" onclick="location.href='/np/admin/memViewDetail.do?seq=${memdto.memberSeq}'"
							class="btn btn-primary admin-btn">자세히보기</button>
					</td>
				</tr>
			</c:forEach>
		</table>


		<div class="admin-title">
			<h2>상품 관리</h2>
			<a href="/np/admin/chart.do?type=product">
			<div class="admin-see-more">+ 더보기</div>
			</a>
		</div>
		<table id="admin-tbl">
			<tr>
				<th>이미지</th>
				<th>상품이름</th>
				<th>카테고리</th>
				<th>재고수량</th>
				<th></th>
			</tr>
			
			<c:forEach items="${productList }" var="dto" begin="0" end="4" step="1" varStatus="status">
			<tr>
				<td><img src="/np/asset/images/${dto.productImage }"></td>
				<td>${dto.productName }B</td>
				<td>${dto.categoryName }</td>
				<td>${dto.productInventory }</td>
				<td>
					<button type="button" onclick="location.href='/np/admin/productViewDetail.do?seq=${dto.productSeq}'"
						class="btn btn-primary admin-btn">자세히보기</button>
				</td>
			</tr>
			</c:forEach>
			
		</table>




		<!--   게시판 게시글, 댓글 수정 및 삭제, 검색기능   -->
		<div class="admin-title admin-board-title">
			<h2>게시판 관리</h2>

		</div>
		<div class="admin-board-category">
			<a href="/np/admin/chart.do?type=notice"><span>공지사항</span></a>
			<a href="/np/admin/chart.do?type=qna"><span>QnA게시판</span></a>
			<a href="/np/admin/chart.do?type=free"><span>자유게시판</span></a>
		</div>
		<table id="admin-tbl">
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>제목</th>
				<th>날짜</th>
				<th></th>
			</tr>
			
			<c:forEach items="${notice }" var="dto" begin="0" end="1" step="1" varStatus="status">
			<tr>
				<td>${dto.noticeSeq }</td>
				<td>admin${dto.adminSeq }</td>
				<td>${dto.noticeSubject }</td>
				<td>${dto.noticeRegdate }</td>
				<td>
					<button type="button" onclick="location.href='/np/admin/boardViewDetail.do?seq=${dto.noticeSeq}&type=notice'"
						class="btn btn-primary admin-btn">자세히보기</button>
				</td>
			</tr>
			</c:forEach>
			<c:forEach items="${qnaList }" var="dto" begin="0" end="1" step="1" varStatus="status">
			<tr>
				<td>${dto.qnaBoardSeq }</td>
				<td>${dto.memberId }</td>
				<td>${dto.qnaBoardTitle }</td>
				<td>${dto.qnaBoardDate }</td>
				<td>
					<button type="button" onclick="location.href='/np/admin/boardViewDetail.do?seq=${dto.qnaBoardSeq}&type=qna'"
						class="btn btn-primary admin-btn">자세히보기</button>
				</td>
			</tr>
			</c:forEach>
			<c:forEach items="${freeList }" var="dto" begin="0" end="1" step="1" varStatus="status">
			<tr>
				<td>${dto.freeBoardSeq }</td>
				<td>${dto.memberId }</td>
				<td>${dto.freeBoardTitle }</td>
				<td>${dto.freeBoardDate }</td>
				<td>
					<button type="button" onclick="location.href='/np/admin/boardViewDetail.do?seq=${dto.freeBoardSeq}&type=free'"
						class="btn btn-primary admin-btn">자세히보기</button>
				</td>
			</tr>
			</c:forEach>
		</table>
		
		
		
		<div class="admin-title admin-board-title">
			<h2><i class="fa-solid fa-paperclip" style="color: #82ae46"></i>&nbsp;구독 관리</h2>
		</div>
		<table id="admin-tbl">
			<tr>
				<th>구독번호</th>
				<th>회원이름</th>
				<th>상품이름</th>
				<th>구독날짜</th>
				<th></th>
			</tr>
			<c:forEach items="${subList}" var="subdto" begin="0" end="4" step="1" varStatus="status">
				<tr>
					<td>${subdto.subsSeq}</td>
					<td>${subdto.name}</td>
					<td>${subdto.productName}</td>
					<td>${subdto.subsDate}</td>
					<td>
						<button type="button" onclick="location.href='/np/admin/subViewDetail.do?seq=${subdto.subsSeq}'"
							class="btn btn-primary admin-btn">자세히보기</button>
					</td>
				</tr>
			</c:forEach>
		</table>

	</div>

	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<%@ include file="/WEB-INF/inc/asset2.jsp"%>

</body>
</html>