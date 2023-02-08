<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "com.test.member.memberDTO, com.test.member.memberDAO, java.util.* "%>
<%
	String memberSeq = (String)session.getAttribute("memberSeq");
	memberDAO dao = new memberDAO();
	memberDTO dto = dao.memInfo(memberSeq);
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>뉴핏</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
     <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <%@ include file="/WEB-INF/inc/asset.jsp" %>
  </head>
  <script>
  	$(document).ready(function() {
  		$("input[name='gender']").attr("disabled",true);
  		
  		
  		$("#signUp_pwCheck").blur(function() { /* 비밀번호 확인 체크 */
			if ($("#signUp_pw").val() != $("#signUp_pwCheck").val() ) { //비밀번호와 비밀번호 확인이 같지 않으면~
				$(".signUp_pwCheck_comment").text("비밀번호가 동일하지 않습니다.").css("color","red");
				$("#signUp_pwCheck").val("").focus();
			} else { //비밀번호와 비밀번호 확인이 같으면~
				$(".signUp_pwCheck_comment").text("비밀번호가 동일합니다.").css("color","blue");
			}
		});
  		
  		$(".signUp_box_button").click(function() { /* 유효성 체크 */
  			
  			if ($("#signUp_tel").val() == "") {
  				alert("휴대폰 번호를 입력해주세요");
  				$("#signUp_tel").focus();
  			
  			} else if ($("#signUp_pw").val() == "") {
  				alert("비밀번호를 입력해주세요");
  				$("#signUp_pw").focus();
  				
  			} else if ($("#signUp_pwCheck").val() == "") {
  				alert("비밀번호 확인을 입력해주세요");
  				$("#signUp_pwCheck").focus();
  				
  			} else if ($("#signUp_email").val() == "") {
  				alert("이메일 주소를 입력해주세요");
  				$("#signUp_eamil").focus();
  				
  			} else if ($("#signUp_addr1").val() == "") {
  				alert("주소를 입력해주세요");
  				$("#signUp_addr1").focus();
  				
  			} else if ($("#signUp_addr2").val() == "") {
  				alert("상세 주소를 입력해주세요");
  				$("#signUp_addr2").focus();					
  			
  			} else {
  				infoEdit.submit();				
  			}
  		});
  		
  		
  	});
  	
  	
	function addr() { /* 주소 API */
		daum.postcode.load(function() {
			new daum.Postcode({
				oncomplete:function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	                var zonecode = data.zonecode;

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    /* document.getElementById("sample6_extraAddress").value = extraAddr; */
	                
	                } else {
	                   /*  document.getElementById("sample6_extraAddress").value = ''; */
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                /* document.getElementById('sample6_postcode').value = data.zonecode; */
	                document.getElementById("signUp_addr1").value = addr;
	                document.getElementById("signUp_addr0").value = zonecode;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("signUp_addr2").focus();
				}
			}).open();
		});	
	}
  </script>
  <body class="goto-here">
  
     
    <%@ include file="/WEB-INF/inc/header.jsp" %>
     

    <section id="signUp_section">
    <div class="container signUp_container">
    	<form name="infoEdit" action="memInfoProcess.do"method="post">
        <div class="signUp_box">
            <p>회원정보 수정</p>
            <div class="signUp_box_content">
           <p>이름</p>
           <input type="text" value="<%= dto.getName() %>" disabled>
           <p>연락처</p>
           <input type="text" name="tel" value="<%= dto.getTel() %>" id="signUp_tel">
           <p>성별</p>
           <input type="radio"  name="gender" value="m" class="signUp_gender_RadioBtn" <%=(dto.getGender().equals("m"))?"checked":""%>>
            <span class="radioBtn_gender">남성</span>
            <input type="radio"  name="gender" value="f" class="signUp_gender_RadioBtn" <%=(dto.getGender().equals("f"))?"checked":""%>>
            <span class="radioBtn_gender">여성</span>
            <p>주민번호</p>
           <input type="text" value="<%= dto.getJumin() %>"disabled>
            <p>아이디</p>
           <input type="text" value="<%= dto.getId() %>"disabled>
            <p>비밀번호</p>
           <input type="password" placeholder="비밀번호를 입력해 주세요." name="pw" id="signUp_pw">
           <p>비밀번호 확인</p>
           <input type="password" placeholder="비밀번호를 다시 입력해 주세요." id="signUp_pwCheck"><br>
           <span class="signUp_pwCheck_comment">비밀번호를 입력해주세요.</span>
           <p>이메일</p>
           <input type="text" placeholder="<%= dto.getEmail() %>" name="email" disabled>
           <p>주소</p>
           <input type="text" class="signUp_addressFind_first" onclick="addr()" id="signUp_addr0" readonly name="address1" value="<%=dto.getAddr1() %>">
           <button class="signUp_addressFind" type="button" onclick="addr()">우편번호</button><br>
           <input type="text" class="signUp_addressFind_second" onclick="addr()" name="address2" value="<%=dto.getAddr2() %>" id="signUp_addr1"><br>
           <input type="text" name = "address3" value="<%= dto.getAddr3() %>" id="signUp_addr2"><br>
           <input type="hidden" value="<%= memberSeq %>" name ="memberSeq">
           <div class="signUp_box_button_box"> 
           <button class="signUp_box_button" type="button">수정하기</button>
        </div>
           
        </div>
        </form>
        </div>
       

	</section>

    
    <%@ include file="/WEB-INF/inc/footer.jsp" %>

   <%@ include file="/WEB-INF/inc/asset2.jsp" %>
    
  </body>
</html>