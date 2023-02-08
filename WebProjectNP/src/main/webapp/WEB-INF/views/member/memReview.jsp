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
	margin-top: 100px;
	margin-left: 30px;
}

.product-remove {
	flex-direction: column;
}

.subContent {
	margin-left: 30px;
}
</style>


<body class="goto-here">

	<%@ include file="/WEB-INF/inc/header.jsp"%>

		<section class="ftco-section ftco-cart">
			<div class="container">

				<h1>후기 작성내역 💬</h1>
				<p class="subContent">내가 작성했던 후기들을 확인해보세요.</p>
				<div class="row">
					<div class="col-md-12 ftco-animate">
						<div class="cart-list">
							<table class="table">
								<thead class="thead-primary">
									<tr class="text-center">
										<th>구매번호</th>
										<th>&nbsp;</th>
										<th>후기내용</th>
										<th>작성일자</th>
										<th>별점</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="rlist" items="${rlist}">
									<tr class="text-center">
										<td>${rlist.reviewSeq}</td>					
										<td class="image-prod2"><div class="img"
												style="background-image: url(asset/image/product/${rlist.reviewImage});"></div>
											</td>
										<td class="product-name">
											<h3><a href='' target='_blank'>리뷰내용 <br> ${rlist.reviewContent}</a></h3>
										</td>
										

										<td class="orderDay">${rlist.reviewRegdate}</td>

										<td class="total">${rlist.reviewScore}</td>
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