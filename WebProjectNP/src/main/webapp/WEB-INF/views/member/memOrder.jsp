<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<title>뉴핏</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%@ include file="/WEB-INF/inc/asset.jsp"%>

</head>

<style>
h1 {
	margin-top: 0px;
	margin-left: 30px;
}

.product-remove {
	flex-direction: column;
}

.subContent {
	margin-left: 30px;
	width:100% !important;
}
</style>


<body class="goto-here">

	<%@ include file="/WEB-INF/inc/header.jsp"%>

		<section class="ftco-section ftco-cart">
			<div class="container">

				<h1>구매내역 🛒</h1>
				<p class="subContent">내가 구매한 상품을 확인해보세요</p>
				<div class="row">
					<div class="col-md-12 ftco-animate">
						<div class="cart-list">
							<table class="table">
								<thead class="thead-primary">
									<tr class="text-center">
										<th>구매번호</th>
										<th>&nbsp;</th>
										<th>상품 이름</th>
										<th>구매일자</th>
										<th>결제금액</th>
										<th>&nbsp;</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="olist" items="${olist}">
									<tr class="text-center">
										
										<td>1</td>

										<td class="image-prod"><div class="img"
												style="background-image: url(asset/images/${olist.productImage});"></div>

										</td>
										<td class="product-name">
											<h3><a href='' target='_blank'>${olist.productName}</a></h3>
											<p>배송지: ${olist.memberDestination}</p>
										</td>

										<td class="orderDay">${olist.memberBuyDate}</td>

										<td class="total">${olist.productPrice}</td>

									</tr>
									</c:forEach>
									<!-- END TR-->


								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>



	<%@ include file="/WEB-INF/inc/footer.jsp"%>


	<%@ include file="/WEB-INF/inc/asset2.jsp"%>


</body>
</html>