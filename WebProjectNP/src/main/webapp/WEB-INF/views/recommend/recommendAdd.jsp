<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>뉴핏</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@ include file="/WEB-INF/inc/asset.jsp"%>
<style>
.Modal {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: rgba(0, 0, 0, 0);
	visibility: hidden;
}

.content {
	position: absolute;
	left: 50%;
	top: 30%;
	width: 50%;
	padding: 50px;
	border-radius: 10px;
	background: #fff;
	transform: translate(-50%, -30%) scale(0);
	transition: transform 0.35s;
}

.close {
	position: absolute;
	top: 15px;
	right: 15px;
	display: block;
	width: 30px;
	height: 30px;
	line-height: 24px;
	border-radius: 50%;
	text-align: center;
	cursor: pointer;
	background-color: transparent;
	border: solid 2px #28a745;
	color: #28a745;
	font-weight: bold;
	text-size: 23px;
}

.close:hover {
	color: #fff;
	background-color: #28a745;
}

.is-visible {
	visibility: visible;
	background: rgba(0, 0, 0, 0.2);
	transition: background .35s;
	z-index: 5;
	position: fixed;
	transition-delay: .1s;
	height: 100%;
	overflow: hidden;
	//
	just
	delay
	enough
	to
	make
	modal
	visible
	before
	transitiong
	bg
}

.is-content {
	transform: translate(-50%, -30%) scale(1);
	transition: transform 0.35s;
}

/***********************\
		
			Pen Specific Styles 
		
		\***********************/

/* body {
		  background: #FBFAF5;
		} */
.form-control {
	margin-right: 10px;
}

.subscribe-form {
	margin-top: 20px;
	margin-bottom: 20px;
}

.search-text {
	text-align: center;
	display: block;
	margin-top: 30px;
	margin-bottom: 30px;
}

.search-none {
	margin-top: 100px;
	margin-bottom: 110px;
}

.search-item {
	margin-bottom: 20px;
}

.search-item-list {
	max-height: 350px;
	height: auto;
	overflow: scroll;
	padding-top:20px;
}
.search-add-items{
	width:70%;
}
</style>

