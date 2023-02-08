<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import = "com.test.np.*, com.test.member.*, java.util.* "%>
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
		
		<h1 class="title">장바구니 <span class="title_icon"><i class="fas fa-shopping-cart"></i></span></h1>
		<div class="title_txt">사고싶은 상품을 구매해보세요.</div>
		
		<form method="POST" action="/np/member/orderInfo.do">
			<table class="cart_tbl">
				<thead>
					<tr>
						<th><input type="checkbox" id="allcart"></th>
						<th></th>
						<th>Product Name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Total</th>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach items="${list}" var="dto">
					<tr class="cartinfo">
						<td class="cartchk">
							<input type="checkbox" class="cartseq" name="${dto.productSeq }" value="${dto.productPrice }" id="${dto.memberOrderCount }">
						</td>
						<td><img src="/np/asset/images/${dto.productImage }"></td>
						<td>
							<div class="cart_prdname"><input type="hidden" name="prdName" value="${dto.productName }">${dto.productName }</div>
							<div class="cart_prdcategory">[${dto.categoryName }]<span>${dto.storeName }</span></div>
						</td>
						<td class="cartprice cp1"><input type="hidden" readonly id="cp1" name="prdPrice" value="${dto.productPrice }"><fmt:formatNumber value="${dto.productPrice }" pattern="#,###" />원</td>
						<td>
							<input type="number" name="cartprd_cnt" value="${dto.memberOrderCount}" class="cartprd_cnt" min="0" max="1000">
						</td>
						<td class="cartprice cp2">
							<fmt:formatNumber value="${dto.productPrice * dto.memberOrderCount}" pattern="#,###" />원							
							<div class="cart_prddel"><a href="memCartDelete.do?productSeq=${dto.productSeq }">x</a></div>
						</td>
						<%-- <fmt:formatNumber value="${count}" pattern="#,##0.0" /> --%>
					</tr>
				</c:forEach>				
				</tbody>
			</table>
			
			<div class="cart_total">
				<table class="cart_total_tbl">
					<tr>
						<th>총 금액</th>
					</tr>
					<tr>
						<td>총 주문 금액</td>
						<td class="price_total"></td>
					</tr>
					<tr>
						<td>배달비</td>
						<td>3,000원</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>TOTAL</td>
						<td><input type="text" readonly name="total" id="cartTotal" value="">원</td>
					</tr>
				</table>
			</div>
			
			<button type="button" class="cartpaybtn">구매하기</button>
		</form>
		
	</section>


	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<%@ include file="/WEB-INF/inc/asset2.jsp"%>
	
	<script>
	$(document).ready(function() {
		
		$(".cartpaybtn").click(function() {				
			var seq = "";			
			var prodcount = "";
			var count = $("input[class=cartseq]").length; // 상품 갯수
			 $(".allProductSeq").val("");
			  
		 	   for(var i=0; i < count; i++ ){
			 	   
		 		  if( $("input[class=cartseq]")[i].checked == true ){		 		    
			 		    seq += $("input[class=cartseq]")[i].name + "@";
			 		    prodcount += $("input[class=cartseq]")[i].id + "@";
					}
				}
	 		  $(".allProductSeq").val(seq);
	 		 location.href = "orderInfo.do?flag=cart&productSeq="+seq+"&productCount="+prodcount; 	     
		});
		
		//전체선택
		$("#allcart").click(function() {
			if($("#allcart").is(":checked")) $("input[class=cartseq]").prop("checked", true);
			else $("input[class=cartseq]").prop("checked", false);
			
			itemSum();
		});
		
		$("input[class=cartseq]").click(function() {
			var total = $("input[class=cartseq]").length;
			var checked = $("input[class=cartseq]:checked").length;
			
			if(total != checked) $("#allcart").prop("checked", false);
			else $("#allcart").prop("checked", true); 
			
			itemSum();
		});
		
		$("input[type=number]").bind('keyup input', function(){
		    var prod_count = $(this).val();
		    var price = $(this).parent().prev().children().val();
		    
		    $(this).parent().next().html( comma(price * prod_count) + "원");
		    $(this).parent().prev().prev().prev().prev().children('input').attr("id", prod_count);
		    
		    if ( $("#cartTotal").val != "") {
		    	itemSum();
		    }
		});
	});
	
	
	//가격 > 이거 바꾸는 제이쿼리는 못짜겠어요 ㅠㅠ
 	function itemSum(){
		   var sum = 0;
	 	   var count = $("input[class=cartseq]").length; // 상품 갯수
		  
	 	   for(var i=0; i < count; i++ ){
		 	   
	 	       if( $("input[class=cartseq]")[i].checked == true ){
		 		    sum += parseInt($("input[class=cartseq]")[i].value * $("input[class=cartseq]")[i].id);	
		 	   }
			}

			var total_sum = sum + 3000;

			$(".price_total").html(comma(sum) + "원");

			$("#cartTotal").val(comma(total_sum));
		}

		function comma(str) {
			str = String(str);
			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
	</script>

</body>
</html>