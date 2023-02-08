<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import = "com.test.tip.tipDTO, com.test.tip.tipDAO, java.util.* "%>
<%
	tipDAO dao = new tipDAO();
  	
  	ArrayList<tipDTO> list = dao.selectTip();
 %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>뉴핏</title>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <%@ include file="/WEB-INF/inc/asset.jsp" %>
  </head>
  <body class="goto-here">
    <%@ include file="/WEB-INF/inc/header.jsp" %>

    <section id="tip_section">
    <div class="container">
      <p>뉴핏 꿀팁 
      <img src="/np/asset/images/tip_honey_subject_img.png"></p>
     
      <p class="tip_content_description">읽을수록 건강해지는, <br>건강한 사람들의 이야기를 만나보세요.</p>
      <div>
      	
      	<% for (tipDTO dto : list){ %>
      	<div class="tip_content">
        <div class="tip_content_box_img"><img src="/np/asset/images/<%= dto.getTipImg() %>"></div>
        <div class="tip_content_box_contents">
        <p><%= dto.getTipSubject() %></p>
        <p><%= dto.getTipContent() %></p>
        <p class="tip_content_date"><%= dto.getTipRegdate() %></p>
        <a href="tipDetail.do?tipDetailSeq=<%= dto.getTipSeq() %>">더보기</a>
        </div>
      </div>
      <% } %>
      </div>

    </div>







	</section>

    <%@ include file="/WEB-INF/inc/footer.jsp" %> <%@ include
    file="/WEB-INF/inc/asset2.jsp" %>
  </body>
</html>
