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

@WebServlet("/admin/subViewDetail.do")
public class SubViewDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//SubViewDetail.java
		
		String seq = req.getParameter("seq");
		
		AdminDAO dao = new AdminDAO();
		ArrayList<SubscribeDTO> subListDetail = dao.subListDetail(seq);
		
		req.setAttribute("subListDetail", subListDetail);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/subViewDetail.jsp");
		dispatcher.forward(req, resp);

	}

}
