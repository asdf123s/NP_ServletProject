package com.test.np;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/memCartDelete.do")
public class memCartDelete extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean result = false;
	
		String productSeq = req.getParameter("productSeq");

		HttpSession session = req.getSession();
		String memberSeq = (String)session.getAttribute("memberSeq");
		

		cartDAO dao = new cartDAO();
			
		try {
			result = dao.deleteCart(productSeq, memberSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if (result) {

			resp.sendRedirect("memCart.do?memberSeq="+memberSeq);
		}
		


	}

}