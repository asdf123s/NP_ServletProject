
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
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/variable-pie.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<style>
.admin-list-left {
	width: 30%;
	position: fixed;
	float: left;
	height: 70%;
}

.highcharts-container {
	margin-top: 20px;
}

.clear {
	clear: both;
}

.admin-list-right {
	width: 70%;
	float: right;
}

#container {
	height: 370px;
	margin: 0 auto;
	margin-top: 50px;
	width: 80%;
}

.highcharts-figure, .highcharts-data-table table {
	min-width: 320px;
	max-width: 700px;
	margin: 1em auto;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #ebebeb;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}

.highcharts-data-table caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

.highcharts-data-table th {
	font-weight: 600;
	padding: 0.5em;
}

.highcharts-data-table td, .highcharts-data-table th,
	.highcharts-data-table caption {
	padding: 0.5em;
}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
	{
	background: #f8f8f8;
}

.highcharts-data-table tr:hover {
	background: #f1f7ff;
}

.highcharts-no-tooltip {
	display: none;
}

.highcharts-credits {
	display: none;
}

footer {
	margin-top: 50px;
	padding: 10px 0 !important;
}

.ftco-footer.ftco-section {
	padding: 0;
}

.highcharts-title {
	margin-bottom: 20px;
	font-weight: 900;
}
.subscribe-form{
	width:60%;
	margin:30px auto;
}
.px-3{
	margin-left:20px;
}
</style>
</head>
<body class="goto-here">


	<%@ include file="/WEB-INF/inc/header.jsp"%>

	<div class="admin-list-left">
		<figure class="highcharts-figure">
			<div id="container"></div>
		</figure>
	</div>
	<div class="clear"></div>
	<div class="admin-list-right">


		<!--   유저 수정(회원번호, 생년월일, id 수정불가), 삭제(활동상태 n)    -->
		<c:if test="${type eq 'member' }">
			<div class="admin-title">
				<h2>유저 관리</h2>

			</div>
			<form action="/np/admin/chart.do" class="subscribe-form" method="GET">
				<div class="form-group d-flex">
				<input type="hidden" value="${type }" name="type">
					<input type="text" id="search-form" class="form-control"
						placeholder="검색어를 입력해주세요." style="border: solid 1px gray;" name="word">
					<input type="button" value=" 검색 " class="submit px-3"
						onclick="this.form.submit();">
				</div>
			</form>
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
				<c:forEach items="${chartList }" var="memdto">
					<tr>
						<td>${memdto.memberSeq }</td>
						<td>${memdto.name }</td>
						<td>${memdto.id }</td>
						<td>${memdto.email }</td>
						<td>${memdto.lvName }</td>
						<td>${memdto.state }</td>
						<td>
							<button type="button"
								onclick="location.href='/np/admin/memViewDetail.do?seq=${memdto.memberSeq}'"
								class="btn btn-primary admin-btn">자세히보기</button>
						</td>
					</tr>
				</c:forEach>

			</table>
			<c:if test="${empty chartList }">
				<div style="text-align:center; margin:20px; margin-bottom:100px;">검색결과가 없습니다.</div>
			</c:if>
			<div id="adminpagebar">${pagebar }</div>
		</c:if>


		<c:if test="${type eq 'product' }">
			<div class="admin-title">
				<h2>상품 관리</h2>
				<button type="button" onclick="location.href='/np/admin/prdAdd.do'"
					class="btn btn-primary admin-btn">제품 등록</button>
			</div>
			<form action="#" class="subscribe-form">
			<input type="hidden" value="${type }" name="type">
				<div class="form-group d-flex">
					<input type="text" id="search-form" class="form-control"
						placeholder="검색어를 입력해주세요." style="border: solid 1px gray;" name="word">
					<input type="button" value=" 검색 " class="submit px-3"
						onclick="this.form.submit();">
				</div>
			</form>
			<table id="admin-tbl">
				<tr>
					<th>이미지</th>
					<th>상품이름</th>
					<th>카테고리</th>
					<th>재고수량</th>
					<th></th>
				</tr>
				<c:forEach items="${chartList }" var="dto">
					<tr>
						<td><img src="/np/asset/images/${dto.productImage }"></td>
						<td>${dto.productName }</td>
						<td>${dto.categoryName }</td>
						<td>${dto.productInventory }</td>
						<td>
							<button type="button"
								onclick="location.href='/np/admin/productViewDetail.do?seq=${dto.productSeq}'"
								class="btn btn-primary admin-btn">자세히보기</button>
						</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${empty chartList }">
				<div style="text-align:center; margin:20px; margin-bottom:100px;">검색결과가 없습니다.</div>
			</c:if>
			<div id="adminpagebar">${pagebar }</div>
			
		</c:if>



		<!--   게시판 게시글, 댓글 수정 및 삭제, 검색기능   -->
		<c:if test="${type eq 'notice' }">
			<div class="admin-title admin-board-title">
				<h2>공지사항 관리</h2>
				<button type="button"
					onclick="location.href='/np/admin/boardAdd.do'"
					class="btn btn-primary admin-btn">공지사항 등록</button>
			</div>
			<form action="#" class="subscribe-form">
				<div class="form-group d-flex">
				<input type="hidden" value="${type }" name="type">
					<input type="text" id="search-form" class="form-control"
						placeholder="검색어를 입력해주세요." style="border: solid 1px gray;" name="word">
					<input type="button" value=" 검색 " class="submit px-3"
						onclick="this.form.submit();">
				</div>
			</form>
			<table id="admin-tbl">
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>제목</th>
					<th>날짜</th>
					<th></th>
				</tr>
				
				<c:forEach items="${chartList }" var="dto">
					<tr>
						<td>${dto.noticeSeq }</td>
						<td>admin${dto.adminSeq }</td>
						<td>${dto.noticeSubject }</td>
						<td>${dto.noticeRegdate }</td>
						<td>
							<button type="button"
								onclick="location.href='/np/admin/boardViewDetail.do?seq=${dto.noticeSeq}&type=notice'"
								class="btn btn-primary admin-btn">자세히보기</button>
						</td>
					</tr>
				</c:forEach>
	
				
			</table>
			<c:if test="${empty chartList }">
				<div style="text-align:center; margin:20px; margin-bottom:100px;">검색결과가 없습니다.</div>
			</c:if>
			<div id="adminpagebar">${pagebar }</div>
		</c:if>


		<c:if test="${type eq 'qna' }">
			<div class="admin-title admin-board-title">
				<h2>QnA 관리</h2>

			</div>
			<form action="#" class="subscribe-form">
			<input type="hidden" value="${type }" name="type">
				<div class="form-group d-flex">
					<input type="text" id="search-form" class="form-control"
						placeholder="검색어를 입력해주세요." style="border: solid 1px gray;" name="word">
					<input type="button" value=" 검색 " class="submit px-3"
						onclick="this.form.submit();">
				</div>
			</form>
			<table id="admin-tbl">
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>제목</th>
					<th>날짜</th>
					<th></th>
				</tr>
				<c:forEach items="${chartList }" var="dto">
					<tr>
						<td>${dto.qnaBoardSeq }</td>
						<td>${dto.memberId }</td>
						<td>${dto.qnaBoardTitle }</td>
						<td>${dto.qnaBoardDate }</td>
						<td>
							<button type="button"
								onclick="location.href='/np/admin/boardViewDetail.do?seq=${dto.qnaBoardSeq}&type=qna'"
								class="btn btn-primary admin-btn">자세히보기</button>
						</td>
					</tr>
				</c:forEach>

			</table>
			<c:if test="${empty chartList }">
				<div style="text-align:center; margin:20px; margin-bottom:100px;">검색결과가 없습니다.</div>
			</c:if>
			<div id="adminpagebar">${pagebar }</div>
		</c:if>





		<c:if test="${type eq 'free' }">
			<div class="admin-title admin-board-title">
				<h2>자유게시판 관리</h2>

			</div>
			<form action="#" class="subscribe-form">
				<div class="form-group d-flex">
				<input type="hidden" value="${type }" name="type">
					<input type="text" id="search-form" class="form-control"
						placeholder="검색어를 입력해주세요." style="border: solid 1px gray;" name="word">
					<input type="button" value=" 검색 " class="submit px-3"
						onclick="this.form.submit();">
				</div>
			</form>
			<table id="admin-tbl">
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>제목</th>
					<th>날짜</th>
					<th></th>
				</tr>
				<c:forEach items="${chartList }" var="dto">
					<tr>
						<td>${dto.freeBoardSeq }</td>
						<td>${dto.memberId }</td>
						<td>${dto.freeBoardTitle }</td>
						<td>${dto.freeBoardDate }</td>
						<td>
							<button type="button"
								onclick="location.href='/np/admin/boardViewDetail.do?seq=${dto.freeBoardSeq}&type=free'"
								class="btn btn-primary admin-btn">자세히보기</button>
						</td>
					</tr>
				</c:forEach>

			</table>
			<c:if test="${empty chartList }">
				<div style="text-align:center; margin:20px; margin-bottom:100px;">검색결과가 없습니다.</div>
			</c:if>
			<div id="adminpagebar">${pagebar }</div>
		</c:if>

	</div>

	<div class="clear"></div>



	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<%@ include file="/WEB-INF/inc/asset2.jsp"%>


	<script>
		
	//멤버 차트
	<c:if test="${type eq 'member' }">
	Highcharts.chart('container', {
	    chart: {
	        type: 'variablepie'
	    },
	    title: {
	        text: '회원 활동 현황',
	        align: 'left'
	    },
	    tooltip: {
	        headerFormat: '',
	        pointFormat: '<span style="color:{point.color}">\u25CF</span> <b> {point.name}</b><br/>' +
	        			'<b>{point.y}</b><br/>'
	            
	    },
	    series: [{
	        minPointSize: 10,
	        innerSize: '20%',
	        zMin: 0,
	        name: '',
	        data: [
	        	<c:forEach items="${memberChart}" var="dto">
	        	{
	            name: <c:if test="${dto.key eq 'y' }">'활동',</c:if>
	            <c:if test="${dto.key eq 'n' }">'탈퇴',</c:if>
	            y: ${dto.value},
	            z: 92
	        },
	        	</c:forEach>
	        	]
	    }]
	});	
	</c:if> 
	
	
	//상품 차트
	<c:if test="${type eq 'product' }">
	Highcharts.chart('container', {
	    chart: {
	        type: 'variablepie'
	    },
	    title: {
	        text: '카테고리별 구매 현황',
	        align: 'left'
	    },
	    tooltip: {
	        headerFormat: '',
	        pointFormat: '<span style="color:{point.color}">\u25CF</span> <b> {point.name}</b><br/>' +
	            '<b>{point.y}</b><br/>'
	    },
	    series: [{
	        minPointSize: 10,
	        innerSize: '20%',
	        zMin: 0,
	        name: '',
	        data: [
	        	<c:forEach items="${productChart}" var="dto">
	        	{
	            name: "${dto.key}" ,
	            y: ${dto.value},
	            z: 92
	        },
	        	</c:forEach>
	        	]
	    }]
	});	
	</c:if> 
	
	
	//게시판 차트
	<c:if test="${type eq 'notice' || type eq 'free' || type eq 'qna' }">
	Highcharts.chart('container', {
	    chart: {
	        type: 'variablepie'
	    },
	    title: {
	        text: '게시판 현황',
	        align: 'left'
	    },
	    tooltip: {
	        headerFormat: '',
	        pointFormat: '<span style="color:{point.color}">\u25CF</span> <b> {point.name}</b><br/>' +
	            '<b>{point.y}</b><br/>'
	    },
	    series: [{
	        minPointSize: 10,
	        innerSize: '20%',
	        zMin: 0,
	        name: '',
	        data: [
	        	<c:forEach items="${qnaList}" var="dto" begin="0" end="0" step="1" varStatus="status">
	        	{
	            name: 'QnA' ,
	            y: ${dto.qnaBoardNum},
	            z: 92
	        	},
	        	</c:forEach>
		        <c:forEach items="${notice}" var="dto" begin="0" end="0" step="1" varStatus="status">
	        	{
	            name: '공지사항' ,
	            y: ${dto.noticeNum},
	            z: 92
	        	},
	        	</c:forEach>
		        <c:forEach items="${freeList}" var="dto" begin="0" end="0" step="1" varStatus="status">
	        	{
	            name: '자유게시판' ,
	            y: ${dto.freeBoardNum},
	            z: 92
	       		}
	        	</c:forEach>
	        
	        	]
	    }]
	});	
	</c:if> 
	
	</script>

</body>
</html>