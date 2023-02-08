<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
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

				<h1>주문 배송현황</h1>
				<p class="subContent">주문한 상품 배송현황을 확인해 보세요.</p>
				<div class="row">
					<div class="col-md-12 ftco-animate">
						<div class="cart-list">
							<table class="table">
								<thead class="thead-primary">
									<tr class="text-center">
										<th>주문상품</th>
										<th>주문정보</th>
										<th>주문일자</th>
										<th>배송현황</th>

									</tr>
								</thead>
								
								<tbody>
									<c:forEach var="dlist" items="${dlist}" >
									<tr class="text-center">

										<td class="image-prod"><div class="img"
												style="background-image: url(asset/images/${dlist.productImage});"></div>

										</td>

										<td class="product-name">
											<h3><a href='' target='_blank'>상품명:  ${dlist.productName} </a></h3>
											<a><br> 배송지: ${dlist.memberDestination} <br> 수령인: ${dlist.recipient}</a>
										</td>
										

										<td class="orderDay">${dlist.memberBuyDate}</td>

										<td class="total">${dlist.deliver}</td>
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