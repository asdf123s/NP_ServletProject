package com.test.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.board.boardCommentDTO;
import com.test.board.boardDTO;

@WebServlet("/admin/commentEdit.do")
public class CommentEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String type = req.getParameter("type");
		String seq = req.getParameter("seq");
		
		
		AdminDAO dao = new AdminDAO();
		
		ArrayList<boardCommentDTO> list = dao.comment(type, seq, "y");
		
		
		req.setAttribute("comment", list);
		req.setAttribute("type", type);
		req.setAttribute("seq", seq);		

		RequestDispatcher dispacher = req.getRequestDispatcher("/WEB-INF/views/admin/commentEdit.jsp");
		dispacher.forward(req, resp);
	}

}