package com.test.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/qnaBoard.do")
public class qnaBoard extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		// 페이징
		String page = req.getParameter("page");
		String categorySeq = req.getParameter("categorySeq");

		System.out.println(categorySeq);
		
		int nowPage = 0; // 현재 페이지 번호(=page)
		int begin = 0; // rnum
		int end = 0; // rnum
		int pageSize = 5; // 한페이지 당 출력할 게시물 수
		int totalCount = 0; // 총 게시물 수
		int totalPage = 0; // 총 페이지 수(총 게시물 수 / 한페이지 당 게시물 수)

		if (page == null || page == "")
			nowPage = 1;
		else
			nowPage = Integer.parseInt(page);

		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		String word = req.getParameter("word");
		String isSearch = "n"; // n(목록), y(검색)

		if (word == null || word == "") {
			isSearch = "n";
		} else {
			isSearch = "y";
		}

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("word", word);
		map.put("isSearch", isSearch);
		if(categorySeq == null) {
			categorySeq = "1";
		}
		map.put("categorySeq", categorySeq);

		map.put("begin", begin + "");
		map.put("end", end + "");

		HttpSession session = req.getSession();

		session.setAttribute("readcount", "n");
		
		
		// qna
		qnaBoardDAO dao = new qnaBoardDAO();
		ArrayList<qnaBoardDTO> qnaList = dao.qnaList(map);
		for (qnaBoardDTO dto : qnaList) {
			// 제목 자르기
			String title = dto.getQnaBoardTitle();
			if (title.length() > 20) {
				title = title.substring(0, 20);
				dto.setQnaBoardTitle(title + "..");
			}
		}
		
		
		
		
		// 총 게시물 수
		// 총 페이지 수

		// 364 / 10 = 36

		totalCount = dao.getTotalCount(map);
		totalPage = (int) Math.ceil((double) totalCount / pageSize);

		/*
		 * <div class="commu_page"> <ul class="pagebar"> <a href="#"><li>&lt;</li> <a
		 * href="/np/views/community.do?page=1"><li>1</li></a> <a
		 * href="/np/views/community.do?page=2"><li>2</li></a> <a
		 * href="/np/views/community.do?page=3"><li>3</li></a> <a
		 * href="/np/views/community.do?page=4"><li>4</li></a> <a
		 * href="/np/views/community.do?page=5"><li>5</li></a> <a
		 * href="#"><li>&gt;</li></a> </ul> </div>
		 */

		String pagebar = ""; // 페이지바 태그

		int blockSize = 5; // 한번에 보여지는 페이지 수
		int n = 0; // 출력 페이지 번호
		int loop = 0; // 루프 변수

		loop = 1;
		n = ((nowPage - 1) / blockSize) * blockSize + 1;

		if (n == 1) {
			pagebar += String.format("<a href='#!' style='cursor: not-allowed;'><li>&lt;</li></a>");
		} else {
			pagebar += String.format("<a href='/np/board/qnaBoard.do?page=%d'><li>&lt;</li></a>", n - 1);
		}

		while (!(loop > blockSize || n > totalPage)) {

			if (nowPage == n) {
				pagebar += String.format(
						"<a href=\"/np/board/qnaBoard.do?page=%d\" style='background-color: #92AC60;'><li style='left: 20px;\r\n"
								+ "	color: #fff;'>%d</li></a>",
						n, n);
			} else {
				pagebar += String.format(" <a href='/np/board/qnaBoard.do?page=%d'><li>%d</li></a> ", n, n);
			}

			loop++;
			n++;

		}

		if (n > totalPage) {
			pagebar += String.format("<a href='#!' style='cursor: not-allowed;'><li>&gt;</li></a>");
		} else {
			pagebar += String.format("<a href='/np/board/qnaBoard.do?page=%d'><li>&gt;</li></a>", n);
		}

		req.setAttribute("qnaList", qnaList);

		req.setAttribute("map", map);

		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);

		req.setAttribute("nowPage", nowPage);

		req.setAttribute("pagebar", pagebar);

		System.out.println(qnaList);
		
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/qnaBoard.jsp");
		dispatcher.forward(req, resp);

	}

}