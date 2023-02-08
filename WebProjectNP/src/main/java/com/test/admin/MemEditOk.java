package com.test.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.member.memberDTO;

@WebServlet("/admin/memEditOk.do")
public class MemEditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String name = req.getParameter("name");
		String pw = req.getParameter("pw");
		String tel = req.getParameter("tel");
		String lvSeq = req.getParameter("lvName");
		String email = req.getParameter("email");
		String gender = req.getParameter("gender");
		String point = req.getParameter("point");
		String address = req.getParameter("address");
		String id = req.getParameter("id");
		String jumin = req.getParameter("jumin");
		
		String seq = req.getParameter("seq");
		
		AdminDAO dao = new AdminDAO();
		
		memberDTO dto = new memberDTO();
		
		dto.setName(name);
		dto.setPoint(point);
		dto.setPw(pw);
		dto.setTel(tel);
		dto.setMemberLvSeq(lvSeq);
		dto.setEmail(email);
		dto.setGender(gender);
		dto.setAddress(address);
		dto.setId(id);
		dto.setJumin(jumin);
		dto.setMemberSeq(seq);
		
		
		int result = dao.memEdit(seq, dto);
		
		if(result == 1) {
			resp.sendRedirect("/np/admin/memViewDetail.do?seq="+seq);
		}else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>");
			writer.print("alert('failed');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.close();
		}
		
		
	}

}