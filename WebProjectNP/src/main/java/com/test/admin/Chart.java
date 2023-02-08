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
import javax.servlet.http.HttpSession;

import com.test.store.productDTO;

@WebServlet("/admin/chart.do")
public class Chart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		AdminDAO dao = new AdminDAO();

		String type = req.getParameter("type");

		String page = req.getParameter("page");

		int nowPage = 0;
		int begin = 0;
		int end = 0;
		int pageSize = 10;
		int totalCount = 0;
		int totalPage = 0;

		if (page == null || page == "")
			nowPage = 1;
		else nowPage = Integer.parseInt(page);
			

		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		String word = req.getParameter("word");
		String isSearch = "n"; // n(목록) y(검색)

		if (word == null || word == "" || word.equals("")) {
			isSearch = "n";
		} else {
			isSearch = "y";
		}

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("word", word);
		map.put("isSearch", isSearch);

		map.put("begin", begin + "");
		map.put("end", end + "");

		map.put("word", word);

		req.setAttribute("map", map);
		
		ArrayList chartList = new ArrayList();
		
		if(type.equals("product")) {
			chartList = dao.list("tblProduct", "n", "", map);
		}else if(type.equals("notice")) {
			chartList = dao.list("tblNotice", "n", "", map);
		}else if(type.equals("free")) {
			chartList = dao.list("tblFreeBoard", "n", "", map);
		}else if(type.equals("qna")) {
			chartList = dao.list("tblQnaBoard", "n", "", map);
		}else if(type.equals("member")) {
			chartList = dao.list("tblMember", "n", "", map);
		}
		
		totalCount = dao.getTotalCount(map, type);
		totalPage = (int) (Math.ceil((double) totalCount / pageSize));

		String pagebar = "";
		int blockSize = 10;
		int n = 0;
		int loop = 0;

		loop = 1;
		n = ((nowPage - 1) / blockSize) * blockSize + 1;

		if (n == 1) {
			pagebar += String.format("<a href='#!' style='cursor:not-allowed;' class='pagebtn'>prev</a>");
		} else {
			pagebar += String.format("<a href='/np/admin/chart.do?type=%s&page=%d' class='pagebtn'>prev</a>",type, n - 1);
		}

		// 1 > 10
		
		while (!(loop > blockSize || n > totalPage)) {

			if (nowPage == n) {
				// 현재페이지 23페이지였을때 23을 눌렀을때
				pagebar += String.format("<div class=\"nowpage\"><a href='#!' class='pagebtn'>%d</a></div>", n);
			} else {
				pagebar += String.format(" <a href='/np/admin/chart.do?type=%s&page=%d' class='pagebtn'>%d</a>",type, n, n);
			}

			loop++;
			n++;
		}

		if (n > totalPage) {
			pagebar += String.format(" <a href='#!' style='color:cornflowerblue; cursor:not-allowed;' class='pagebtn'>next</a>");
		} else {
			if(type.equals("notice")) {
				pagebar += String.format(" <a href='/np/admin/chart.do?type=%s&page=%d' class='pagebtn'>next</a>",type, n);
			}
		}

		req.setAttribute("type", type);
		req.setAttribute("pagebar", pagebar);
		req.setAttribute("chartList", chartList);

		RequestDispatcher dispacher = req.getRequestDispatcher("/WEB-INF/views/admin/chart.jsp");
		dispacher.forward(req, resp);
	}

}
