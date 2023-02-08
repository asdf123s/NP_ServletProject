package com.test.store;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/store/review.do")
public class Review extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1.
		String productSeq = req.getParameter("seq"); 
				
		// 2.
//			reviewDAO dao = new reviewDAO();
//			reviewDTO dto = dao.get(productSeq);
		
		
		req.setAttribute("productSeq", productSeq);

		RequestDispatcher dispacher = req.getRequestDispatcher("/WEB-INF/views/store/review.jsp");
		dispacher.forward(req, resp);
	}

}
