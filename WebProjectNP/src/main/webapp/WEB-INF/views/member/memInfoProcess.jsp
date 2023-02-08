<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.test.member.memberDTO, com.test.member.memberDAO "%>
<%
	memberDTO dto = new memberDTO();
memberDAO dao = new memberDAO();
	String memberSeq = request.getParameter("memberSeq");

	dto.setTel(request.getParameter("tel"));
	dto.setPw(request.getParameter("pw"));
	dto.setAddress(request.getParameter("address1") + "@"+ request.getParameter("address2") + "@" + request.getParameter("address3"));

	
	
	
	if (dao.infoEdit(dto,memberSeq)) {
		out.print("<script>alert('회원정보 수정이 완료되었습니다.')</script>");
	} else {
		out.print("<script>alert('회원정보 수정 실패')</script>");
	}
	
	out.print("<script>location.href = 'memInfo.do'</script>");	
	
	
	

%>
