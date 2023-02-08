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
    
    <style>
    	section{margin: 50px 0;}
	
		#notice {
			margin: 0 auto;
			height: 100%;
	/* 		background-color: tomato; */
		}
		
		#notice > h1 {font-size: 30px; font-weight: bold; color: #414141;}
		#notice > h3 {font-size: 18px; font-weight: bold; color: #828282;}
		
		
		#tblnotice{
			text-align: center; width: 100%;
			margin-top: 30px;
			border-bottom: 1px solid gray;
		}
		
		#tblnotice tr th {
			margin-top: 30px;
			border-top: 2px solid darkgray; 
			border-bottom: 1px solid gray;
			font-size: 25px;	
			padding: 10px 0;
		}
		
		#tblnotice tr th >span{font-size: 15px;}
		
		#tblnotice tr > td {
			font-size: 18px;
			padding-bottom: 30px;
		}
		
		#tblnotice > tbody > tr:nth-child(2) > td > img {
			margin-top: 30px;
		}
		
		.btns{
			width: 150px;
			margin: 0 auto;
			margin-top: 30px;
		}
		
		.btns > button{
			width: 150px;
			margin: 0 auto;
			text-align: center;
			background-color: white;
			border: 1px solid #82AE46;
			color: #82AE46;
			padding: 10px 10px;
		box-shadow: 3px 3px 5px #ccc;
		}
		
		.btns > button:hover{
			background-color: #82AE46;
			color: white;
		}
		
		button{cursor: pointer;}
		
		
		#tblnotice > tbody > tr:nth-child(3) > td {padding: 0 100px 50px 100px;}
		
    </style>
  </head>
  <body class="goto-here">
  	
<!--   	noticeDetail.jsp -->
  	
    <%@ include file="/WEB-INF/inc/header.jsp" %>
		

    <section>
		<div id="notice" class="container">
    		
    		<h1>공지사항</h1>
    		<h3>뉴핏 이야기</h3>
    		
    		
    		<table id="tblnotice">
    			<tr>
    				<th>
    					${dto.noticeSubject }
    					<br>
    					<span>${dto.noticeRegdate }</span>
    				</th>
    			</tr>
    			<tr>
    				<td>
    					<img src="/np/asset/images/${dto.noticeImg }" alt="" />
    				</td>
				</tr>
    			<tr>
    				<td>${dto.noticeContent}</td>
				</tr>
    		</table>
    		
    		<div class="btns">
    			<button type="button" onclick="location.href='/np/notice/noticeList.do';">
    				목록
    			</button>
    		</div>
    		
    	</div>
	</section>

    
    <%@ include file="/WEB-INF/inc/footer.jsp" %>

	<%@ include file="/WEB-INF/inc/asset2.jsp" %>
    
  </body>
</html>