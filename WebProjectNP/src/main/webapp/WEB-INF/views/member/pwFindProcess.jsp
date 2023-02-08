<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.test.member.memberDTO, com.test.member.memberDAO "%>

<%
	
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String jumin = request.getParameter("jumin");
	String email = request.getParameter("email");
	
	memberDAO dao = new memberDAO();
	
	String memberSeq = dao.findPw(id, jumin, email);
	
	if (memberSeq != "") {
		response.sendRedirect("pwEdit.do?memberSeq="+memberSeq);	
		
		
	} else {
		out.print("<script>alert('존재하는 정보가 없습니다.')</script>");
		out.print("<script>location.href = 'pwFind.do'</script>");	
	}

%>