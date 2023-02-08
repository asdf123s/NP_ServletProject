<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%> 
<%@ page import = "com.test.member.*"%>
<%
	String savePath = request.getServletContext().getRealPath("asset/images");
	int sizeLimit = 1024*1024*15;
	MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
  	String subsSeq[] = multi.getParameterValues("select");
  	memberDAO dao = new memberDAO();
  	
  	for (int i=0; i<subsSeq.length; i++) {
	  	boolean result = dao.deleteSubscribe(subsSeq[i]);
	  	
	  	if (!result) {
	  		out.print("<script>alert('구독취소가 실패되었습니다.')</script>");
	  	}
  		
  	}
  	
  	out.print("<script>location.href = 'memSubs.do'</script>");	


	
%>