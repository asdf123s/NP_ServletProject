<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "com.test.member.memberDTO, com.test.member.memberDAO, java.util.*, com.test.store.productDTO "%>
<%
	String memberSeq = (String)session.getAttribute("memberSeq");
	memberDAO dao = new memberDAO();
	memberDTO dto = dao.memInfo(memberSeq);
	
	ArrayList<productDTO> list = dao.selectSubscribe(memberSeq);
	
	
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>뉴핏</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%@ include file="/WEB-INF/inc/asset.jsp" %>
    <script>
    $(document).ready(function() { 
    	
    	$("#delete").click(function() {    		
			if ( $("input[type='checkbox']:checked").length == 0 ) {
				alert("삭제하실 게시물을 선택해주세요");
			} else {
				if (confirm("정말 삭제하시겠습니까?") == true ) {
					del.submit();
				} else {
					return; 
				}
			}
		});
    	
	    $("#all_check").click(function(){
			 $('input[name=select_all]').on('change', function(){
				  $('input[name=select]').prop('checked', this.checked);
				});
		});
    });
    </script>
  </head>
  <body class="goto-here">
  
     
    <%@ include file="/WEB-INF/inc/header.jsp" %>
      

    <section id="tip_section">
    <div class="container">
      <p>구독</p>
      <div class="subscripe_content_box">
        <div class="subscripe_name_box">
            <p>구독현황</p>
        </div>
        <div class="subscripe_content_info">
            <input type="checkbox" name="select_all" id="all_check">
            <span>제품 사진</span>
            <span>제품 이름</span>
            <span>가격</span>
            <span>수량</span>
            <span>제품 구독일</span>
        </div>
        <form name="del" action="memSubsProcess.do" method="post" enctype="multipart/form-data">
        <div class="subscripe_content_product">
            <%for(productDTO pdto : list){ %>
            <table class="subscripe_content_product_table">
                <th>
	                <td class="subscripe_content_product_table_check"> <input type="checkbox" name="select" id="check" value="<%= pdto.getSubsSeq() %>"></td>
	                <td> <img src="/np/asset/images/<%= pdto.getProductImage() %>" alt=""></td>
	                <td><%= pdto.getProductName() %></td>
	                <td><%= pdto.getProductPrice() %></td>
	                <td>1</td>
                	<td><%= pdto.getSubsDate() %></td>
                </th>
            </table>
               <% } %>
        </div>
        <div class="subscripe_content_button_box">
            <button type="button" id="delete">구독취소</button>
        </div>
		</form>

      </div>
        
      </div>

	</section>

    
    <%@ include file="/WEB-INF/inc/footer.jsp" %>

   <%@ include file="/WEB-INF/inc/asset2.jsp" %>
    
  </body>
</html>