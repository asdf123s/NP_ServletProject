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
import javax.servlet.http.HttpSession;

@WebServlet("/admin/productViewDetail.do")
public class ProductViewDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		
		
		AdminDAO dao = new AdminDAO();
		
		HashMap<String,String> map = new HashMap<String, String>();
		
		map.put("isSearch", "n");
		
		ArrayList product = dao.list("tblProduct", "y", seq, map);
		
		req.setAttribute("product", product);
		req.setAttribute("seq", seq);

		RequestDispatcher dispacher = req.getRequestDispatcher("/WEB-INF/views/admin/productViewDetail.jsp");
		dispacher.forward(req, resp);
	}

}