package com.test.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/memDeliver.do")
public class MemDeliver extends HttpServlet {

	//form태그에 넘기는거 아니면 doGet

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MemDeliverDAO dao = new MemDeliverDAO();
		
		String seq = req.getParameter("seq");
		
		//MemDeliverDTO dlist = dao.dlist("2");
		
		ArrayList<MemDeliverDTO> dlist = dao.dlist(seq);
		
		//List<HashMap<String, String>> dstate = dao.dstate("1");
	
		
		req.setAttribute("dlist", dlist);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/memDeliver.jsp");
		dispatcher.forward(req, resp);

	}

}