<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.test.member.memberDTO, com.test.member.memberDAO "%>

<%
	
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String jumin = request.getParameter("jumin");
	
	memberDAO dao = new memberDAO();
	
	String id = dao.findId(name, jumin);
	
	if (id != "") {
		out.print("<script>alert('고객님의 아이디는 " + id + "입니다')</script>");
		out.print("<script>location.href = 'login.do'</script>");	
		
		
	} else {
		out.print("<script>alert('존재하는 아이디가 없습니다.')</script>");
		out.print("<script>location.href = 'idFind.do'</script>");	
	}

%>