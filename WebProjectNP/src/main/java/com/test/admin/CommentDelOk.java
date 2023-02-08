package com.test.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/commentDelOk.do")
public class CommentDelOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String type = req.getParameter("type");
		String seq = req.getParameter("seq");
		String mainSeq = req.getParameter("mainSeq");
		
		AdminDAO dao = new AdminDAO();
		
		int result = dao.commentDel(type, seq);
		
		if (result == 1) {
			if (type.equals("qna")) {
				resp.sendRedirect("/np/admin/boardViewDetail.do?type=qna&seq=" + mainSeq);
			}else if(type.equals("free")) {
				resp.sendRedirect("/np/admin/boardViewDetail.do?type=free&seq=" + mainSeq);
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