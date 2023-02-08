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
</style>
</head>
<body class="goto-here">


	<%@ include file="/WEB-INF/inc/header.jsp"%>
	<div class="container">
	
	
	<c:forEach items="${member }" var="member">
	<form method="POST" action="/np/admin/memEdit.do?seq=${member.memberSeq }">
	<h4 class="memViewDetailId">${member.id }님의 정보</h4>
	
	<table id="memViewDetailtbl">
		<tr>
			<th>이름</th>
			<td><input type="hidden" name="name" value="${member.name}">
			${member.name }</td>
			<th>아이디</th>
			<td><input type="hidden" name="id" value="${member.id}">
			${member.id }</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="hidden" name="pw" value="${member.pw}">
			${member.pw }</td>
			<th>이메일</th>
			<td><input type="hidden" name="email" value="${member.email}">
			${member.email }</td>
		</tr>
		<tr>
			<th>주민번호</th>
			<td><input type="hidden" name="jumin" value="${member.jumin}">
			${member.jumin }</td>
			<th>성별</th>
			<td><input type="hidden" name="gender" value="${member.gender}">
			${member.gender == 'f' ? "여자" : "남자" }</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="hidden" name="tel" value="${member.tel}">
			${member.tel }</td>
			<th>포인트</th>
			<td><input type="hidden" name="point" value="${member.point}">
			${member.point }</td>
		</tr>
		<tr>
			<th>등급</th>
			<td><input type="hidden" name="lvName" value="${member.lvName}">
			${member.lvName }
			<input type="hidden" name="lvSeq" value="${member.memberLvSeq }">
			</td>
			<th>주소</th>
			<td><input type="hidden" name="address" value="${member.address}">
			${member.address }</td>
		</tr>
	</table>
	

	<div class="memVeiwDetailbtns">
		<button type="button" onclick="this.form.submit();"
			class="btn btn-primary admin-btn">수정하기</button>
		<button type="button" onclick="delCheck();"
			class="btn btn-primary admin-btn">탈퇴시키기</button>
	</div>
	</form>
	</c:forEach>
	</div>
	
	<script>
	
		function delCheck(){
			
			if(confirm('탈퇴시키겠습니까?')){
				location.href = '/np/admin/memDelOk.do?seq=' + ${seq};
			}
		}
	</script>
	

	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<%@ include file="/WEB-INF/inc/asset2.jsp"%>
	
	
</body>
</html>