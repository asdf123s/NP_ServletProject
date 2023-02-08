package com.test.recommend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/recommend/recommendChart.do")
public class RecommendChart extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String[] productSeq = req.getParameterValues("productSeq");
		
		RecommendDAO dao = new RecommendDAO();
		
		ArrayList<recommendChartDTO> list = new ArrayList<recommendChartDTO>();
		
		list = dao.recommendChartList(productSeq);
		
		ArrayList<VwIntakeNumDTO> vwlist = new ArrayList<VwIntakeNumDTO>();
		
		vwlist = dao.vwRcommendItem(list);
		
		ArrayList<recommendChartDTO> warning = new ArrayList<recommendChartDTO>();
		
		warning = dao.warningTxt(list);
		
		req.setAttribute("vwlist", vwlist);
		req.setAttribute("list", list);
		req.setAttribute("warningList", warning);

		RequestDispatcher dispacher = req.getRequestDispatcher("/WEB-INF/views/recommend/recommendChart.jsp");
		dispacher.forward(req, resp);
	}

}