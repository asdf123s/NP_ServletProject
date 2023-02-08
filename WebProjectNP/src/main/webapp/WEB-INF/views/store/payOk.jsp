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
    	.ok {
    		width: 1140px;
    		height: 350px;
    		margin: 50px auto;
    	}
    	
    	.ok h1 {
    		font-weight: bold; font-size: 30px; text-align:center; line-height: 200px;
    		mragin-top: 80px;
    	}
    	
    	.ok .btns{
    		display: flex; width: 350px; margin: 0 auto;
    	}
    	button {cursor: pointer;}
    	.ok .btns .main {
    		width: 200px;
    		height: 50px;
    		border-radius: 100px;
    		background-color: #474747;
    		font-size: 18px;
    		font-weight: bold;
    		color: white;
    		outline: 0;
    		border: 0;
    	}
    	.ok .btns .mypage {
    		width: 200px;
    		height: 50px;
    		border-radius: 100px;
    		background-color: #ccc;
    		font-size: 18px;
    		font-weight: bold;
    		color: white;
    		outline: 0;
    		border: 0;
    		margin-left: 30px;
    	}
    	
    	
    	.best{
    		width: 1140px; margin: 0 auto;
    	}
    	
    	.best h1 {font-weight: bold; font-size: 25px; color: #474747; margin-bottom: 30px;}
    	
    	.best .list{display: flex; justify-content: space-between; margin-bottom: 50px;}
    	
    	.list .prd{width: 150px; }
    	.prd > img {width:150px; height: 150px; background: #f2f2f2;}
    	.prd h2 {font-weight: bold; font-size: 18px; color: #828282; margin-top: 10px;}
    	.prd p {font-size: 16px; color: #828282;}
    	
    </style>
  </head>
  <body class="goto-here">
  
  	
    <%@ include file="/WEB-INF/inc/header.jsp" %>
		

    <section>
    
    	<div class="ok">
    		<h1>결제가 완료되었습니다.</h1>
    		
    		<div class="btns">
    			<button type="button" onclick="location.href='/np/index.do';" class="main">메인페이지</button>
    			<button type="button" onclick="location.href='/np/member/mypage.do';" class="mypage">마이페이지</button>
    		</div>
    	</div>
    	
    	
    	
    	<div class="best">
    	
    		<h1>베스트 아이템✨</h1>
    		
    		<div class="list">
    			
    			<div class="prd">
    				<img src="/np/asset/images/product_73.png" alt="" />
    				<h2>배스트상품이름</h2>
    				<p>20,000원</p>
    			</div>
    			
    			<div class="prd">
    				<img src="/np/asset/images/product_73.png" alt="" />
    				<h2>배스트상품이름</h2>
    				<p>20,000원</p>
    			</div>
    			
    			<div class="prd">
    				<img src="/np/asset/images/product_73.png" alt="" />
    				<h2>배스트상품이름</h2>
    				<p>20,000원</p>
    			</div>
    			
    			<div class="prd">
    				<img src="/np/asset/images/product_73.png" alt="" />
    				<h2>배스트상품이름</h2>
    				<p>20,000원</p>
    			</div>
    			
    			<div class="prd">
    				<img src="/np/asset/images/product_73.png" alt="" />
    				<h2>배스트상품이름</h2>
    				<p>20,000원</p>
    			</div>
    			
    			
    			
    		</div>
    		
    	</div>

	</section>

    
    <%@ include file="/WEB-INF/inc/footer.jsp" %>

	<%@ include file="/WEB-INF/inc/asset2.jsp" %>
    
  </body>
</html>