package com.test.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.member.memberDTO;

@WebServlet("/admin/memEdit.do")
public class MemEdit extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String name = req.getParameter("name");
		String pw = req.getParameter("pw");
		String jumin = req.getParameter("jumin");
		String tel = req.getParameter("tel");
		String lvName = req.getParameter("lvName");
		String id =req.getParameter("id");
		String email = req.getParameter("email");
		String gender = req.getParameter("gender");
		String point = req.getParameter("point");
		String address = req.getParameter("address");
		String memberSeq = req.getParameter("seq");
		String lvSeq = req.getParameter("lvSeq");
		
		
		memberDTO dto = new memberDTO();
		
		dto.setMemberSeq(memberSeq);
		dto.setName(name);
		dto.setPw(pw);
		dto.setJumin(jumin);
		dto.setTel(tel);
		dto.setLvName(lvName);
		dto.setId(id);
		dto.setEmail(email);
		dto.setGender(gender);
		dto.setPoint(point);
		dto.setAddress(address);
		dto.setMemberLvSeq(lvSeq);
		
		req.setAttribute("mem", dto);

		RequestDispatcher dispacher = req.getRequestDispatcher("/WEB-INF/views/admin/memEdit.jsp");
		dispacher.forward(req, resp);
	}

}
