package com.test.np;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.store.productDTO;



@WebServlet("/memCart.do")
public class memCart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean result = false;
		
		HttpSession session = req.getSession();
		String memberSeq = (String)session.getAttribute("memberSeq");
		
		
		cartDAO dao = new cartDAO();
		
		
		ArrayList<productDTO> list = new ArrayList<productDTO>();
		
		try {
			list = dao.selectCart(memberSeq);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		req.setAttribute("list", list);
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/memCart.jsp");
		dispatcher.forward(req, resp);

	}

}