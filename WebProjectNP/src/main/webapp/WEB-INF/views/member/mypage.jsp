<!DOCTYPE html>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.test.member.MemDeliverDTO"%>
<%@page import="com.test.member.orderProductDTO"%>
<%@page import="java.util.ArrayList"%>
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
.dirState {
	margin-left: 150px;
	margin-right: 150px;
	padding: 21px 16px;
	background-color: white;
	margin-bottom: 10px;
	display: center;
}

/* 주문/배송조회 타이틀 */
h2 {
	margin-top: 20px;
	font-size: 15px;
	font-weight: bold;
	margin-bottom: 15px;
}

/* 장바구니 결제완료 배송중 구매확정 [로우] */
.dirState .status {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
}
/* 장바구니 결제완료 배송중 구매확정 [아이템]  */
.dirState .item {
	display: flex;
}

.dirState .number {
	font-size: 30px;
	font-weight: 500;
	text-align: center;
}

.dirState .text {
	font-size: 12px;
	font-weight: normal;
	color: #c2c2c2;
	text-align: center;
}

.dirState .icon {
	margin-left: 50px;
	margin-top: 20px;
	display: flex;
	align-items: center;
	padding: 20px;
	width: 30px;
	height: 30px;
	font-size: 30px;
	display: flex;
}

.myLv {
	white-space: normal;
}

.mypage {
	margin-left: 150px;
	margin-right: 150px;
	padding: 20px 15px;
	background-color: white;
	margin-bottom: 10px;
	display: center;
}

.mypage .myLvList {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
	border: 2px solid #b2d276;
}

.mypage .content {
		margin-right: 40px;
	margin: 15px 25px 15px 25px;
	font-size: 13px;
	font-weight: normal;
	color: #505050;
	text-align: center;
}

.mypage .content .money {
	color: tomato;
	font-size: 20px;
}

.mypage .content .nextPay {
	font-size: 20px;
	font-color: #82ae46;
}

.mypage .content .info {
	font-size: 13px;
}

.mypage .content .lv {
	font-size: 20px;
}

.myProductName {
	margin-left: 150px;
	margin-right: 150px;
	padding: 20px 15px;
	background-color: white;
	margin-bottom: 10px;
	display: center;
	margin-bottom: 30px;
}

.myProductName .myProduct>div .menu {
	display: flex;
	margin-top: 5px;
	margin-bottom: 5px;
	border-top: solid 2px #808080;
	border-bottom: solid 2px #808080;
}

.myProductName .myProduct>div .menu :nth-child(1) {
	flex: 1;
	text-align: left;
	margin-left: 30px;
}

.myProductName .myProduct>div .menu :nth-child(2) {
	flex: 3;
	text-align: center;
}

.myProductName .myProduct>div .menu :nth-child(3) {
	flex: 1;
	text-align: center;
}

.myProductName .myProduct>div .product {
	border-top-style: solid;
	border-top-width: 2px;
	border-bottom-width: 2px;
	border-bottom-style: solid;
	margin-top: 5px;
	margin-bottom: 5px;
	display: flex;
}


.myProductName .myProduct> div .product :nth-child(1) {
	display: flex;
	align-items: center;
	margin-left: 10px;
	width: 75px;
	height: 150px;
	align-items : center;
}

.myProductName .myProduct> div .product :nth-child(2) div {
	width: 150px;
	height: 150px;
	margin: 20px;
	align-items: center;
	display: flex;
}

.myProductName .myProduct> div .product :nth-child(2) img {
	width: 150px;
	height: 150px;
	margin: 20px;
	align-items: center;
	display: flex;
}


.myProductName .myProduct>div .product :nth-child(3) {
	margin-top: 20px;
	margin-left:20px;
	width: 360px;
	height: 150px;
	display: flex;
	align-items: center;
	
}

.myProductName .myProduct>div .product :nth-child(4) {
	margin: 20px;
	display: flex;
	align-items: center;
}

.mypageCategory-category li {
  display: inline-block;
  font-weight: 400px;
  font-size: 16px; 
  }
  .mypageCategory-category li a {
    color: #FFFFFF;
    padding: 5px 20px;
    border-radius: 5px;
    border: solid 1px #82ae46;
    background-color: #82ae46;
    margin: 10px 10px;
    width: 100px;
    height: 150px;
   
}

.h2category {
	display: flex;
}

.moreClick {
	margin-top: 20px;
    font-size: 15px;
    font-weight: bold;
    margin-bottom: 10px;
    flex: 1;
	text-align: right;
    
}



      
      
</style>


