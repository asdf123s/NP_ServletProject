package com.test.np;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/memOrder.do")
public class MemOrder extends HttpServlet {

	//form태그에 넘기는거 아니면 doGet

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MemOrderDAO dao = new MemOrderDAO();
		HttpSession session = req.getSession();
		String memberSeq = (String)session.getAttribute("memberSeq");
		
		ArrayList<orderProductDTO> olist = dao.olist(memberSeq);
		
		
		  for (orderProductDTO olist2 : olist) {

		         String date = olist2.getMemberBuyDate();
		         System.out.println(date);

		         date = date.substring(0, 11);

		         olist2.setMemberBuyDate(date);
		         System.out.println(date);

		      }
			
		req.setAttribute("olist", olist);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/memOrder.jsp");
		dispatcher.forward(req, resp);

	}

}