</head>
<body class="goto-here">


	<%@ include file="/WEB-INF/inc/header.jsp"%>


	<div class="container">
		<div class="recommend-top">
			<h1>분석/추천</h1>
			<h3>현재 먹고있는 약에 각 성분의 용량이 하루 평균 용량에 맞게 섭취하고 있는지 체크해보세요.</h3>

			<div class="recommend-add-btn">
				<a href="javascript:nutritionalAdd();"> <input type="button"
					value="+" style="cursor: pointer;"> <span>등록하기</span>
				</a>
			</div>
			<div class="clear"></div>
		</div>

		<form name="form" action="/np/recommend/recommendChart.do" method="POST">
			<div class="recommend-body">
				<!-- 등록한 영양제가 없을 떄 -->
				<div class="recommend-add-none">
					<i class="fa-sharp fa-solid fa-capsules"></i> 현재 복용 중인 영양제를 등록해보세요.
				</div>
	
				<!-- 영양제를 등록 했을 때 -->
				
				<div class="search-added-list">
					
				</div>
				
	
			</div>
	
			<button type="button" onclick="recommendFinalCheck()"
				class="btn btn-primary recommend-btn">분석해보기</button>
		</form>

		<!-- 복용 중인 영양제 등록하기 -->
		<div id="Popup" class="Modal">
			<div class="content">
				<form action="#" class="subscribe-form">
					<div class="form-group d-flex">
						<input type="text" id="search-form" class="form-control"
							placeholder="검색어를 입력해주세요." style="border: solid 1px gray;">
						<input type="button" value=" 검색 " class="submit px-3"
							onclick="searchAddBtn();">
					</div>
				</form>
				<div class="search-none">
					<p class="search-text search-none-text">검색결과가 없습니다.</p>
				</div>

				<div class="search-ok">
					<div class="search-ok-text"></div>
					<div class="search-item-list"></div>
				</div>
				<span class="close">x</span>
			</div>
		</div>
	</div>



	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<%@ include file="/WEB-INF/inc/asset2.jsp"%>


	<script>
	
	var list = [];
    
	    function nutritionalAdd(){

	    	$(".Modal").addClass("is-visible");
	    	$(".content").addClass("is-content");
	    	$(".search-item-list").hide();
	    }
    	
    	$(".close").click(()=>{	  
    	  $(".content").removeClass("is-content");
    	  $('#search-form').val("");
    	  $('.search-none').show();
    	  $('.search-text').html('');
    	  $('.search-none').append('<p class="search-text search-none-text">검색결과가 없습니다.</p>');
    	 
    	  setTimeout(function(){
    		  $(".Modal").removeClass("is-visible");
    		},300);
    	  
    	});
    	
    	
    	function search(){
			let word = $('#search-form').val();
    		
    		if(word.trim().length > 0){
    			let regex = /^[A-Za-z0-9\s가-힣]{1,}$/gi;
    			
    			if(regex.test(word)){
    				
    				$.ajax({
    					type:'GET',
    					url:'/np/recommend/recommendSearch.do',
    					data:'word=' + word,
    					dataType:'json',
    					success:function(result){
    							
    							if(result[0]==null){
    								$('.search-none').show();
    								$('.search-item-list').hide();
    								$('.search-ok-text').html('');
    								$('.search-none').html('');
    								$('.search-none').append(`<p class="search-text search-none-text">\'`+word+`\'에 대한 검색결과가 없습니다.</p>`);
    							}else{
    							
	    						$('.search-none').hide();
	    						$('.search-item-list').html('');
	    						$(".search-item-list").show();
	    						$('.search-ok-text').html('');
	    						$('.search-ok-text').append(`<p class="search-text">\'`+word+`\'에 대해 총 \${result[0].productCount}개의 검색결과가 나왔습니다.</p>`);
	    						$('')
	    						result.forEach((item, index)=>{
	    							$('.search-item-list').append(`
	    									
	    									<div class="search-item">
	    						            <div class="search-item-img">
	    						                <img src="/np/asset/images/\${item.productImage}">
	    						            </div>
	    						            <div class="search-item-name">
	    						                <div>뉴핏</div>
	    						                <div>\${item.productName}</div>
	    						            </div>
	    						            <div class="search-item-btn">
	    						                <button type="button" onclick="itemAddBtn(\${item.productSeq});">+ 등록하기</button>
	    						            </div>
	    						        </div>
	    									
	    									`);
	    						});
	    						
    							}
    						
    					},
    					error:function(a,b,c){
    						console.log(a,b,c);
    					}
    				});
    				
    			}else{
        			$('.search-none').show();
    				$('.search-item-list').hide();
    				$('.search-ok-text').html('');
        		}
        		
    		}else{
    			$('.search-none').show();
				$('.search-item-list').hide();
				$('.search-ok-text').html('');
    		}
    	}
    	
    	
    	$('#search-form').keyup(function(){
			
    		search();
    		
    	});
    	
    	
    	function searchAddBtn(){
    		search();
    	};
    	
    	
    	
    	function itemAddBtn(seq){
    		
    		var check = false;
    		
    		list.forEach((i)=>{
    			if(i == seq){
    				alert('이미 등록된 상품입니다.');
    				check=true;
    			}
    		});
    		
    		if(check == false){
	    		list.push(seq);
	    		console.log(list);
	    		
	    		$.ajax({
	    			type:'GET',
	    			url:'/np/recommend/recommendItemAdd.do',
	    			data: 'seq='+seq,
	    			dataType:'json',
	    			success:function(result){
	    				$('.search-added-list').html("");
	    				result.forEach((item, index)=>{
	    					
	    					$('.search-added-list').append(`
	    							<div class="search-item search-add-items">
	    							<input type="hidden" name="productSeq" value="\${item.productSeq}">
	    							<div class="search-item-img">
	    								<img src="/np/asset/images/\${item.productImage}">
	    							</div>
	    							<div class="search-item-name">
	    								<div>뉴핏</div>
	    								<div>\${item.productName}</div>
	    							</div>
	    							<div class="search-item-btn">
	    								<button type="button" onclick="itemRemoveBtn(\${item.productSeq});">+
	    									삭제하기</button>
	    							</div>
	    						</div>
	    							`)
	    				});
	    				
	    				 $('.search-text').hide();
	    				 $('#search-form').val("");
	    				 $('.search-none').show();
	    		    	 $('.search-none').append('<p class="search-text search-none-text">검색결과가 없습니다.</p>');
	    				
	    				 $(".content").removeClass("is-content");
	    		    	 $(".Modal").removeClass("is-visible");
	    		    	 $('.recommend-add-none').hide();
	    			},
	    			error:function(a,b,c){
	    				console.log(a,b,c);
	    			}
	    		});
    		}
    	};
    	
    	
    	function recommendFinalCheck(){
    		if(list.length==0){
    			alert('현재 복용 중인 영양제를 추가해주세요.');
    			return;
    		}else{
    			document.form.submit();
    		}
    	}
    	
    	
    </script>
</body>
</html>