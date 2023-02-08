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
      

    <section id="signUp_section">
    <div class="container signUp_container">
    <form name=findId action="idFindProcess.do" method="post">
        <div class="signUp_box findID_box">
            <p>아이디 찾기</p>
            <div class="signUp_box_content findID_box_content">
           <p>이름</p>
           <input type="text" placeholder="이름을 입력해 주세요." name="name">
           <p>주민번호</p>
           <input type="text" placeholder="OOOOOO-OOOOOOO 형식으로 입력해 주세요." name="jumin">
           <div class="find_button_box">
           <button type="button" class="find_button find_button_cancle" onclick="location.href='login.do'">취소</button>
           <button class="find_button find_button_go">아이디 찾기</button>
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