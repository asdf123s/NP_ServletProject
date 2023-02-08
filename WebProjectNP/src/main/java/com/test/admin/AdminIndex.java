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

@WebServlet("/admin/adminIndex.do")
public class AdminIndex extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		AdminDAO dao = new AdminDAO();

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("begin", 0 + "");
		map.put("end", 10 + "");
		map.put("isSearch", "n");

		ArrayList memberList = dao.list("tblMember", "n", "", map);
		ArrayList productList = dao.list("tblProduct", "n", "", map);
		ArrayList qnaList = dao.list("tblQnaBoard", "n", "", map);
		ArrayList freeList = dao.list("tblFreeBoard", "n", "", map);
		ArrayList noticeList = dao.list("tblNotice", "n", "", map);

		System.out.println(memberList);

		HashMap<String, Integer> productChart = dao.productChart();
		HashMap<String, Integer> memberChart = dao.memberChart();

		HttpSession session = req.getSession();

		session.setAttribute("memberList", memberList);
		session.setAttribute("productList", productList);
		session.setAttribute("qnaList", qnaList);
		session.setAttribute("freeList", freeList);
		session.setAttribute("notice", noticeList);
		session.setAttribute("productChart", productChart);
		session.setAttribute("memberChart", memberChart);

		// 관리자 -> 구독관리
		ArrayList<SubscribeDTO> subList = dao.subList();
		req.setAttribute("subList", subList);

		RequestDispatcher dispacher = req.getRequestDispatcher("/WEB-INF/views/admin/adminIndex.jsp");
		dispacher.forward(req, resp);
	}

}