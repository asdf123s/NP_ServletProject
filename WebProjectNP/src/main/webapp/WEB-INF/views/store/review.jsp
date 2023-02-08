<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>상품후기 작성</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%@ include file="/WEB-INF/inc/asset.jsp" %>
    <style>
section {
	width: 1140px;
	margin: 0 auto;
	background-color: #FBFBFB;
}

button {
	cursor: pointer;
}

.review {
	width: 770px;
	margin: 0 auto;
}

.review h1 {
	font-weight: bold;
	font-size: 30px;
	padding-top: 50px;
}

#myform fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#myform fieldset legend {
	text-align: right;
}

#myform input[type=radio] {
	display: none;
}

#myform label {
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#myform label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
/* 후기 내용*/
#reviewContent {
	width: 100%;
	height: 300px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 1.5px #D3D3D3;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
}

.file {
	margin: 30px 0;
}

.file p {
	font-size: 20px;
	font-weight: bold;
	color: #474747;
}

.file input {
	width: 100%;
	background-color: white;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 10px;
}

.file #attach {
	background-color: white;
	border: 1.5px solid #ccc;
	border-radius: 10px;
}

.content p {
	font-size: 20px;
	font-weight: bold;
	color: #474747;
}

.content .txt {
	height: 200px;
}

.btns {
	width: 500px;
	margin: 0 auto;
	display: flex;
	padding: 30px 0;
	padding-bottom: 50px;
}

.btns .back {
	width: 220px;
	height: 50px;
	font-weight: bold;
	font-size: 18px;
	color: white;
	border-radius: 100px;
	background-color: #474747;
	border: 0;
	outline: 0;
	box-shadow: 3px 3px 5px #ccc;
}

.btns .add {
	width: 220px;
	height: 50px;
	font-weight: bold;
	font-size: 18px;
	color: white;
	border-radius: 100px;
	background-color: #8BAD55;
	margin-left: 30px;
	border: 0;
	outline: 0;
	box-shadow: 3px 3px 5px #ccc;
}







.wrap{
    max-width: 480px;
    margin: 0 auto; /* 화면 가운데로 */
    background-color: #fff;
    height: 100%;
    padding: 20px;
    box-sizing: border-box;

}
.reviewform textarea{
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
}
.rating .rate_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 60px;
    height: 60px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
}
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('/np/asset/images/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: #ff8;
}

.warning_msg {
    display: none;
    position: relative;
    text-align: center;
    background: #ffffff;
    line-height: 26px;
    width: 100%;
    color: red;
    padding: 10px;
    box-sizing: border-box;
    border: 1px solid #e0e0e0;
}

.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('/np/asset/images/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: #ff8;
}
</style>
  </head>
  <body class="goto-here">
  
  	
    <%@ include file="/WEB-INF/inc/header.jsp" %>
		

    <section>

		<div class="review">
	    	<h1>상품후기 작성💭</h1>
	    	
	    	<hr style="#4A4A4A">

			<form method="POST" action="/np/store/reviewOk.do" class="mb-3" name="myform" id="myform" enctype="multipart/form-data">
			
<!-- 			별부분 -->
				<fieldset>
					<span class="text-bold">별점을 선택해주세요</span> 
					<input type="radio" name="reviewScore" value="5" id="rate1" onclick='getStar(event)'>
					<label for="rate1">★</label>
					<input type="radio" name="reviewScore" value="4" id="rate2" onclick='getStar(event)'>
					<label for="rate2">★</label> 
					<input type="radio" name="reviewScore" value="3" id="rate3" onclick='getStar(event)'>
					<label for="rate3">★</label> 
					<input type="radio" name="reviewScore" value="2" id="rate4" onclick='getStar(event)'>
					<label for="rate4">★</label> 
					<input type="radio" name="reviewScore" value="1" id="rate5" onclick='getStar(event)'>
					<label for="rate5">★</label>
				</fieldset>
					<div id='result'></div>	
				
				<script>
					$('input[name=reviewScore]').val(3);
				</script>
				
				<div class="file">
					<p>사진📷 <span style="font-size: 16px;">(선택)</span></p>
					
					<input type="file" name="attach" id="attach">
				</div>
				
				<div class="content">
					<p>내용</p>
					<textarea class="txt" id="reviewContent" name="reviewContent"
				  placeholder="어떤 점이 좋았나요?"></textarea>
				</div>
				
	
				
			
			
<!-- 			특정상품 번호랑 연결해야함 ${dto1.productSeq}..?-->
			<div class="btns">
				<button type="button" onclick="location.href='/np/store/prdDetail.do?seq=${productSeq}';" class="back">취소</button>
				<button type="submit" class="add">등록하기</button>	
			</div>
			
			<input type="hidden" name="productSeq" value="${productSeq}">
			
		</form>
		</div>
		
	</section>

    
    <%@ include file="/WEB-INF/inc/footer.jsp" %>

	<%@ include file="/WEB-INF/inc/asset2.jsp" %>
	


<script>

</script>

    
  </body>
</html>