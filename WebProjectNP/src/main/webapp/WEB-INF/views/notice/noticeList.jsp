<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>공지사항</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%@ include file="/WEB-INF/inc/asset.jsp" %>
    
<!--     <link rel="stylesheet" href="/np/asset/css/noticeList.css" /> -->
    <style>
	
	section{margin: 50px 0;}
	
	#notice {
		margin: 0 auto;
		height: 100%;
		margin-bottom: 100px;
	}
	
	#notice > h1 {font-size: 30px; font-weight: bold; color: #414141;}
	#notice > h3 {font-size: 18px; font-weight: bold; color: #828282;}
	
	#notice > .list {}
	
	#notice > .list > .content {display: flex; margin: 50px 0; margin-bottom: 60px;}
	
	#notice > .list > .content > .img > a > img {
		width: 350px; height: 210px; border-radius: 20px;
		box-shadow: 3px 3px 5px #ccc;
/* 		background-color: gray; */
	}
	
	
	.txt {margin-left: 50px;}
	.txt .subject {margin-top: 40px;}
	.txt .subject > a {font-size: 20px; font-weight: bold; color:#414141;}
	.txt > p {font-size: 15px;}
	
	#notice > div > div > div > p > a {color: #666;}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    </style>
  </head>
  <body class="goto-here">
  
<!--   noticeList -->
  	
    <%@ include file="/WEB-INF/inc/header.jsp" %>
		

    <section>
    	
    	<div id="notice" class="container">
    		
    		<h1>공지사항</h1>
    		<h3>뉴핏 이야기</h3>
    		
    		<div class="list">
    			
    			<c:forEach items="${list}" var="dto">
    			<div class="content">
    				<div class="img">
    					<a href="/np/notice/noticeDetail.do?seq=${dto.noticeSeq}">
    						<img src="/np/asset/images/${dto.noticeImg }" alt="" />
    					</a>
    				</div>
    				
    				
    				<div class="txt">
    					<div class="subject">
    						<a href="/np/notice/noticeDetail.do?seq=${dto.noticeSeq}">
    							${dto.noticeSubject }
    						</a>
    					</div>
    					<p>
    						<a href="/np/notice/noticeDetail.do?seq=${dto.noticeSeq}">
    							${dto.noticeContent }
    						</a>
    					</p>
    					<p>${dto.noticeRegdate }</p>
    				</div>
    			</div>
    			</c:forEach>
    			
    		</div>
    		
    	</div>

	</section>
	
	



    
    <%@ include file="/WEB-INF/inc/footer.jsp" %>

	<%@ include file="/WEB-INF/inc/asset2.jsp" %>
    
  </body>
</html>