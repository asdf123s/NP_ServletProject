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

		<form method="POST" action="/np/admin/prdAddOk.do" id="form" enctype="multipart/form-data">
			<h4 class="memViewDetailId">상품 등록</h4>
			<table id="memViewDetailtbl">

				<tr>
					<th>상품이름</th>
					<td><input type="text" name="name"></td>
					<th>수량</th>
					<td><input type="number" name="inventory" style="width: 20%;"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="price"></td>
					<th>카테고리</th>
					<td><select name="category">
							<option value=“1”>여성건강</option>
							<option value=“2”>관절/뼈</option>
							<option value=“3”>구강관리</option>
							<option value=“4”>다이어트</option>
							<option value=“5”>마음건강</option>
							<option value=“6”>피부</option>
							<option value=“7”>노화</option>
							<option value=“8”>피로</option>
							<option value=“9”>간 건강</option>
							<option value=“10”>장 건강</option>
							<option value=“11”>남성 건강</option>
							<option value=“12”>위/소화</option>
							<option value=“13”>변비</option>
							<option value=“14”>눈건강</option>
							<option value=“15”>면역력</option>
							<option value=“16”>임신</option>
							<option value=“17”>모발/두피</option>
							<option value=“18”>유아/소아</option>
							<option value=“19”>효소</option>
							<option value=“20”>젤리</option>
							<option value=“21”>음료</option>
							<option value=“22”>오일</option>
							<option value=“23”>쉐이크</option>
							<option value="24">구강케어</option>
							<option value=“25”>바디케어</option>
							<option value=“26”>헤어케어</option>
							<option value=“27”>여성용품</option>
							<option value=“28”>남성용품</option>
							<option value=“29”>마스크팩</option>
							<option value=“30”>손소독제</option>
					</select></td>
				</tr>
				<tr>
					<th>상품이미지</th>
					<td><input type="file" name="prdImg"></td>
					<th>상품상세이미지</th>
					<td><input type="file" name="prdDetailImg"></td>
				</tr>

			</table>

			<div class="memVeiwDetailbtns">
				<button type="button" onclick="check();"
					class="btn btn-primary admin-btn">등록하기</button>
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
			if (confirm('등록하시겠습니까?')) {
				document.getElementById('form').submit();
			}
		}
	</script>

</body>
</html>