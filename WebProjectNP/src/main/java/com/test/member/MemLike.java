package com.test.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/memLike.do")
public class MemLike extends HttpServlet {

	//form태그에 넘기는거 아니면 doGet

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		likeProductDAO dao = new likeProductDAO();
		
		String seq = req.getParameter("memberSeq");
		
		ArrayList<likeProductDTO> likeList = dao.likeList(seq);
		
		req.setAttribute("likeList", likeList);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/memLike.jsp");
		dispatcher.forward(req, resp);

	}

}