<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.test.member.memberDTO, com.test.member.* "%>
<%
	memberDTO dto = new memberDTO();

	dto.setName(request.getParameter("name"));
	dto.setTel(request.getParameter("tel"));
	dto.setGender(request.getParameter("gender"));
	dto.setJumin(request.getParameter("jumin"));
	dto.setGender(request.getParameter("gender"));
	dto.setId(request.getParameter("id"));
	dto.setPw(request.getParameter("pw"));
	dto.setEmail(request.getParameter("email"));
	dto.setAddress(request.getParameter("address0")+"@"+request.getParameter("address1") + "@" + request.getParameter("address2"));
	
	memberDAO dao = new memberDAO();
	
	if (dao.insertSignUp(dto)) {
		response.sendRedirect("index.do");
	} else {
		out.print("<script>alert('등록실패)</script>");
	}
	
	
	

%>