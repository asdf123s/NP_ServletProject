<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.test.member.memberDTO, com.test.member.loginDAO "%>
<%
	 

	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	loginDAO dao = new loginDAO();
	memberDTO dto = dao.login(id, pw);
	
	
	if (dto.getMemberSeq() !=  null) {
		session.setAttribute("memberSeq", dto.getMemberSeq());
		session.setAttribute("id", dto.getId());
		session.setAttribute("name", dto.getName());
		
		if(id.substring(0, 5).toLowerCase().equals("admin")){
			response.sendRedirect("admin/adminIndex.do");
		}else{
			response.sendRedirect("index.do");
		}
	} else {
		out.print("<script>alert('로그인실패')</script>");
		out.print("<script>location.href = 'login.do'</script>");	
	}
	
	
	

%>