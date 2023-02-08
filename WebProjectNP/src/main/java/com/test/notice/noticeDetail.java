package com.test.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/notice/noticeDetail.do")
public class noticeDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		noticeDetail.java
		
		//1.
		String noticeSeq = req.getParameter("seq"); //주소창
		
		
		//2.
		noticeDAO dao = new noticeDAO();
		
		noticeDTO dto = dao.get(noticeSeq);
		
		
		//2.5
		// 날짜 자르기
		String regdate = dto.getNoticeRegdate();

		//regdate = regdate.substring(0, 10);

		dto.setNoticeRegdate(regdate);
		
		// 개행 문자 처리
//		content = content.replace("\r\n", "<br>");
//		dto.setNoticeContent(noticeSeq);
		
		
		
		
		
		//3.
		req.setAttribute("dto", dto);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/notice/noticeDetail.jsp");
		dispatcher.forward(req, resp);

	}

}
