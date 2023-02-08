<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = " com.test.member.memberDAO "%>
<%
	String pw = request.getParameter("pw");
	String memberSeq = request.getParameter("memberSeq");
	
	memberDAO dao = new memberDAO();
	
	if (dao.editPw(pw, memberSeq)) {
		out.print("<script>alert('비밀번호 변경이 완료되었습니다')</script>");
	} else {
		out.print("<script>alert('비밀번호 변경 실패')</script>");
	}
	
	out.print("<script>location.href = 'login.do'</script>");	
	
	
	

%>