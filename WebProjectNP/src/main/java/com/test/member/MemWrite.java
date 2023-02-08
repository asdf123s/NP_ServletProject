package com.test.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/memWrite.do")
public class MemWrite extends HttpServlet {

	//form태그에 넘기는거 아니면 doGet

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MemWriteDAO dao = new MemWriteDAO();
		
		String seq = req.getParameter("memberSeq");
		
		ArrayList<MemWriteQnaDTO> qlist = dao.qlist(seq);
		
		ArrayList<MemWriteFreeDTO> flist = dao.flist(seq);
		

	      for (MemWriteQnaDTO qlist2 : qlist) {

	         String date = qlist2.getQnaBoardDate();
	         System.out.println(date);

	         date = date.substring(0, 10);

	         qlist2.setQnaBoardDate(date);
	         System.out.println(date);
	         
	      }
	      
	      for (MemWriteFreeDTO flist2 : flist) {

		         String date = flist2.getFreeBoardDate();
		         System.out.println(date);

		         date = date.substring(0, 10);

		         flist2.setFreeBoardDate(date);
		         System.out.println(date);
		         
		      }
		
		req.setAttribute("qlist", qlist);
		req.setAttribute("flist", flist);


		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/memWrite.jsp");
		dispatcher.forward(req, resp);

	}

}