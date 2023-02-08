package com.test.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/freeboardcommentEdit.do")
public class freeboardcommentEdit extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String commentSeq = req.getParameter("commentSeq");
		String comment = req.getParameter("comment");
		String boardSeq = req.getParameter("boardSeq");
		
		boardCommentDTO dto = new boardCommentDTO();
		
		dto.setFreeCommentSeq(commentSeq);
		dto.setCommentContent(comment);
		
		freeBoardDAO dao = new freeBoardDAO();
		
		int result = dao.editComment(dto);
		
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