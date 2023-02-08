package com.test.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/board/freeLikedel.do")
public class freeLikedel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		
		boardDTO dto = new boardDTO();
		
		freeBoardDAO dao = new freeBoardDAO();
		int result = dao.likedel(seq);
		
		PrintWriter writer = resp.getWriter();
		
		JSONObject obj = new JSONObject();
		
		obj.put("resuslt", result);
		
		writer.print(obj);
		
		writer.close();

	}

}