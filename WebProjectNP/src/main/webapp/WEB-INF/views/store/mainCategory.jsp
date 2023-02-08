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
    </style> 
  </head>
  <body class="goto-here">
  
     
    <%@ include file="/WEB-INF/inc/header.jsp" %>
      

    <section id="hi">
    	
    	<div class="container">
    		
    		<div class="storetitle">스토어</div>
    		<div class="storesubtitle"><c:if test="${not empty sessionMemberName}">${sessionMemberName}님</c:if>&nbsp;찾으시는 카테고리를 선택해주세요.</div>
    		<div class="searchbar">
    			<form method="GET" action="mainCategory.do">		
    				<input name="word" id="searchtext" type="text" placeholder="검색어를 입력하세요.">
    				<input id="searchbtn" type="submit" value="검색">
    			</form>
    		</div>
    	
    		<div class="row justify-content-center">
    			<div class="col-md-10 mb-5 text-center">
    				<ul class="product-category">
    					<li><a href="/np/mainCategory.do" class="active">All</a></li>
    					<li><a href="/np/nutrition.do">영양제</a></li>
    					<li><a href="/np/food.do">식품</a></li>
    					<li><a href="/np/supplies.do">용품</a></li>
    				</ul>
    			</div>
    		</div>
    		
    		<div class="row">
    		
    			<c:forEach items="${productList}" var="dto">
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="product">
    					<a href="/np/store/prdDetail.do?seq=${dto.productSeq}" class="img-prod"><img class="img-fluid" src="asset/images/${dto.productImage}" alt="Colorlib Template">
    						<div class="overlay"></div>
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a href="#">${dto.productName}</a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price"><span>${dto.productPrice}원</span></p>
		    					</div>
	    					</div>
	    					<div class="star">
		    						<p><i class="fa-solid fa-star" style="color:tomato"></i><span>${dto.reviewScore}</span><span id="storecommenticon"><i class="fa-solid fa-comments" style="color:#8FBC8F"></i></span><span>${dto.reviewCount}</span></p>
		    				</div>
    					</div>
    				</div>
    			</div>
    			</c:forEach>
    			
    		</div>

 			<div id="pagebar">
				${pagebar}
			</div>

		</div>

	</section>
	
	
	
	<script>
		
		<c:if test="${map.isSearch == 'y'}">
		$('#word').val('${map.word}');
		</c:if>
		
		function move() {
			location.href= '/np/store/mainCategory.do?page=' + $(event.target).val();	
		}
		
		$('#selpage').val(${nowPage});
		
		<c:if test="${not empty sessionMemberName}">
			session.setAttribute("memberSeq", ${sessionMemberName});
			session.setAttribute("id", ${sessionId});
			session.setAttribute("name", ${sessionName});
		
			response.sendRedirect("prdDetail.do");
		</c:if>
		
	</script>

    
    <%@ include file="/WEB-INF/inc/footer.jsp" %>

    <%@ include file="/WEB-INF/inc/asset2.jsp" %>
    
  </body>
</html>