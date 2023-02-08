package com.test.np;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sendEmail")
public class sendEmail extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SendEmailServiceImpl SendEmailServiceImpl = new SendEmailServiceImpl();
		//보낼 이메일과 인증번호를 Service로 전달
		
		try {
			SendEmailServiceImpl.sendEmail(req.getParameter("email"), req.getParameter("text"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		


	}
}
