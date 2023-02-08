package com.test.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/memViewDetail.do")
public class MemViewDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		AdminDAO dao = new AdminDAO();
		
		HashMap<String,String> map = new HashMap<String, String>();
		
		map.put("isSearch", "n");
		
		ArrayList member = dao.list("tblMember", "y", seq, map);
		
		req.setAttribute("member", member);
		req.setAttribute("seq", seq);
		

		RequestDispatcher dispacher = req.getRequestDispatcher("/WEB-INF/views/admin/memViewDetail.jsp");
		dispacher.forward(req, resp);
	}

}
