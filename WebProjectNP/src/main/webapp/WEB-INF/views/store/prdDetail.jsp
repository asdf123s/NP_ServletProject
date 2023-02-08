<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>뉴핏</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%@ include file="/WEB-INF/inc/asset.jsp" %>
    
<!--     차트 -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
  </head>
  <style>
  
  button {cursor: pointer;}
  
  	section{margin: 0 atuo;}
  	
/*   	상품 결제부분 */
  	.prd{
		display: flex;
		margin-top: 30px;
		align-items:center;
		margin-bottom: 30px;
		border-bottom: 1px solid #ccc;
		padding-bottom: 80px;
	}
	
/* 	상품이미지 */
	.pic {
		width: 550px;
		height: 550px;
		background-color: #F2F2F2;
	}
	.pic > img{
		width: 550px;
		height: 550px;
	}
	
/* 	상품정보 오른쪽 */
	.content {
		width: 530px;
		margin: 0 30px;
	}
	
	.content > h1 {font-size: 30px; font-weight: bold; margin-bottom: 30px;}
	
/* 	수량부분 */
	
	body > section > form:nth-child(1) > div > div.content div.qty > div.minus > a > input{
		outline: none;
		border: 1px solid #ccc;
		width: 40px;
		height: 40px;
		border-radius: 100%;
		background-color: white;
		font-weight: bold;
		font-size: 24px;
		color: #333333;
		box-shadow: 3px 3px 5px #ccc;
		line-height: 10px;
		text-align:center; line-height: 40px; cursor: pointer;
	}
	
	#ct_qty {width: 50px; margin: 0 30px; font-size: 20px; font-weight: bold; color: #3B3B3B; text-align:center; border: 0; color: #3B3B3B;}
	
	body > section > form:nth-child(1) > div > div.content  div.qty > div.plus > a > input{
		outline: none;
		border: 1px solid #ccc;
		width: 40px;
		height: 40px;
		border-radius: 100%;
		background-color: white;
		font-weight: bold;
		font-size: 24px;
		color: #333333;
		box-shadow: 3px 3px 5px #ccc;
		line-height: 10px;
		text-align:center; line-height: 40px;
	  cursor: pointer;
	}
	body > section > form:nth-child(1) > div > div.content  div.qty {
		display: flex; justify-content: space-between; margin-bottom: 30px;
	}
	
	body > section > form:nth-child(1) > div > div.content .suryang > h2{font-size: 20px; font-weight: bold;}
	
	.suryang {display: flex;  justify-content: space-between;}
	
	
/* 	별점부분 후기 */

	
	.star-ratings {
width: 30px; height: 30px;
font-size: 30px;
margin: 0;
align-items: stretch;

  color: #aaa9a9; 
  position: relative;
  unicode-bidi: bidi-override;
  width: max-content;
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 0px; /*별선..?*/
  -webkit-text-stroke-color: #2b2a29;
}

body > section > div.prd > div.content > div.review > div.star-ratings > div.star-ratings-fill.space-x-2.text-lg {
	height: 30px; width: 30px;	
}

.star-ratings-fill {
  color: #fff58c;
  padding: 0;
  position: absolute;
  z-index: 1;
  display: flex;
  top: 0;
  left: 0;
  overflow: hidden;
  -webkit-text-fill-color: gold;
}
 
.star-ratings-base {
  z-index: 0;
  padding: 0;
}


.review{display: flex;}

.count{
	display: flex;
	font-size:20px;
	margin-left: 20px;
	line-height: 50px;
}
.count p {font-size:20px; font-weight: bold; margin: 0; color: #363636;}
body > section > div.prd > div.content > div.review > div.count > span:nth-child(3){
	margin-left: 30px;
}

#myform > fieldset > label {height: 50px;}


	
/* 	가격부분 */
	#price {
		display: flex;
		justify-content: space-between;
		align-items:center;
		margin: 30px 0;
	}
	
	#price h2{font-size: 20px; font-weight: bold;}
	#price h1{font-size: 25px; font-weight: bold;}
	#price h1 > input {outer: 0; border: 0; text-align: right; font-weight: bold;}
	
/* 	장바구니, 결제하기 */	
	.btns{
		margin: 0 auto;
		width: 400px;
		justify-content: space-between;
	}
	
	.btns > .cart{
		width: 180px;
		height: 55px;
		margin: 0;
		font-size: 18px;
		color: white;
		background-color: #2B2B2B;
		border-radius: 100px;
		border: 1px solid #2B2B2B;
		outline: none;
		box-shadow: 3px 3px 5px #ccc;
	}
	
	.btns > .buy{
		width: 180px;
		height: 55px;
		margin-left: 30px;
		font-size: 18px;
		color: white;
		background-color: #82AE46;
		border-radius: 100px;
		border: 1px solid #82AE46;
		outline: none;
		box-shadow: 3px 3px 5px #ccc;
	}
	
	
