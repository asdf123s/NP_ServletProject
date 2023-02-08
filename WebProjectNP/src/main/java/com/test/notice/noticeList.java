package com.test.notice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/notice/noticeList.do")
public class noticeList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1.
		noticeDAO dao = new noticeDAO();
		
		ArrayList<noticeDTO> list = dao.list();
		
		//1.5
		for(noticeDTO dto : list) {
			
			// 날짜 자르기
			String regdate = dto.getNoticeRegdate();

			//regdate = regdate.substring(0, 10);

			dto.setNoticeRegdate(regdate);
			
			// 제목 자르기
			String content = dto.getNoticeContent();
			
			if (content.length() > 100) {
				content = content.substring(0, 100);
				dto.setNoticeContent(content + "....");
			}
		}
		
		//2.
		req.setAttribute("list", list);
		


		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/notice/noticeList.jsp");
		dispatcher.forward(req, resp);

	}


}
