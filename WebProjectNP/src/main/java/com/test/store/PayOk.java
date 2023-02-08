package com.test.store;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/store/payOk.do")
public class PayOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		RequestDispatcher dispacher = req.getRequestDispatcher("/WEB-INF/views/store/payOk.jsp");
		dispacher.forward(req, resp);
	}

}
