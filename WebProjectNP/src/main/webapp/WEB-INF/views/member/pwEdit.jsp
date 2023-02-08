<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String memberSeq = request.getParameter("memberSeq");
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>뉴핏</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%@ include file="/WEB-INF/inc/asset.jsp" %>
  </head>
  <body class="goto-here">
  
     
    <%@ include file="/WEB-INF/inc/header.jsp" %>
      

    <section id="signUp_section">
    <div class="container signUp_container">
    <form name=editPw action="pwEditProcess.do" method="post">
        <div class="signUp_box findID_box">
            <p>비밀번호 재설정</p>
            <div class="signUp_box_content findPW_box_content">
           <p>새로운 비밀번호</p>
           <input type="password" placeholder="새로운 비밀번호를 입력해 주세요." name="pw" id="signUp_pw">
           <p>새로운 비밀번호 확인</p>
           <input type="password" placeholder="새로운 비밀번호를 다시 입력해 주세요." id="signUp_pwCheck"><br>
           <span class="signUp_pwCheck_comment">비밀번호를 입력해주세요.</span>
           <input type="hidden" value="<%= memberSeq %>" name ="memberSeq">
           <div class="find_button_box">
           <button class="find_button find_button_cancle">취소</button>
           <button class="find_button find_button_go">확인</button>
           </div>
        </div>
           
        </div>
        </form>
        </div>

	</section>
	
	<script>/* 비밀번호 - 비밀번호 확인 체크 */
	$("#signUp_pwCheck").blur(function() {
		if ($("#signUp_pw").val() != $("#signUp_pwCheck").val() ) { //비밀번호와 비밀번호 확인이 같지 않으면~
			$(".signUp_pwCheck_comment").text("비밀번호가 동일하지 않습니다.").css("color","red");
			$("#signUp_pwCheck").val("").focus();
		} else { //비밀번호와 비밀번호 확인이 같으면~
			$(".signUp_pwCheck_comment").text("비밀번호가 동일합니다.").css("color","blue");
		}
	});
	
	
	</script>

    
    <%@ include file="/WEB-INF/inc/footer.jsp" %>

   <%@ include file="/WEB-INF/inc/asset2.jsp" %>
    
  </body>
</html>