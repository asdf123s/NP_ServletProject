package com.test.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/prdDelOk.do")
public class PrdDelOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String seq = req.getParameter("seq");
		
		AdminDAO dao = new AdminDAO();
		
		int result = dao.prdDel(seq);
		
		if(result == 1) {
			resp.sendRedirect("/np/admin/chart.do?type=product");
		}else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>");
			writer.print("alert('삭제에 실패했습니다.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.close();
		}
		
		
	}

}