/* 	상품상세이미지부분 */
	.prdimg{
		margin-top: 50px;
		width: 770px;
		margin: 0 auto;
	}
	
	.prdimg > h2 {
		font-size: 20px;
		font-weight: bold;
	}
	
	
	
/* 	상품후기부분 */

	#prdReview{
		width: 770px;
		margin: 0 auto;
	}
	
	#prdReview > h1 {font-weight: bold; font-size: 25px; margin: 50px 0 30px 0;}
	#prdReview > h1 > em {font-weight: bold; font-size: 25px; color: #82AE46;}
	
	.rating{
		display: flex;
	}
	
	.summary{
		width: 370px;
		height: 170px;
		background-color: #FAFAFA;
		border-radius: 10px;
	}
	
	.summary-content {margin-top: 40px;}
	
	.summary .summary-content h1{
		text-align: center;
		font-size: 30px;
		font-weight: bold;
		
	}
	.summary .summary-content h1 > span{color: darkgray;}
	
	.summary-content .star{
	    word-break: keep-all;
    line-height: 1.2;
    color: #333;
    -webkit-box-direction: normal;
    font-weight: 700;
    text-align: center;
    margin: 0;
    padding: 0;
    border: 0;
    font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", sans-serif;
    vertical-align: baseline;
    font-size: 16px;
    margin-top: 7.5px;
	}
	
	.chart{
		width: 370px;
		height: 170px;
		margin-left:30px;
	}
	
	
	.review-btn {
		width: 770px;
		height: 50px;
		margin: 20px 0;
		margin-bottom: 50px;
		font-size: 16px;
		font-weight: bold;
		border: 1.8px solid darkgray;
		border-radius: 10px;
		background-color: white;
		box-shadow: 3px 3px 5px #ccc;
	}
	
	
	
	.review-list {margin-bottom: 30px; width: 770px;}
	.review-list > h4 {font-size: 16px; font-weight: bold; margin: 0;}
	
	.review-list .rating {display:flex; margin-top: 10px; height: 30px;}
	.review-list .rating .star {margin:0;}
	
	.review-list .rating > em {
		font-size:12px; color: #858589; font-weight: bold; margin-left: 10px;
		line-height: 28px;
	}
	
	.review-list .image {height: 150px;}
	.review-list .image > img {wdith: 150px; height: 150px;}
	
	.review-list p{color: #333333; font-size:16px; margin-top: 10px; font-weight: bold;}
	
	
	
/* 	별점 */

	#star {
  display: flex;
}

.star {
  font-size: 2rem;
  margin: 10px 0;
  cursor: pointer;
}

.star:not(.on) {
  color: #ccc;
}

.star.on {
  color: orange;
}

#chart_div > div > div:nth-child(1) > div > svg > g:nth-child(3) > g > rect{display:none;}

#chart_div > div > div:nth-child(1) > div > svg > g:nth-child(4) > g:nth-child(4) > g > text{
	font-size:12px; font-weight: bold;
}
  
  
  p{margin: 0;}
  </style>
  <body class="goto-here">
    <%@ include file="/WEB-INF/inc/header.jsp" %>
		

    <section class="container">
    
    	<form name="memCart" method="POST" action="/np/cartAdd.do">
    		
    	<div class="prd">
    		
    		<div class="pic">
    			<img src="/np/asset/images/${dto1.productImage }" alt="" />
    		</div>
    		
    		
    		<div class="content">
	    		<h1>${dto1.productName}</h1>
	    		
<!-- 	    			수량부분 -->
	    		<div class="suryang">	
	    			<h2>수량</h2>
		    		<div class="qty">		
	        
				        <div class="minus">
					        <a href="javascript:change_qty2('m')">
					        	<input type="button" class="minus" value="-">
					        </a>
				        </div>
				        
				        <input type="text" name="memberOrderCount" id="ct_qty" value="1" readonly="readonly">
				      			
				        <div class="plus">
				        	<a href="javascript:change_qty2('p')">
				        		<input type="button" class="plus" value="+">
				        	</a>
				        </div>
				        
				     </div>	
			     </div>	
			     
			     <p style="text-align:right; font-size: 14px; color:#ccc">※1회 구매 시 최대 30개 구매하실 수 있습니다.</p>
				
			<div class="review" style="height: 50px; justify-content:space-between;">
			
				<div>
					<p class="star" style="margin: 0; line-height:50px;">
						<c:forEach begin="1" end="${avg.reviewAvg}"> <!-- end에다가 ${dto.reviewAvg} -->
						<img src="/np/asset/images/star.png" alt="" style="width:18px;">
						</c:forEach>
					</p>
				</div>

					<div class="count">
						<p>${avg.reviewAvg }</p> <!-- 별평균점수 -->
						<span style="color: #B4B4B4;">/5</span>
						&nbsp;
						<span style="color: #B4B4B4;">후기</span>
						<p> ${dto.reviewCnt }</p> 
					</div>
			</div>
			
				<hr style="color: #ccc;">
				
				
				<div id="price">
					<h2>상품 금액</h2>
					<h1>
						<p id="total_amount">${dto1.productPrice }원</p>
						<input type="hidden" value="${dto1.productSeq }" id="productSeq" name="productSeq">
						<input type="hidden" id="memberSeq" name="memberSeq">
						<input type="hidden" name="flag" value="add">
					</h1>
				</div>


				<div class="btns">
					<button type="button" class="cart">장바구니</button>
					<button type="button" onclick="location.href='orderInfo.do?flag=store&productSeq=${dto1.productSeq}&productCount='+$('#ct_qty').val()" class="buy">구매하기</button>
				</div>


			</div> <!-- content끝 -->
			
			
    		
    	</div> <!-- div.prd 상품결제부분 -->
    	</form>
    	