<body class="goto-here">

	<%@ include file="/WEB-INF/inc/header.jsp"%>
	
	 <%-- <%
		List<HashMap<String, String>> dstate = (List<HashMap<String, String>>)request.getAttribute("dstate");
		
	%> --%>


	<section id="hi"></section>
	
	<div class="container">

		<div class="mypage">
			
			<h2>마이페이지</h2>
			<div class="myLvList">

				<div class="content">
					<div>
						<div>
							<div class="info"> ${dtoMember.name} 님의 등급</div> 
							<div class="lv">${dto.mypageRank}</div>
						</div>
					</div>
				</div>
				<div class="content">
					<div class="save">적립금</div>
					<div class="money">${dto.mypagePoint}</div>
				</div>
				<div class="content">
					<div class="addMoney">누적 사용금액</div>
					<div class="nextPay">
					<c:if test="${empty addMoney.addMoney }">
					0원
					</c:if>
					<c:if test="${not empty addMoney.addMoney }">
					${addMoney.addMoney }
					</c:if>
					</div>
				</div>

			</div>
		</div>

		<div class="row justify-content-center">
			<div class="col-md-10 mb-5 text-center">
				<ul class="mypageCategory-category">
					<li><a href="/np/memInfo.do" class="active">회원정보 수정</a></li>
					<li><a href="/np/memLike.do?seq=${memberSeq }">관심상품</a></li>
					<li><a href="/np/memWrite.do?seq=${memberSeq }">내가쓴글 목록</a></li>
					<li><a href="/np/memSubs.do">구독</a></li>
				</ul>
			</div>
		</div>
		
	
		

		<div class="dirState">
			
			<div class="h2category">
			<h2>주문/배송조회</h2>
				<a href="/np/memDeliver.do?seq=${memberSeq }" class="moreClick">더보기 > </a>
			</div>
			<div class="status">

				<div class="item">
					<div>
						<div class="text">입금확인</div>
						<div class="number">${dcount.stat1}</div>
					</div>
					<div class="icon">
						<b> > </b>
					</div>
				</div>
				<div class="item">
					<div>
						<div class="text">상품준비중</div>
						<div class="number">${dcount.stat2}</div>
					</div>
					<div class="icon">
						<b> > </b>
					</div>
				</div>
				<div class="item">
					<div>
						<div class="text">배송중</div>
						<div class="number">${dcount.stat3}</div>
					</div>
					<div class="icon">
						<b> > </b>
					</div>
				</div>
				<div class="item">
					<div>
						<div class="text">배송완료</div>
						<div class="number">${dcount.stat4}</div>
					</div>
				</div>
			</div>
		</div>
	

		<!-- 내 상품명 -->
		<div class="myProductName">
			<div class="h2category">
				<h2>최근 작성 후기</h2>
				<a href="/np/member/memReview.do?seq=${memberseq }" class="moreClick">더보기 > </a>
			</div>
			
			<div class="myProduct">

				<div>
					<div class="menu">
						<div>구매 번호</div>
						<div>상품후기 / 별점</div>
						<div>후기 작성일</div>
					</div>
					
					<c:if test="${not empty dtoReview }">
					<div class="product">
						<div>${dtoReview.reviewSeq }</div>
						<div class="productImg">
							<img src="asset/image/review/${dtoReview.reviewImage}">
						</div>
						<div>
							${dtoReview.reviewContent}						
							<br> 별점: ${star}
						</div>
						<div>${reviewRegdate}</div>
					</div>
					</c:if>
					<c:if test="${empty dtoReview }">
					<div style="text-align:center; margin-top:50px;">작성한 후기가 없습니다.</div>
					</c:if>
					
				</div>
			</div>
			
		</div>

		<!-- 구매내역 -->

		<div class="myProductName">
			<div class="h2category">
				<h2>최근 구매내역</h2>
				<a href="http://localhost:8090/np/memOrder.do" class="moreClick">더보기 > </a>
			</div>
			<div class="myProduct">

				<div>
					<div class="menu">
						<div>번호</div>
						<div>상품정보</div>
						<div>구매일</div>
					</div>
					<c:if test="${not empty dtoReview }">
					<div class="product">
						<div>1</div>
						<div>
							<img src="asset/image/product/${dtoOp.productImage}">
						</div>
						<div>
							${dtoOp.productName} <br> 가격 : ${dtoOp.productPrice} <br> 배송지: ${dtoOp.memberDestination} <br>
						</div>
						<div>${buyDate}</div>
					</div>
					</c:if>
					<c:if test="${empty dtoReview }">
					<div style="text-align:center; margin-top:50px; margin-bottom:100px;">최근 구매한 상품이 없습니다.</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/inc/footer.jsp"%>


	<%@ include file="/WEB-INF/inc/asset2.jsp"%>
	
	<script>
		for(int i=0; i<addlist.size(); i++) {
		
		addMoney += addlist[i].productPrice;
		
		}
	</script>
</body>
</html>