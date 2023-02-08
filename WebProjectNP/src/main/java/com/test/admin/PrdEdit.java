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

import com.test.store.productDTO;

@WebServlet("/admin/prdEdit.do")
public class PrdEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		AdminDAO dao = new AdminDAO();
		
		HashMap<String,String> map = new HashMap<String, String>();
		
		map.put("isSearch", "n");
		
		ArrayList product = dao.list("tblProduct", "y", seq, map);
		
		req.setAttribute("product", product);
		

		RequestDispatcher dispacher = req.getRequestDispatcher("/WEB-INF/views/admin/prdEdit.jsp");
		dispacher.forward(req, resp);
	}

}