<!--     	상품상세이미지 -->
    	<div class="prdimg">
    		<h2>상품설명</h2>
    		<img src="/np/asset/images/${dto1.productDetailImage }" style="width: 700px;" />
    	</div>


		<div id="prdReview">
			<h1>상품후기 <em>${dto.reviewCnt }</em></h1>

			<div class="rating">
				<div class="summary">
					<div class="summary-content">
						<h1>${avg.reviewAvg}<span>/5</span></h1>
						<p class="star">
							<c:forEach begin="1" end="${avg.reviewAvg}">
							<img src="/np/asset/images/star.png" alt="" style="width:18px;">
							</c:forEach>
						</p>
					</div>
				</div>
				
<!-- 				차트 -->
				<div id="chart_div"></div>
				
			</div>

		<button type="submit" class="review-btn" onclick="location.href='/np/store/review.do?seq=${dto1.productSeq}';">
			상품후기 작성하기<img src="/np/asset/images/icon-write.png" alt="" />
		</button>
    		
		<c:forEach items="${reviewList}" var="dto">
    		<div class="review-list">
    			<h4>${dto.name }</h4>
    			
    			<div class="rating" style="height: 30px;">
    				<p class="star" style="margin: 0;">
						<c:forEach begin="1" end="${dto.reviewScore}">
							<img src="/np/asset/images/star.png" alt="" style="width:18px;">
						</c:forEach>
					</p>
    				<em style="line-height:28px; margin-left: 10px;">
    					${dto.reviewRegdate }
    				</em>
    			</div>
    			
    				<c:if test="${not empty dto.reviewImage }">
    				<img src="/np/asset/pic/${dto.reviewImage }" alt="" style="width: 100px; height: 100px;"/>
    				</c:if>
    			
    			<p>${dto.reviewContent }</p> 
    		</div>
			</c:forEach>
    		
    	</div>
    	
    	
    	
	</section>
	
    <%@ include file="/WEB-INF/inc/footer.jsp" %>

	<%@ include file="/WEB-INF/inc/asset2.jsp" %>
	
	<script>
	$(document).ready(function() {
		$(".cart").click(function() {
			var data = '<c:out value="${memberSeq}"/>';
			if (data == "") {
				alert("로그인 후 이용 가능합니다");
			} else {
				$("#memberSeq").val(data);
				memCart.submit();
			}
		});
	});
	
	//수량 스크립트
	Number.prototype.format = function(){
		  if(this==0) return 0;

		  var reg = /(^[+-]?\d+)(\d{3})/;
		  var n = (this + '');

		  while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2' + '원');

		  return n;
		};
		 

		String.prototype.format = function(){
		  var num = parseFloat(this);
		  if( isNaN(num) ) return "0";

		  return num.format();
		};
		    
		var basic_amount = parseInt(${dto1.productPrice});

		function change_qty2(t){
		  var min_qty = 1;
		  var this_qty = $("#ct_qty").val()*1;
		  var max_qty = '30'; 
		  if(t=="m"){
		    this_qty -= 1;
		    if(this_qty<min_qty){
		      alert("수량은 1개 이상 입력해 주십시오.");
		      return;
		      }
		    }
		    else if(t=="p"){
		      this_qty += 1;
		      if(this_qty>max_qty){
		        alert("1회 구매 시 최대 30개 구매하실 수 있습니다.");
		        return;
		        }
		    }

		  var show_total_amount = basic_amount * this_qty;
		  $("#ct_qty").val(this_qty);
		  $("#it_pay").val(show_total_amount);
		  $("#total_amount").html(show_total_amount.format());
		}
	
	


	
	
	
	
// 	차트
	<c:if test="${clist.size() > 0}">
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic);

	function drawBasic() {
		
	      var data = google.visualization.arrayToDataTable([
	          ['후기', '', { role: 'style' }],
	          
	          <c:forEach items="${clist}" var="cdto">
	          ['${cdto.reviewScore}점', ${cdto.cnt}, '#82AE46'], 
	          //몇점인지, 각 점수의 개수
	          </c:forEach>
	          
	       ]);
	      var options = {
	        chartArea: {width: '70%', height: '100%'},
	        hAxis: {	
	          minValue: 0
	        },
	        vAxis: {
		      minValue: 0
	        }
	      };
	      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
	      chart.draw(data, options);
	    }
	</c:if>
	
	</script>
    
  </body>
</html>