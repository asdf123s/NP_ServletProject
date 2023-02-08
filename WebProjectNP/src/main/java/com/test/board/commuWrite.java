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

@WebServlet("/board/commuWrite.do")
public class commuWrite extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	
		HttpSession session = req.getSession();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		if (session.getAttribute("memberSeq") == null) {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>");
			writer.print("alert('로그인이 필요합니다.');");
			writer.print("location.href='/np/login.do';");
			writer.print("</script>");
			writer.close();
			return;
		}
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/commuWrite.jsp");
		dispatcher.forward(req, resp);

	}

}