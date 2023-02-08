package com.test.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.store.reviewDTO;

@WebServlet("/member/memReview.do")
public class MemReview extends HttpServlet {

	// form태그에 넘기는거 아니면 doGet

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MemReviewDAO dao = new MemReviewDAO();

		// ArrayList<reviewDTO> rviewList = dao.reviewList("2");
		
		String seq = req.getParameter("seq");

		ArrayList<reviewDTO> rlist = dao.rlist(seq);

		// 회원 후기 조회
		reviewDTO dtoReview = dao.review(seq);

		//후기 날짜 자르기
		String reviewRegdate = dtoReview.getReviewRegdate().substring(0, 10);
		
		//별점만큼 별 출력
		String reviewScore = dtoReview.getReviewScore();
		
		ArrayList<reviewDTO> rStar = dao.rStar(seq);
		
		int num = Integer.parseInt(reviewScore);
		
		String star = "";
				
		for(int i=0; i<num; i++) {
			star += "⭐ ";
		}

	      for (reviewDTO rlist2 : rlist) {

	         String date = rlist2.getReviewRegdate();
	         System.out.println(date);

	         date = date.substring(0, 11);

	         rlist2.setReviewRegdate(date);
	         System.out.println(date);

	      }

		req.setAttribute("rlist", rlist);
		req.setAttribute("reviewRegdate", reviewRegdate);
		req.setAttribute("star", star);
		req.setAttribute("rStar", rStar);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/memReview.jsp");
		dispatcher.forward(req, resp);

	}

}