package com.test.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/freeboardEditOk.do")
public class freeboardEditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		HttpSession session = req.getSession();
		
		// 1.
		req.setCharacterEncoding("UTF-8");
		
		String boardSeq = req.getParameter("boardSeq");
		String title = req.getParameter("boardTitle");
		String txt = req.getParameter("boardTxt");

		// 2.
		boardDTO dto = new boardDTO();
		
		dto.setFreeBoardSeq(boardSeq);
		dto.setFreeBoardTitle(title);
		dto.setFreeBoardTxt(txt);
		
		freeBoardDAO dao = new freeBoardDAO();

		int result = dao.edit(dto);
		
		System.out.println(dto.getFreeBoardTitle());
		System.out.println(dto.getFreeBoardTxt());
		System.out.println(dto.getFreeBoardSeq());

		// 4.
		if (result == 1) {
			resp.sendRedirect("/np/board/freeboardDetail.do?boardSeq=" + boardSeq);
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