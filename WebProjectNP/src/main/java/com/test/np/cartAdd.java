package com.test.np;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cartAdd.do")
public class cartAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean result = false;
		
		String productSeq = req.getParameter("productSeq");
		String memberOrderCount = req.getParameter("memberOrderCount");
		String memberSeq = req.getParameter("memberSeq");
		

		cartDAO dao = new cartDAO();
			
		try {
			result = dao.insertCart(productSeq, memberSeq, memberOrderCount);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if (result) {

			resp.sendRedirect("memCart.do");
		}
		


	}

}