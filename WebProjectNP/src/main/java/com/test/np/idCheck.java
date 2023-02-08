package com.test.np;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.member.memberDAO;


@WebServlet("/idCheck")
public class idCheck extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		PrintWriter out = resp.getWriter();
		memberDAO dao = new memberDAO();
		
		boolean result;
		try {
			result = dao.idCheck(id);
			
			if (result) {
				 out.print("not-usable");
			} else {
				 out.print("usable");
			}		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}
}
