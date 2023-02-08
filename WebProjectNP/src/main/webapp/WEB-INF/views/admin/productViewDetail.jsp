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
<%@ include file="/WEB-INF/inc/asset.jsp"%>
<style>
.btn.btn-primary.admin-btn:first-child {
    border: solid 1px #28a745;
    background-color: transparent;
    color: #28a745;
}
img{
	width:100px;
}
</style>
</head>
<body class="goto-here">


	<%@ include file="/WEB-INF/inc/header.jsp"%>
	<div class="container">

	<c:forEach items="${product }" var="dto">
	<h4 class="memViewDetailId">${dto.productName }</h4>
	<table id="memViewDetailtbl">
		<tr>
			<th>이미지</th>
			<td><img src="/np/asset/images/product_${dto.productSeq }.png"></td>
			<th>상품이름</th>
			<td>${dto.productName }</td>
		</tr>
		<tr>
			<th>번호</th>
			<td>${dto.productSeq }</td>
			<th>카테고리</th>
			<td>${dto.categoryName }</td>
		</tr>
		<tr>
			<th>재고수량</th>
			<td>${dto.productInventory }</td>
			<th>가격</th>
			<td>${dto.productPrice}</td>
		</tr>
		
	</table>
	

	<div class="memVeiwDetailbtns">
		<button type="button" onclick="location.href='/np/admin/prdEdit.do?seq=${dto.productSeq}';"
			class="btn btn-primary admin-btn">수정하기</button>
		<button type="button" onclick="delCheck();"
			class="btn btn-primary admin-btn">삭제하기</button>
	</div>
	
	</div>
	</c:forEach>
	
	<script>
	
		function delCheck(){
			
			if(confirm('이 상품을 삭제하시겠습니까?')){
				location.href = '/np/admin/prdDelOk.do?seq=' + ${seq};
			}
		}
	</script>
	

	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<%@ include file="/WEB-INF/inc/asset2.jsp"%>

</body>
</html>