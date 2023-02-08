package com.test.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/freeboardEdit.do")
public class freeboardEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String boardSeq = req.getParameter("boardSeq");
		
		freeBoardDAO dao = new freeBoardDAO();
		
		boardDTO dto = dao.get(boardSeq);
		
		
		HttpSession session = req.getSession();
		
//		if (session.getAttribute("auth") == null
//				|| !dto.getMemberSeq().equals((String)session.getAttribute("auth"))) {
//			PrintWriter writer = resp.getWriter();
//			writer.print("<script>");
//			writer.print("alert('로그인이 필요합니다.');");
//			writer.print("location.href='/np/member/login.do';");
//			writer.print("</script>");
//			writer.close();
//			return;
//		} 
		
		
		
		//3.
		req.setAttribute("dto", dto);		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/freeboardEdit.jsp");
		dispatcher.forward(req, resp);

	}

}