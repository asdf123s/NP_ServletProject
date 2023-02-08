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

.carth1 {
	margin-top: 100px;
	margin-left: 30px;
	font-size:30px;
}

.cartp {
	margin-left: 30px;
	font-size:18px !important;
	color:gray;
	margin-bottom:30px;
}

.product-remove {
	flex-direction : column;
}

.likeBtn {

    border-radius: 20px;
    border: 1px solid #FFF;
}

#delBtn {
	float: left;
	margin: 15px;
	width: 150px;
	height: 50px;
	background-color: #959595;
	color: #FFF;
	border-radius: 20px;
    border: 1px solid #FFF;
	
}


#choiceBtn, #allBtn{
	float: right;
	margin: 10px;
	margin-top: 15px;
	width: 150px;
	height: 50px;
	background-color: #000;
	color: #FFF;
}

.btnGather {
	margin-bottom: 50px;
}

.cart-list {
	margin-bottom: 50px;
}
.clear{
	clear:both;
}
</style>


<script>
	
	/* 체크박스 입력정보 획득 */
	document.addEventListener("DOMContentLoaded", function(){
		var chBoxs = document.getElementsByClassName('chBox');
		for(i=0; i<chBoxs.length; i++){
			chBoxs[i].onclick = selectItem;
		}
		
		var checkedList = [];
		function selectItem(e) {
			var selectedItem = e.target.value;
			if (e.target.checked) {
				checkedList.push(selectedItem);
			} else {
				checkedList = checkedList.filter(n => n !== selectedItem);
			}
			document.getElementById("checkBoxArr").value = checkedList.join();
		}
	});
	
	
	/* 상품 합계 급액 */
	 function printName() {
		const proCnt = document.getElementById('proCnt').value;
		
		const proPay = document.getElementById('price').innerText;
		
		document.getElementById('result').innerText = proPay * proCnt;
		
		$
	}
 
 
/* 	function printName()  {
	  const name = document.getElementById('name').value;
	  document.getElementById("result").innerText = name;
	}  */
</script>
<body class="goto-here">

	<%@ include file="/WEB-INF/inc/header.jsp"%>

	<div class="container">



	<section class="ftco-section ftco-cart">
		<div class="container">
		
		
	<h1 class="carth1">관심목록♡</h1>
	<p class="cartp">사고싶은 상품을 담아보세요</p>
	

			<div class="row">
				<div class="col-md-12 ftco-animate">
					<div class="cart-list">
						<table class="table">
							<thead class="thead-primary">
								<tr class="text-center">
									<th>
										<div class="allCheck">
  											<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck"></label> 
 									 	</div></th>
									<th>&nbsp;</th>
									<th>상품이름</th>
									<th>가격</th>
									<th>개수</th>
									<th>결제금액</th>
								</tr>
							</thead>
							<tbody>
								
								<c:forEach var="likeList" items="${likeList}">
								<tr class="text-center">						
									<td class="product-remove">
										 <div class="checkBox">
										 	<form method="POST" action="/member/MemberLikeDel.do">
  												 <input type="checkbox" name="chBox" class="chBox" value="${likeList.productSeq}" />
  											 </form>
  										</div>	
									</td>
										<td class="image-prod"><div class="img"
											style="background-image: url(asset/images/${likeList.productImage});"></div>
											
										</td>
									<td class="product-name">
										<h3>${likeList.productName}</h3>
										<p>카테고리명</p>
									</td>

									<td class="price" id="price">${likeList.productPrice }</td>

									<td class="quantity">
										<div class="input-group mb-3">
											<input type="text" name="quantity" onkeyup='printName()'
												class="quantity form-control input-number" id="proCnt" value="1" min="1"
												max="100"/>
										</div>
									</td>

									<td class="total" id='result'>${likeList.productPrice }</td>
								</tr>
								</c:forEach>
								<!-- END TR-->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<form method="POST" action="/np/member/memLikeDelOk.do"> 
			<div class="btnGather">
				 <input type="hidden" id="checkBoxArr" name="checkBoxArr" value="" />
				<button type="submit" class="selectBelete_btn" class="selectDelete_btn" id="delBtn">
					삭제하기
				</button>
				
				<input type="button" value="선택주문" class="likeBtn" id="choiceBtn">	
				<input type="button" value="총주문" class="likeBtn" id="allBtn">
				<div class="clear"></div>
			</div>
		</form>

	</section>
	
	</div>
	
	
	<!-- <script>
	
	function folderDeleteClick(){
		  var checkBoxArr = []; 
		  $("input:checkbox[name='chBox']:checked").each(function() {
		  checkBoxArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
		  console.log(checkBoxArr);
		})

		  $.ajax({
		      type  : "GET",
		      url    : "/member/memlikeDelOk.do",
		      data: {
		      checkBoxArr : checkBoxArr        // folder seq 값을 가지고 있음.
		      },
		      success: function(result){
		      	console.log(result);
		      },
		      error: function(xhr, status, error) {
		      	alert(error);
		      }  
		   });
		}
	
 	$('input:checkbox[name=chBox]').each(function (index) {
		if($(this).is(":checked")==true){
	    	console.log($(this).val());
	    }
	}
	
	$("#allCheck").click(function(){
		 var chk = $("#allCheck").prop("checked");
		 if(chk) {
		  $(".chBox").prop("checked", true);
		 } else {
		  $(".chBox").prop("checked", false);
		 }
		});
	
	
	 $(".chBox").click(function(){
		  $("#allCheck").prop("checked", false);
		 });
	 
	 
	 $(".selectDelete_btn").click(function(){
		  var confirm_val = confirm("정말 삭제하시겠습니까?");
		  
		  if(confirm_val) {
		   var checkArr = new Array();
		   
		   $("input[class='chBox']:checked").each(function(){
		    checkArr.push($(this).attr("likeList.productSeq"));
		   });
		   
		  } 
		 }); 

	</script> -->


	<%@ include file="/WEB-INF/inc/footer.jsp"%>


	<%@ include file="/WEB-INF/inc/asset2.jsp"%>


</body>
</html>