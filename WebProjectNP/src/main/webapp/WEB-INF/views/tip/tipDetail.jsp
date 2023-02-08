<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%@ page import = "com.test.tip.tipDTO, com.test.tip.tipDAO, java.util.* "%>	
<%
	
  	

  	
  	String tipDetailSeq = request.getParameter("tipDetailSeq");
  	tipDAO dao = new tipDAO();
  	tipDTO dto = dao.selectTipDetail(tipDetailSeq);
  	
 %>
<!DOCTYPE html>
<html>
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
      
      <div class="tip_detail_contents">
        <div class="tip_detail_contents_top">
          <p> <%=  dto.getTipSubject() %></p>
          <p><%=  dto.getTipRegdate() %></p>
        </div>
        <div class="tip_detail_contents_img"><img src="/np/asset/images/<%= dto.getTipImg() %>"></div>
        <p><%= dto.getTipContent() %></p>
      </div>
      <div class="tip_detail_bottom">
        <button class="tip_detail_list_button" onclick="location.href='tipList.do'">목록</button>
      </div>

    </div>

	</section>

    <%@ include file="/WEB-INF/inc/footer.jsp" %> <%@ include
    file="/WEB-INF/inc/asset2.jsp" %>
  </body>
</html>