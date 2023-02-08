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
    <style>
    	.paytitle {
    		font-size:30px;
   			font-weight: 1000;
    		margin: 5px 0px 5px 30px;
    	}
    	
    	.radiocover {
    		display: grid;
  			place-items: center;
  			margin: 80px;
  			padding: 40px;
    		border: 4px solid #82ae46;
    		border-radius: 0.6em;
    		font-size: 18px;
    		flex-direction: column;
    	}
    	
    	#card, #account, #phone, #kapay {
    		margin-left: 20px;
    	}
    	
    	#one, #two, #three, #four {
    		margin-top: 50px;
    	}
    	
    	#paydo {
    		width: 200px;
    		height: 50px;
    		border-radius: 0.6em;
    		border: 0px;
    		margin: 50px 0px 0px 0px;
    		transition: box-shadow 300ms ease-in-out, color 300ms ease-in-out;
    		color: white;
    		background-color: #495057;
    		cursor: pointer;
    	}
    	
    	#paydo:hover, #paydo:focus {
    		background-color: #82ae46;
    		border: 0px;
		}
    </style>
  </head>
  <body class="goto-here">
  
     
    <%@ include file="/WEB-INF/inc/header.jsp" %>

    <section id="hi">
    	
    	<div class="container">
    		<div class="paytitle">결제정보 등록</div>
    		
    		<div class="radiocover">
    			<form>
    				<input type="radio" id="card" name="pay" value="1" onchange="checkpay()">&nbsp;카드결제&nbsp;<i class="fa-regular fa-credit-card"></i>				
    				<input type="radio" id="account" name="pay" value="2" onchange="checkpay()">&nbsp;계좌이체&nbsp;<i class="fa-solid fa-file-invoice-dollar"></i>
    				<input type="radio" id="phone" name="pay" value="3" onchange="checkpay()">&nbsp;핸드폰결제&nbsp;<i class="fa-solid fa-mobile-screen-button"></i>   				
    				<input type="radio" id="kapay" name="pay" value="4" onchange="checkpay()">&nbsp;카카오페이&nbsp;<i class="fa-brands fa-kickstarter"></i>
    			</form>

				<div id="paytotaldiv">
					<div id="one" style="display: none">
						<select name="cardpayoption" style= "width:100px; height:30px;">
							<option value="no" selected="selected">카드선택</option>
							<option value="국민">국민</option>
							<option value="비씨">비씨</option>
							<option value="신한">신한</option>
							<option value="현대">현대</option>
							<option value="삼성">삼성</option>
							<option value="롯데">롯데</option>
							<option value="농협">농협</option>
							<option value="하나">하나</option>
							<option value="우리">우리</option>
							<option value="광주">광주</option>
							<option value="시티">시티</option>
							<option value="전북">전북</option>
						</select>
						<select name="paymonth" style= "width:100px; height:30px;">
							<option value="1" selected="selected">일시불</option>
							<option value="2">2개월</option>
							<option value="3">3개월</option>
						</select>
					</div>
					
					
					<div id="two" style="display: none">
						<select name="accountpayoption" style= "width:100px; height:30px;">
							<option value="no" selected="selected">은행선택</option>
							<option value="국민은행">국민은행</option>
							<option value="비씨은행">비씨은행</option>
							<option value="신한은행">신한은행</option>
							<option value="현대은행">현대은행</option>
							<option value="삼성은행">삼성은행</option>
							<option value="롯데은행">롯데은행</option>
							<option value="농협은행">농협은행</option>
							<option value="하나은행">하나은행</option>
							<option value="우리은행">우리은행</option>
							<option value="광주은행">광주은행</option>
							<option value="시티은행">시티은행</option>
							<option value="전북은행">전북은행</option>
						</select>
					</div>
					
					
					<div id="three" style="display: none">
						<select name="phonepayoption" style="width:70px; height:30px;">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						<input type="text" style="width:200px; height:30px;">
					</div>
					
					
					<div id="four" style="display: none">
						<i class="fa-brands fa-kickstarter"></i>카카오페이
					</div>
					
				</div>
				
				<input id="paydo" type="submit" value="결제하기">
				
			</div>
    		
    	</div>
    	

	</section>
	
	<script>
		function checkpay() {
			if ($('input:radio[id=card]').is(':checked')) {
				$('#one').show();
				$('#two').hide();
				$('#three').hide();
				$('#four').hide();	
			} else if ($('input:radio[id=account]').is(':checked')) {
				$('#two').show();
				$('#one').hide();
				$('#three').hide();
				$('#four').hide();
			} else if ($('input:radio[id=phone]').is(':checked')) {
				$('#three').show();
				$('#one').hide();
				$('#two').hide();
				$('#four').hide();
			} else if ($('input:radio[id=kapay]').is(':checked')) {
				$('#four').show();
				$('#one').hide();
				$('#two').hide();
				$('#three').hide();
			} else {
				$('#paytotaldiv').hide();
			}
		}
	</script>

    
    <%@ include file="/WEB-INF/inc/footer.jsp" %>

    <%@ include file="/WEB-INF/inc/asset2.jsp" %>
    
  </body>
</html>