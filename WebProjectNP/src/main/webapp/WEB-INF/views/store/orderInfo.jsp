<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴핏</title>
<%@ include file="/WEB-INF/inc/asset.jsp"%>
<!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
input[type="checkbox"]{
        display: none;
      } 
input[type="checkbox"] + label{
        display: inline-block;
        width: 15px;
        height: 15px;
        border:1px solid #707070;
        border-radius:50%;
        position: relative;
        margin-right:10px;
      }
.order-same-info label{
	display:flex;
	margin-bottom:0;
	justify-content: center;
    align-items: center;
}
input[id="same-cb"]:checked + label::after{
        content:'●';
        font-size: 10px;
		width: 15px;
        text-align: center;
        position: absolute;
        left:-1px;
        top:-2.5px;
        color:#28a745;
      }
#same-cb{
	width:100px;
}

</style>
</head>
<body class="goto-here">
<%@ include file="/WEB-INF/inc/header.jsp" %>

	<div class="container">

		<div class="recommend-top">
			<h1>주문서 작성</h1>
		</div>
		<div class="order-container">
			<div class="order-title">제품정보</div>
			<c:if test="${flag eq 'one' }">
			<div class="order-product">
				<div class="search-item recommend-result-items order-item">
					<div class="search-item-img">
						<img src="/np/asset/images/${dto.productImage }">
					</div>
					<div class="search-item-name">
						<div>${dto.productName }</div>
						<div>
							${dto.memberOrderCount }개 <span><fmt:formatNumber value="${dto.productPrice}" pattern="#,###" />원</span>
						</div>
					</div>

				</div>
			</div>
			<div class="order-total-pay">
				<div class="order-total-pay-txt">
					<div>제품합계금액</div>
					<div><fmt:formatNumber value="${dto.productPrice * dto.memberOrderCount}" pattern="#,###" />원</div>
				</div>
				<div class="order-total-pay-txt">
					<div>배송비</div>
					<div>3,000원</div>
				</div>
				<div class="order-total-pay-txt order-total-result">
					<div>총 결제금액</div>
					<div><fmt:formatNumber value="${dto.productPrice * dto.memberOrderCount + 3000}" pattern="#,###" />원</div>
				</div>
			</div>
			</c:if>
			<c:if test="${flag eq 'two' }">
			<c:forEach items="${list}" var="dto">
			<div class="order-product">
				<div class="search-item recommend-result-items order-item">
					<div class="search-item-img">
						<img src="/np/asset/images/${dto.productImage }">
					</div>
					<div class="search-item-name">
						<div>${dto.productName }</div>
						<div>
							${dto.memberOrderCount }개 <span><fmt:formatNumber value="${dto.productPrice}" pattern="#,###" />원</span>
						</div>
					</div>

				</div>
			</div>
			</c:forEach>
			<div class="order-total-pay">
				<div class="order-total-pay-txt">
					<div>제품합계금액</div>
					<div><fmt:formatNumber value="${allPrice}" pattern="#,###" />원</div>
				</div>
				<div class="order-total-pay-txt">
					<div>배송비</div>
					<div>3,000원</div>
				</div>
				<div class="order-total-pay-txt order-total-result">
					<div>총 결제금액</div>
					<div><fmt:formatNumber value="${allPrice + 3000}" pattern="#,###" />원</div>
				</div>
			</div>
			</c:if>

			


			<div class="order-title">주문자 정보</div>
			<div class="order-wrap">
				<div class="order-person-form">
					<div class="order-person-subform">
						<div class="order-person-title">이름</div>
						<div class="order-person-input">
							<input type="text" placeholder="이름을 입력해 주세요." id="name" name="names" value="${mdto.name }">
						</div>
					</div>
					<div class="order-person-subform">
						<div class="order-person-title">전화번호</div>
						<div class="order-person-input">
							<input type="text" placeholder="전화번호를 입력해 주세요." name="tel" id="tel" value="${mdto.tel }">
						</div>
					</div>
				</div>
			</div>


			<div class="order-title order-right-title">
				배송 정보
				<div class="order-same-info">
					<label><input type="checkbox" id="same-cb" name="check"><label for="same-cb"></label>주문자 정보와 동일</label> 
				</div>
			</div>
			<div class="order-wrap">
				<div class="order-person-form">
					<div class="order-person-subform">
						<div class="order-person-title">수령인 이름</div>
						<div class="order-person-input">
							<input type="text" placeholder="이름을 입력해 주세요." name="names" id="rename">
						</div>
					</div>
					<div class="order-person-subform">
						<div class="order-person-title">수령인 전화번호</div>
						<div class="order-person-input">
							<input type="text" placeholder="전화번호를 입력해 주세요." name="tel" id="retel">
						</div>
					</div>
					<div class="order-person-subform">
						<div class="order-person-title">우편번호</div>
						<div class="order-person-input order-address">
							<input type="text" placeholder="우편번호를 입력해 주세요." id="sample6_postcode" readonly>
							<div class="search-item-btn order-btn">
								<button type="button" onclick="sample6_execDaumPostcode()" style="width:150px;">우편번호 찾기</button>
							</div>
						</div>
					</div>

					<input type="text" id="sample6_extraAddress" placeholder="참고항목" style="display:none;">

					<div class="order-person-subform">
						<div class="order-person-title">도로명 주소</div>
						<div class="order-person-input">
							<input type="text" placeholder="주소를 입력해 주세요." id="sample6_address">
						</div>
					</div>
					<div class="order-person-subform">
						<div class="order-person-title">나머지 주소</div>
						<div class="order-person-input">
							<input type="text" placeholder="나머지 주소를 입력해 주세요." id="sample6_detailAddress" >
						</div>
					</div>
					<div class="order-person-subform">
						<div class="order-person-title">배송 요청사항</div>
						<div class="order-person-input">
							<input type="text" placeholder="요청사항을 입력해 주세요." id="comment">
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" value ="${mdto.addr1 }" class="addr1">
			<input type="hidden" value ="${mdto.addr2 }" class="addr2">
			<input type="hidden" value ="${mdto.addr3 }" class="addr3">


			<!-- <div class="order-title">결제수단</div>
			<div class="order-pay-way">
				<div>
					<label><input type="radio" name="pay" value="card" class="pay">
					신용/체크카드 or 카카오페이</label>
				</div>
				<div>		
					<label><input type="radio" name="pay" value="account" class="pay">
					가상계좌</label>
				</div>
				<div>
					<input type="radio" name="pay" class="pay"> 휴대폰결제
				</div>
			</div> -->

			<div class="search-item-btn order-final-btn">
				<button type="button" class="pay" >결제하기</button>
			</div>
		</div>
	</div>
	

	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<%@ include file="/WEB-INF/inc/asset2.jsp"%>

	<script>
	$(document).ready(function() {
		
		$("#same-cb").click(function() {
			
			$("#rname").val($("#ename").val());
			$("#retel").val($("#tel").val());
			$("#sample6_postcode").val($(".addr1").val());
			$("#sample6_address").val($(".addr2").val());
			$("#sample6_detailAddress").val($(".addr3").val());
		});
		
		$(".pay").click(function(){
			location.href = "orderInfoProcess.do?productSeq=${productSeq}&comment="+$("#comment").val(); 	     
		});
	});
		var IMP = window.IMP; // 생략가능
    	IMP.init("imp54826391");
		var frm = document.form;
		
		var check = document.all.check;
		var names = document.all.names;
		var tel = document.all.tel;
		
		
		/* function checked() {
			var name = $('#name').val();
			var rename = $('#rename').val();
			var tel = $('#tel').val();
			var retel = $('#retel').val();
			var address = $('#sample6_postcode').val();
			var deaddress = $('#sample6_detailAddress').val();
			
			var num = 0;
			
			if(name.length === 0){
				alert("이름을 입력해주세요.");
			}else{
				num+=1;
			}
			if(rename.length === 0){
				alert("수령자 이름을 입력해주세요.");
			}else{
				num+=1;
			}
			if(retel.length === 0){
				alert("수령자 전화번호를 입력해주세요.");
			}else{
				num+=1;
			}
			if(tel.length === 0){
				alert("전화번호를 입력해주세요.");
			}else{
				num+=1;
			}
			if(address.length === 0){
				alert("주소를 입력해주세요.");
			}else{
				num+=1;
			}
			if(deaddress.length === 0){
				alert("상세주소를 입력해주세요.");
			}else{
				num+=1;
			}
			
			
			if(num === 6){
				requestPay();
			}
		} */

		function requestPay() {
			
			const pay = $(".pay");

			if (pay[0].checked) {
				IMP.request_pay({
					pg : "html5_inicis",
					pay_method : "card",
					merchant_uid : "ord" + new Date().getTime(),
					name : "벌이", //상품명
					amount : 1, //총가격
					buyer_email : "yang@naver.com",
					buyer_name : "하니>",
					buyer_tel : "010-2222-3333",
					buyer_addr : "서울시 강남",
					buyer_postcode : "123-2"
				}, function(rsp) {
					if (rsp.success) {
						var msg = '결제가 완료되었습니다.';
						frm.submit();
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
					}
					alert(msg);
				});

			} else if (pay[1].checked) {
				alert("account");
			}else{
				alert("결제수단을 선택해주세요.");
			}

		}
		
	
		
		
		check.onchange = function(){
			if(check.checked == true){
                names[1].value = names[0].value;
                tel[1].value = tel[0].value;
            }else{
                names[1].value = "";
                tel[1].value = "";
            }
		}
		
		
		
		function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
		
		
	</script>

</body>
</html>