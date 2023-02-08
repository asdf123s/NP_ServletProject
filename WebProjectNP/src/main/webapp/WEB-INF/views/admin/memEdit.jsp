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
	height: 35px;
	border-radius: 10px;
	padding: 5px;
	margin: 0 auto;
	outline: none;
}
</style>
</head>
<body class="goto-here">


	<%@ include file="/WEB-INF/inc/header.jsp"%>
	<div class="container">

		<form method="POST" action="/np/admin/memEditOk.do" id="form">
			<h4 class="memViewDetailId">${mem.id }님의정보</h4>
			<input type="hidden" name="seq" value="${mem.memberSeq }">
			<table id="memViewDetailtbl">

				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="${mem.name}"></td>
					<th>아이디</th>
					<td><input type="text" name="id" value="${mem.id}" readonly></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw" value="${mem.pw}"></td>
					<th>이메일</th>
					<td><input type="text" name="email" value="${mem.email}"></td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="jumin" value="${mem.jumin}"
						readonly></td>
					<th>성별</th>
					<td><select id="lvSelect" name="gender">
							<option value="m"
								<c:if test="${mem.gender eq 'm' }">selected</c:if>>남자</option>
							<option value="f"
								<c:if test="${mem.gender eq 'f' }">selected</c:if>>여자</option>

					</select></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="tel" value="${mem.tel}"></td>
					<th>포인트</th>
					<td><input type="number" name="point" value="${mem.point}"></td>
				</tr>
				<tr>
					<th>등급</th>
					<td><select id="lvSelect" name="lvName">
							<option value="1"
								<c:if test="${mem.memberLvSeq==1 }">selected</c:if>>베이직</option>
							<option value="2"
								<c:if test="${mem.memberLvSeq==2 }">selected</c:if>>실버</option>
							<option value="3"
								<c:if test="${mem.memberLvSeq==3 }">selected</c:if>>골드</option>
							<option value="4"
								<c:if test="${mem.memberLvSeq==4 }">selected</c:if>>VIP</option>
					</select>
					<th>주소</th>
					<td><input type="text" name="address" value="${mem.address}"></td>
				</tr>
			</table>

			<div class="memVeiwDetailbtns">
				<button type="button" onclick="check();"
					class="btn btn-primary admin-btn">수정하기</button>
				<button type="button"
					onclick="location.href='/np/admin/memViewDetail.do?seq=${mem.memberSeq}'"
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