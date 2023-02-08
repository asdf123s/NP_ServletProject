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

@WebServlet("/nutrition.do")
public class nutrition extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// nutrition.java
		
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
		String eight = req.getParameter("eight");
		String nine = req.getParameter("nine");
		String ten = req.getParameter("ten");
		String eleven = req.getParameter("eleven");
		String twelve = req.getParameter("twelve");
		String thirteen = req.getParameter("thirteen");
		String fourteen = req.getParameter("fourteen");
		String fifteen = req.getParameter("fifteen");
		String sixteen = req.getParameter("sixteen");
		String seventeen = req.getParameter("seventeen");
		String eighteen = req.getParameter("eighteen");
		
		

		String getNutritionCategory = "ALL";
		
		if(one != null) {
			getNutritionCategory = one;
		} else if(two != null) {
			getNutritionCategory = two;
		} else if(three != null) {
			getNutritionCategory = three;
		} else if(four != null) {
			getNutritionCategory = four;
		} else if(five != null) {
			getNutritionCategory = five;
		} else if(six != null) {
			getNutritionCategory = six;
		} else if(seven != null) {
			getNutritionCategory = seven;
		} else if(eight != null) {
			getNutritionCategory = eight;
		} else if(nine != null) {
			getNutritionCategory = nine;
		} else if(ten != null) {
			getNutritionCategory = ten;
		} else if(eleven != null) {
			getNutritionCategory = eleven;
		} else if(twelve != null) {
			getNutritionCategory = twelve;
		} else if(thirteen != null) {
			getNutritionCategory = thirteen;
		} else if(fourteen != null) {
			getNutritionCategory = fourteen;
		} else if(fifteen != null) {
			getNutritionCategory = fifteen;
		} else if(sixteen != null) {
			getNutritionCategory = sixteen;
		} else if(seventeen != null) {
			getNutritionCategory = seventeen;
		} else if(eighteen != null) {
			getNutritionCategory = eighteen;
		} else if(all != null) {
			getNutritionCategory = all;
		}
		
		System.out.println("getNutritionCategory:" + getNutritionCategory);
		
		
		
		
		

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
		
		map.put("getNutritionCategory", getNutritionCategory);

		// 1.
		storeDAO dao = new storeDAO();
		ArrayList<productDTO> productListNutrition = dao.plistNutrition(map);


		// 33 / 12 = 3

		totalCount = dao.getTotalCountNutrition(map);
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
			pagebar += String.format(" <a href='nutrition.do?page=%d'>[이전 10페이지]</a> ", n - 1);
		}

		while (!(loop > blockSize || n > totalPage)) {

			if (nowPage == n) {
				pagebar += String.format(" <a href='#!' style='color: cornflowerblue;'>%d</a>", n);
			} else {
				pagebar += String.format(" <a href='nutrition.do?page=%d'>%d</a> ", n, n);
			}

			loop++;
			n++;

		}

		if (n > totalPage) {
			pagebar += String.format(" <a href='#!' style='cursor:not-allowed;'>[다음 10페이지]</a> ", n);
		} else {
			pagebar += String.format(" <a href='nutrition.do?page=%d'>[다음 10페이지]</a> ", n);
		}

		// 2.
		req.setAttribute("productListNutrition", productListNutrition);

		req.setAttribute("map", map);

		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);

		req.setAttribute("nowPage", nowPage);

		req.setAttribute("pagebar", pagebar);
		
		req.setAttribute("sessionMemberSeq", sessionMemberSeq);
		req.setAttribute("sessionMemberId", sessionMemberId);
		req.setAttribute("sessionMemberName", sessionMemberName);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/store/nutrition.jsp");
		dispatcher.forward(req, resp);

	}

}
