<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      

    <section id="login_section">
    <div class="container login_container">
    <form name="login" action="loginProcess.do"method="post">
        <div class="login_box">
            <p>로그인<span>Login</span></p>
            <div class="login_box_content">
            <input type="text" placeholder="아이디" class="login_box_id" name="id">
            <br>
            <input type="password" placeholder="비밀번호" class="login_box_pw" name="pw">
            <br>
        </div>
        <a href="/np/idFind.do">아이디</a> / <a href="/np/pwFind.do">비밀번호찾기</a>
        
        <div class="login_box_button_box">
            <button class="login_box_loginGo login_box_button" >로그인</button>
            <button type="button" class="login_box_SignUp login_box_button" onclick="location.href='signUp.do'">회원가입</button>
        </div>
        </div>
        </form>

    </div>

	</section>

    
    <%@ include file="/WEB-INF/inc/footer.jsp" %>

   <%@ include file="/WEB-INF/inc/asset2.jsp" %>
    
  </body>
</html>