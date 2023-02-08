<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>뉴핏</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="../inc/asset.jsp"%>

</head>
<body class="goto-here">
	<%@include file="../inc/header.jsp"%>


	<section id="home-section" class="hero">
		<div class="home-slider owl-carousel">
			<div class="slider-item"
				style="background-image: url(/np/asset/images/keyimage1.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div
						class="row slider-text justify-content-center align-items-center"
						data-scrollax-parent="true">

						<div class="col-md-12 ftco-animate text-center">
							<h1 class="mb-2">건강을 위한 다양한 제품과 정보를 얻고 싶은 땐 뉴핏!</h1>
							<h2 class="subheading mb-4">같은 고민을 가지고 있는 다른 분들과 함꼐 정보를
								공유해보세요.</h2>
							<p>
								<a href="/np/community.do" class="btn btn-primary keyimage-btn">더보기</a>
							</p>
						</div>

					</div>
				</div>
			</div>

			<div class="slider-item"
				style="background-image: url(/np/asset/images/keyimage2.jpeg);">
				<div class="overlay"></div>
				<div class="container">
					<div
						class="row slider-text justify-content-center align-items-center"
						data-scrollax-parent="true">

						<div class="col-sm-12 ftco-animate text-center">
							<h1 class="mb-2">영양제, 하루 권장량을 지키고 계신가요?</h1>
							<h2 class="subheading mb-4">현재 먹고있는 영양제들의 하루 권장량을 분석하고
								추천받아보세요.</h2>
							<p>
								<a href="/np/recommend/recommendAdd.do" class="btn btn-primary keyimage-btn">더보기</a>
							</p>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section main_search">
		<div class="container">
			<div class="row no-gutters ftco-services">
				<div class="search_left">
					<h5 class="search_title">원하시는 상품을 검색해보세요!</h5>
					<h6 class="search_subtitle">원하시는 상품을 키워드로 검색해 찾아보세요.</h6>
				</div>
				<form method="GET" action="mainCategory.do" class="subscribe-form">
					<div class="form-group d-flex">
						<input type="text" class="form-control" placeholder="검색어를 입력해주세요."
							name="word"> <input type="submit" value=" 검색 "
							class="submit px-3">
					</div>
				</form>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-category ftco-no-pt">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-6 order-md-last align-items-stretch d-flex">
							<div
								class="category-wrap-2 ftco-animate img align-self-stretch d-flex"
								style="background-image: url(/np/asset/images/category.jpg);">
								<div class="text text-center">
									<h2>Health</h2>
									<p>모든 건강은 여기로!</p>
									<p>
										<a href="/np/views/store/store.do" class="btn btn-primary">스토어</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div
								class="category-wrap ftco-animate img mb-4 d-flex align-items-end"
								style="background-image: url(/np/asset/images/product_23.png);">
								<div class="text px-3 py-1">
									<h2 class="mb-0">
										<a href="/np/store/prdDetail.do?seq=21">액상 비타민 C</a>
									</h2>
								</div>
							</div>
							<div
								class="category-wrap ftco-animate img d-flex align-items-end"
								style="background-image: url(/np/asset/images/product_45.png);">
								<div class="text px-3 py-1">
									<h2 class="mb-0">
										<a href="/np/store/prdDetail.do?seq=45">디데이밀 밸런스</a>
									</h2>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div
						class="category-wrap ftco-animate img mb-4 d-flex align-items-end"
						style="background-image: url(/np/asset/images/product_27.png);">
						<div class="text px-3 py-1">
							<h2 class="mb-0">
								<a href="/np/store/prdDetail.do?seq=27">스업윔</a>
							</h2>
						</div>
					</div>
					<div class="category-wrap ftco-animate img d-flex align-items-end"
						style="background-image: url(/np/asset/images/product_66.png);">
						<div class="text px-3 py-1">
							<h2 class="mb-0">
								<a href="/np/store/prdDetail.do?seq=66">오비츠 자일리톨 고체치약 유자민트향</a>
							</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">BEST ITEM</span>
					<h2 class="mb-4">뉴핏's PICK</h2>
					<p>뉴핏이 건강한 일상을 도와줄게요.</p>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<c:forEach items="${best }" var="dto" begin="0" end="7" step="1"
					varStatus="status">
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="product">
							<a href="/np/store/prdDetail.do?seq=${dto.productSeq }" class="img-prod"><img class="img-fluid"
								src="/np/asset/images/${dto.productImage }" alt="item">
								<div class="overlay"></div> </a>
							<div class="text py-3 pb-4 px-3 text-center">
								<h3>
									<a href="/np/store/prdDetail.do?seq=${dto.productSeq }">${dto.productName }</a>
								</h3>
								<div class="d-flex">
									<div class="pricing">
										<p class="price">
											<span class="price-sale"><fmt:formatNumber value="${dto.productPrice }" />원</span>
										</p>
									</div>
								</div>
								<div class="bottom-area d-flex px-3">
									<div class="m-auto d-flex">
										<a href="/np/store/prdDetail.do?seq=${dto.productSeq }"
											class="add-to-cart d-flex justify-content-center align-items-center text-center">
											<span><i class="ion-ios-menu"></i></span>
										</a> <a href="/np/store/prdDetail.do?seq=${dto.productSeq }"
											class="buy-now d-flex justify-content-center align-items-center mx-1">
											<span><i class="ion-ios-cart"></i></span>
										</a> <a href="/np/store/prdDetail.do?seq=${dto.productSeq }"
											class="heart d-flex justify-content-center align-items-center ">
											<span><i class="ion-ios-heart"></i></span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				
			
			</div>
		</div>
	</section>

	<section class="ftco-section img"
		style="background-image: url(/np/asset/images/index1.png);">
		<div class="container">
			<div class="row justify-content-end">
				<div
					class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate">
					<span class="subheading index-white">믿고 먹는 뉴핏</span>
					<h2 class="mb-4" style="color: #FFE15D;">뉴핏은 지금</h2>
					<p style="color: white;">많은 회원들이 뉴핏을 사용하고있습니다!</p>
					<div id="timer" class="d-flex mt-5">
						<div class="time">
							<fmt:formatNumber value="${productNum }" /><span>총 제품 수</span>
						</div>
						<div class="time">
							<fmt:formatNumber value="${boardNum }" /><span>총 게시글 수</span>
						</div>
						<div class="time">
							<fmt:formatNumber value="${reviewNum }" /><span>총 상품 후기 수</span>
						</div>
						<div class="time">
							<fmt:formatNumber value="${memNum }" /><span>총 회원 수</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section testimony-section">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate text-center">
					<span class="subheading">REVIEW</span>
					<h2 class="mb-4">뉴핏 회원님들의 상품후기</h2>
					<p>뉴핏을 이용해주신 고객님들의 리얼후기를 확인하세요!</p>
				</div>
			</div>
			<div class="row ftco-animate">
				<div class="col-md-12">
					<div class="carousel-testimony owl-carousel">
						<c:forEach items="${review }" var="dto" begin="0" end="4" step="1" varStatus="status">
						<div class="item">
							<div class="testimony-wrap p-4 pb-5">
							<a href="/np/store/prdDetail.do?seq=${dto.productSeq }">
								<div class="user-img mb-5"
									style="background-image: url(/np/asset/images/product_${dto.productSeq}.png)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								</a>
								<div class="text text-center">
									<p class="mb-5 pl-4 line">${dto.reviewContent }</p>
									<p class="name">${dto.memberName }</p>
									<span class="position">${dto.lvName }</span>
								</div>
							</div>
						</div>
						</c:forEach>
						
					</div>
				</div>
			</div>
		</div>
	</section>






	<%@include file="../inc/footer.jsp"%>
	<%@ include file="/WEB-INF/inc/asset2.jsp"%>

</body>
</html>