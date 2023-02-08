package com.test.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.board.boardDTO;
import com.test.board.qnaBoardDTO;

@WebServlet("/admin/boardEditOk.do")
public class BoardEditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String type = req.getParameter("type");
		String seq = req.getParameter("seq");

		AdminDAO dao = new AdminDAO();

		if (type.equals("qna")) {

			qnaBoardDTO dto = new qnaBoardDTO();

			dto.setQnaBoardTitle(title);
			dto.setQnaBoardTxt(content);
			dto.setQnaBoardSeq(seq);

			int result = dao.boardEdit(type, dto);

			if (result == 1) {
				resp.sendRedirect("/np/admin/boardViewDetail.do?type=qna&seq=" + seq);
			} else {
				PrintWriter writer = resp.getWriter();
				writer.print("<script>");
				writer.print("alert('failed');");
				writer.print("history.back();");
				writer.print("</script>");
				writer.close();
			}

		} else if (type.equals("free")) {

			qnaBoardDTO dto = new qnaBoardDTO();

			dto.setQnaBoardTitle(title);
			dto.setQnaBoardTxt(content);
			dto.setQnaBoardSeq(seq);

			int result = dao.boardEdit(type, dto);

			if (result == 1) {
				resp.sendRedirect("/np/admin/boardViewDetail.do?type=free&seq=" + seq);
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

}
