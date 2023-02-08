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
	#subViewDetailtbl {
		width: 100%;
		margin: 0 auto;
		margin-bottom: 70px;
		line-height: 40px;
		box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
	}

	#subViewDetailtbl th {
		background-color: #EFF5F5;
		font-weight: 900;
		text-align: center;
	}

	#subViewDetailtbl tr th, #subViewDetailtbl tr td {
		padding: 10px;
		border-bottom: solid 1px #DDD;
	}

	#subViewDetailtbl tr:first {
		border-top: solid 1px #DDD;
	}

	.subViewDetailId {
		margin: 30px 0;
	}
	
	.subVeiwDetailbtns {
		margin: 50px auto;
		text-align: center;
		margin-bottom: 100px;
	}

	.subVeiwDetailbtns button {
		margin: 0 10px;
		width: 130px;
		height: 40px;
	}
</style>
</head>
<body class="goto-here">


	<%@ include file="/WEB-INF/inc/header.jsp"%>
	<div class="container">

		<section id="hi">

			<c:forEach items="${subListDetail}" var="subdetail">
				<form method="POST"
					action="/np/admin/memEdit.do?seq=${member.memberSeq }">
					<h4 class="subViewDetailId"><i class="fa-solid fa-user-check"></i>&nbsp;${subdetail.name}님</h4>

					<table id="subViewDetailtbl">
						<tr>
							<th>구독번호</th>
							<td><input type="hidden" name="subsSeq"
								value="${subdetail.subsSeq}"> ${subdetail.subsSeq}</td>
							<th>구독날짜</th>
							<td><input type="hidden" name="subsDate"
								value="${subdetail.subsDate}"> ${subdetail.subsDate}</td>
						</tr>
						<tr>
							<th>회원번호</th>
							<td><input type="hidden" name="memberSeq"
								value="${subdetail.memberSeq}"> ${subdetail.memberSeq}</td>
							<th>회원이름</th>
							<td><input type="hidden" name="name"
								value="${subdetail.name}"> ${subdetail.name}</td>
						</tr>
						<tr>
							<th>제품번호</th>
							<td><input type="hidden" name="productSeq"
								value="${subdetail.productSeq}"> ${subdetail.productSeq}</td>
							<th>제품이름</th>
							<td><input type="hidden" name="productName"
								value="${subdetail.productName}">
								${subdetail.productName}</td>
						</tr>
						<tr>
							<th>주문번호</th>
							<td><input type="hidden" name="memberOrderSeq"
								value="${subdetail.memberOrderSeq}">
								${subdetail.memberOrderSeq}</td>
							<th>결제방법</th>
							<td><input type="hidden" name="memberPayment"
								value="${subdetail.memberPayment}">
								${subdetail.memberPayment}</td>
						</tr>
					</table>
					
					<div class="subVeiwDetailbtns">
						<button type="button" onclick="location.href='/np/admin/adminIndex.do'" class="btn btn-primary admin-btn">되돌아가기</button>
					</div>
				</form>
			</c:forEach>

		</section>

	</div>


	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<%@ include file="/WEB-INF/inc/asset2.jsp"%>

</body>
</html>