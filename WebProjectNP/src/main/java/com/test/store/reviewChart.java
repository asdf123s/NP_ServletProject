package com.test.store;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/store/reviewchart.do")
public class reviewChart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		String productSeq = req.getParameter("seq"); //주소창

		reviewChartDAO dao = new reviewChartDAO();
		
		ArrayList<reviewChartDTO> clist = dao.listReviewChart(productSeq);
		
		req.setAttribute("clist", clist);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/store/reviewChart.jsp");
		dispatcher.forward(req, resp);

	}

}

