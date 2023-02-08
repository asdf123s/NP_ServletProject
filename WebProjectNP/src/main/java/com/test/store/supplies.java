package com.test.store;

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

@WebServlet("/supplies.do")
public class supplies extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// name.java
		
		HttpSession session = req.getSession();
		
		System.out.println("session.memberSeq:" + session.getAttribute("memberSeq"));
		System.out.println("session.id:" + session.getAttribute("id"));
		System.out.println("session.name:" + session.getAttribute("name"));
		
		String sessionMemberSeq = (String) session.getAttribute("memberSeq");
		String sessionMemberId = (String) session.getAttribute("id");
		String sessionMemberName = (String) session.getAttribute("name");
		
		// 세부카테고리
		String all = req.getParameter("all");
		String one = req.getParameter("one");
		String two = req.getParameter("two");
		String three = req.getParameter("three");
		String four = req.getParameter("four");
		String five = req.getParameter("five");
		String six = req.getParameter("six");
		String seven = req.getParameter("seven");
		
		System.out.println("출력물:" + all);
		System.out.println("출력물:" + one);
		System.out.println("출력물:" + two);
		System.out.println("출력물:" + three);
		System.out.println("출력물:" + four);
		System.out.println("출력물:" + five);
		System.out.println("출력물:" + six);

		String getSuppliesCategory = "ALL";
		
		if(one != null) {
			getSuppliesCategory = one;
		} else if(two != null) {
			getSuppliesCategory = two;
		} else if(three != null) {
			getSuppliesCategory = three;
		} else if(four != null) {
			getSuppliesCategory = four;
		} else if(five != null) {
			getSuppliesCategory = five;
		} else if(six != null) {
			getSuppliesCategory = six;
		} else if(seven != null) {
			getSuppliesCategory = seven;
		} else if(all != null) {
			getSuppliesCategory = all;
		}
		
		System.out.println("getSuppliesCategory:" + getSuppliesCategory);
		
		
		
		
		
		
		
		
		// 페이징
		String page = req.getParameter("page");

		int nowPage = 0; // 현재 페이지 번호(=page)
		int begin = 0; // rnum
		int end = 0; // rnum
		int pageSize = 12; // 한페이지 당 출력할 게시물 수
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

		map.put("begin", begin + "");
		map.put("end", end + "");
		
		map.put("getSuppliesCategory", getSuppliesCategory);

		// 1.
		storeDAO dao = new storeDAO();
		ArrayList<productDTO> productListSupplies = dao.plistSupplies(map);


		// 18 / 12 = 2

		totalCount = dao.getTotalCountSupplies(map);
		totalPage = (int) Math.ceil((double) totalCount / pageSize);

		// System.out.println(totalPage);

		String pagebar = ""; // 페이지바 태그

		int blockSize = 10; // 한번에 보여지는 페이지 수
		int n = 0; // 출력 페이지 번호
		int loop = 0; // 루프 변수

		loop = 1;
		n = ((nowPage - 1) / blockSize) * blockSize + 1;

		if (n == 1) {
			pagebar += String.format(" <a href='#!' style='cursor: not-allowed;'>[이전 10페이지]</a> ");
		} else {
			pagebar += String.format(" <a href='supplies.do?page=%d'>[이전 10페이지]</a> ", n - 1);
		}

		while (!(loop > blockSize || n > totalPage)) {

			if (nowPage == n) {
				pagebar += String.format(" <a href='#!' style='color: cornflowerblue;'>%d</a>", n);
			} else {
				pagebar += String.format(" <a href='supplies.do?page=%d'>%d</a> ", n, n);
			}

			loop++;
			n++;

		}

		if (n > totalPage) {
			pagebar += String.format(" <a href='#!' style='cursor:not-allowed;'>[다음 10페이지]</a> ", n);
		} else {
			pagebar += String.format(" <a href='supplies.do?page=%d'>[다음 10페이지]</a> ", n);
		}

		// 2.
		req.setAttribute("productListSupplies", productListSupplies);

		req.setAttribute("map", map);

		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);

		req.setAttribute("nowPage", nowPage);

		req.setAttribute("pagebar", pagebar);
		
		req.setAttribute("sessionMemberSeq", sessionMemberSeq);
		req.setAttribute("sessionMemberId", sessionMemberId);
		req.setAttribute("sessionMemberName", sessionMemberName);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/store/supplies.jsp");
		dispatcher.forward(req, resp);

	}

}
