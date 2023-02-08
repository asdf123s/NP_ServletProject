package com.test.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.board.boardCommentDTO;

@WebServlet("/admin/boardEdit.do")
public class BoardEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String type = req.getParameter("type");
		String seq = req.getParameter("seq");
		
		AdminDAO dao = new AdminDAO();
		
		HashMap<String,String> map = new HashMap<String, String>();
		
		map.put("isSearch", "n");
		
		ArrayList noticeDTO = dao.list("tblNotice", "y", seq, map);
		ArrayList qnaDTO = dao.list("tblQnaBoard", "y", seq, map);
		ArrayList freeDTO = dao.list("tblFreeBoard", "y", seq, map);
		
		
		req.setAttribute("type", type);
		req.setAttribute("noticeDTO", noticeDTO);
		req.setAttribute("qnaDTO", qnaDTO);
		req.setAttribute("freeDTO", freeDTO);

		RequestDispatcher dispacher = req.getRequestDispatcher("/WEB-INF/views/admin/boardEdit.jsp");
		dispacher.forward(req, resp);
	}

}