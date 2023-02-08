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

@WebServlet("/admin/boardViewDetail.do")
public class BoardViewDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String type = req.getParameter("type");
		String seq = req.getParameter("seq");
		
		AdminDAO dao = new AdminDAO();
		
		HashMap<String,String> map = new HashMap<String, String>();
		
		map.put("isSearch", "n");
		
		ArrayList notice = dao.list("tblNotice", "y", seq, map);
		ArrayList qna = dao.list("tblQnaBoard", "y", seq, map);
		ArrayList free = dao.list("tblFreeBoard", "y", seq, map);
		
		ArrayList<boardCommentDTO> qnaComment = dao.comment("qna", seq, "n");
		ArrayList<boardCommentDTO> freeComment = dao.comment("free", seq, "n");
		
		req.setAttribute("noticeDTO", notice);
		req.setAttribute("type", type);
		req.setAttribute("qnaDTO", qna);
		req.setAttribute("freeDTO", free);
		req.setAttribute("qnaComment", qnaComment);
		req.setAttribute("freeComment", freeComment);
		
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispacher = req.getRequestDispatcher("/WEB-INF/views/admin/boardViewDetail.jsp");
		dispacher.forward(req, resp);
	}

}
