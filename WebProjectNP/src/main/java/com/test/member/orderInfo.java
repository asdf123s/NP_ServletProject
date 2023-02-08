package com.test.member;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/member/orderInfo.do")
public class orderInfo extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		/*
			1. 세션 가져오기
			2. 상품번호 / 상품개수
		*/
		
		HttpSession session = req.getSession();
		req.setCharacterEncoding("UTF-8");
		 
		String prdSeq = req.getParameter("prdSeq");
		String qty = req.getParameter("cartprd_cnt");
		String prdPrice = req.getParameter("prdPrice");
		String prdName = req.getParameter("prdName");
		//임시
		String memberSeq = "1";
		
		
		//회원 등급 가져오기
		memberDAO dao = new memberDAO();
		memberCartDTO dto1 = dao.memlv(memberSeq);

		
		//연산
		int sale = 0;
		if (dto1.memberLv.equals("실버")) {
			
		} else if (dto1.memberLv.equals("골드")) {
			
		}
		int total = Integer.parseInt(qty) * Integer.parseInt(prdPrice);
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("prdSeq", prdSeq);
		map.put("qty", qty);
		map.put("prdPrice", prdPrice);
		map.put("total", Integer.toString(total));
		map.put("prdName", prdName);
		map.put("sale", Integer.toString(sale));
		
		//주문자 정보와 동일
		memberDTO dto2 = dao.orderMem(memberSeq);
		
		
		req.setAttribute("map", map);
		req.setAttribute("dto1", dto1);
		req.setAttribute("dto2", dto2);
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/orderInfo.jsp");
		dispatcher.forward(req, resp);

	}

}