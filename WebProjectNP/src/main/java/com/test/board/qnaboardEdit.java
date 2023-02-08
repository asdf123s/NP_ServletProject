package com.test.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/qnaboardEdit.do")
public class qnaboardEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String boardSeq = req.getParameter("boardSeq");
		
		qnaBoardDAO dao = new qnaBoardDAO();
		
		qnaBoardDTO dto = dao.get(boardSeq);
		
		System.out.println(dto.getQnaBoardSeq());
		System.out.println(dto.getQnaBoardTitle());
		System.out.println(dto.getQnaBoardTxt());
		System.out.println(dto.getQnaCategorySeq());
		
		HttpSession session = req.getSession();
		
		req.setAttribute("dto", dto);		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/qnaboardEdit.jsp");
		dispatcher.forward(req, resp);

	}

}