package com.test.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/qnaboardDelOk.do")
public class qnaboardDelOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String boardSeq = req.getParameter("boardSeq");
		
		qnaBoardDAO dao = new qnaBoardDAO();
		
		dao.delAllComment(boardSeq);
		
		int result = dao.del(boardSeq);
		
		
		if (result == 1) {
			resp.sendRedirect("/np/community.do");
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>");
			writer.print("alert('failed');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.close();			
		}

	}

}