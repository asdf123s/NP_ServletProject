package com.test.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member/memLikeDelOk.do")
public class MemLikeDelOk extends HttpServlet {

	//form태그에 넘기는거 아니면 doGet

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		req.setCharacterEncoding("UTF-8");
		
		String[] product = req.getParameterValues("checkBoxArr");
//		String seq = req.getParameter("1");
		
		//2.
		likeProductDAO dao = new likeProductDAO();
		
		
		int result = dao.del("1", product[0]);

		if (result == 1) {
			resp.sendRedirect("/np/memLike.do");
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