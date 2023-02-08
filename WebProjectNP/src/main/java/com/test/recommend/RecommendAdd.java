package com.test.recommend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/recommend/recommendAdd.do")
public class RecommendAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RecommendItemAdd.list.clear();

		RequestDispatcher dispacher = req.getRequestDispatcher("/WEB-INF/views/recommend/recommendAdd.jsp");
		dispacher.forward(req, resp);
		
	}

}
