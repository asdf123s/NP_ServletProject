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

input:read-only {
	border: none !important;
}

#memViewDetailtbl input {
	border: solid 1px #CCC;
	width: 90%;
	border-radius: 10px;
	padding: 5px;
	margin: 0 auto;
	outline: none;
}

#memViewDetailtbl tr {
	line-height: 20px;
}
</style>
</head>
<body class="goto-here">


	<%@ include file="/WEB-INF/inc/header.jsp"%>
	<div class="container">

		<form method="POST" action="/np/admin/prdEditOk.do" id="form" enctype="multipart/form-data">
			<h4 class="memViewDetailId">상품 등록</h4>
			<table id="memViewDetailtbl">
			<c:forEach items="${product }" var="dto">
			<input type="hidden" name="seq" value="${dto.productSeq }">
				<tr>
					<th>상품이름</th>
					<td><input type="text" name="name" value="${dto.productName }"></td>
					<th>수량</th>
					<td><input type="number" name="inventory" style="width: 20%;" value="${dto.productInventory }"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="price" value="${dto.productPrice }"></td>
					<th>카테고리</th>
					<td><select name="category">
							<option value=“1” <c:if test="${dto.categorySeq == 1}">selected</c:if>>여성건강</option>
							<option value=“2” <c:if test="${dto.categorySeq == 2}">selected</c:if>>관절/뼈</option>
							<option value=“3” <c:if test="${dto.categorySeq == 3}">selected</c:if>>구강관리</option>
							<option value=“4” <c:if test="${dto.categorySeq == 4}">selected</c:if>>다이어트</option>
							<option value=“5” <c:if test="${dto.categorySeq == 5}">selected</c:if>>마음건강</option>
							<option value=“6 <c:if test="${dto.categorySeq == 6}">selected</c:if>”>피부</option>
							<option value=“7” <c:if test="${dto.categorySeq == 7}">selected</c:if>>노화</option>
							<option value=“8” <c:if test="${dto.categorySeq == 8}">selected</c:if>>피로</option>
							<option value=“9” <c:if test="${dto.categorySeq == 9}">selected</c:if>>간 건강</option>
							<option value=“10” <c:if test="${dto.categorySeq == 10}">selected</c:if>>장 건강</option>
							<option value=“11” <c:if test="${dto.categorySeq == 11}">selected</c:if>>남성 건강</option>
							<option value=“12” <c:if test="${dto.categorySeq == 12}">selected</c:if>>위/소화</option>
							<option value=“13” <c:if test="${dto.categorySeq == 13}">selected</c:if>>변비</option>
							<option value=“14” <c:if test="${dto.categorySeq == 14}">selected</c:if>>눈건강</option>
							<option value=“15” <c:if test="${dto.categorySeq == 15}">selected</c:if>>면역력</option>
							<option value=“16” <c:if test="${dto.categorySeq == 16}">selected</c:if>>임신</option>
							<option value=“17” <c:if test="${dto.categorySeq == 17}">selected</c:if>>모발/두피</option>
							<option value=“18” <c:if test="${dto.categorySeq == 18}">selected</c:if>>유아/소아</option>
							<option value=“19” <c:if test="${dto.categorySeq == 19}">selected</c:if>>효소</option>
							<option value=“20” <c:if test="${dto.categorySeq == 20}">selected</c:if>>젤리</option>
							<option value=“21” <c:if test="${dto.categorySeq == 21}">selected</c:if>>음료</option>
							<option value=“22” <c:if test="${dto.categorySeq == 22}">selected</c:if>>오일</option>
							<option value=“23” <c:if test="${dto.categorySeq == 23}">selected</c:if>>쉐이크</option>
							<option value="24" <c:if test="${dto.categorySeq == 24}">selected</c:if>>구강케어</option>
							<option value=“25” <c:if test="${dto.categorySeq == 25}">selected</c:if>>바디케어</option>
							<option value=“26” <c:if test="${dto.categorySeq == 26}">selected</c:if>>헤어케어</option>
							<option value=“27” <c:if test="${dto.categorySeq == 27}">selected</c:if>>여성용품</option>
							<option value=“28” <c:if test="${dto.categorySeq == 28}">selected</c:if>>남성용품</option>
							<option value=“29” <c:if test="${dto.categorySeq == 29}">selected</c:if>>마스크팩</option>
							<option value=“30” <c:if test="${dto.categorySeq == 30}">selected</c:if>>손소독제</option>
					</select></td>
				</tr>
				<tr>
					<th>상품이미지</th>
					<td><input type="file" name="prdImg"></td>
					<th>상품상세이미지</th>
					<td><input type="file" name="prdDetailImg" ></td>
				</tr>
			</c:forEach>
			</table>

			<div class="memVeiwDetailbtns">
				<button type="button" onclick="check();"
					class="btn btn-primary admin-btn">수정하기</button>
				<button type="button"
					onclick="location.href='/np/admin/chart.do?type=product';"
					class="btn btn-primary admin-btn">뒤로가기</button>
			</div>
		</form>
	</div>

	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<%@ include file="/WEB-INF/inc/asset2.jsp"%>

	<script>
		function check() {
			if (confirm('수정하시겠습니까?')) {
				document.getElementById('form').submit();
			}
		}
	</script>

</body>
</html>