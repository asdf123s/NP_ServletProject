package com.test.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.board.boardCommentDTO;

@WebServlet("/admin/commentEditOk.do")
public class CommentEditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		String type = req.getParameter("type");
		String content = req.getParameter("content");

		boardCommentDTO dto = new boardCommentDTO();

		dto.setFreeCommentSeq(seq);
		dto.setCommentContent(content);

		AdminDAO dao = new AdminDAO();

		int result = dao.commentEdit(type, dto);

		if (result == 1) {
			if (type.equals("qna")) {
				resp.sendRedirect("/np/admin/boardViewDetail.do?type=qna&seq=" + seq);
			}else if(type.equals("free")) {
				resp.sendRedirect("/np/admin/boardViewDetail.do?type=free&seq=" + seq);
			}
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