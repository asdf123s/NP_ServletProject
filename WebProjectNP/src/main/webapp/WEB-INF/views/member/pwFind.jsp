<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>뉴핏</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <%@ include file="/WEB-INF/inc/asset.jsp" %>
    <script>
    $(document).ready(function() {
			
		/* 이메일 인증 */
		var number = Math.floor(Math.random() * 100000) + 100000;
        if(number>100000){ number = number - 10000; }
        $("#text").val(number);      /* 난수로 생성된 인증번호를 hidden name : text 에 숨긴다 */  
        
        $(".signUp_email_authentication").click(function() {
			if ($("#signUp_email").val() == "") {
				alert("이메일을 입력해주세요");
				$("#signUp_email").focus();			
			} else {				
 		       		var con_test = confirm("해당 이메일로 인증번호를 발송하시겠습니까?");        
 		          	if(con_test == true){   
 		               $.ajax({
 		                   url:"sendEmail",
 		                   type:"post",
 		                   data: {
 		                	 	email: $("#signUp_email").val(),
 		                        text: $("#text").val()
 		                   }, 
 		                 success:function(){
 		                   alert("해당 이메일로 인증번호를 발송했습니다");
 		                   $("#signUp_certified").focus();
 		                 },                   
 		                }); 
 		          	}
		       		 		       		
               }
		});
        
        $(".signUp_box_emailCheck_button").click(function() {
			if ($("#signUp_certified").val() == "") {
				alert("인증번호를 입력해주세요");
				$("#signUp_certified").focus();
			} else if ($("#text").val() != $("#signUp_certified").val()) {
				alert("인증번호가 일치하지 않습니다");
				$("#signUp_certified").val("").focus();
			} else {
				alert("인증번호가 일치합니다");
			}
		});
		
	});
	
 </script>
  </head>
  <body class="goto-here">
  
     
    <%@ include file="/WEB-INF/inc/header.jsp" %>
      

    <section id="signUp_section">
    <div class="container signUp_container">
     <form name=findPw action="pwFindProcess.do" method="post">
        <div class="signUp_box findPW_box">
            <p>비밀번호 찾기</p>
            <div class="signUp_box_content findPW_box_content">
           <p>아이디</p>
           <input type="text" placeholder="아이디를 입력해 주세요." name="id">
           <p>주민번호</p>
           <input type="text" placeholder="OOOOOO-OOOOOOO 형식으로 입력해 주세요." name="jumin">
           <p>이메일</p>
           <input type="text" placeholder="이메일을 (@naver.com) 형식으로 입력해 주세요." name="email" id="signUp_email" >
           <button type="button" class="signUp_email_authentication" id="signUp_email_authentication">인증번호받기</button>
           <p>인증번호확인</p>
           <input type="text" placeholder="인증번호를 입력해 주세요." id="signUp_certified">
            <button class="signUp_box_emailCheck_button findPw_email_button" type="button">인증번호확인</button>
           <div class="find_button_box">
           <button type="button" class="find_button find_button_cancle" onclick="history.back();">취소</button>
           <button class="find_button find_button_go">비밀번호 찾기</button>
            <input type="hidden" id="text">
           </div>
        </div>
           
        </div>
        </form>
        </div>


	</section>

    
    <%@ include file="/WEB-INF/inc/footer.jsp" %>

   <%@ include file="/WEB-INF/inc/asset2.jsp" %>
    
  </body>
</html>