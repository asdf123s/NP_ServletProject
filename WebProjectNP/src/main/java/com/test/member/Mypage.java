package com.test.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.store.reviewDTO;





@WebServlet("/mypage.do")
public class Mypage extends HttpServlet {

	//form태그에 넘기는거 아니면 doGet

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		//1. 데이터 가져오기(seq)
		//2. DB 작업 > DAO 위임 > select
		//3. 결과 반환 + JSP 호출하기		
		
		String memberSeq = req.getParameter("seq");
		//회원 포인트 조회		
		MypageDAO dao = new MypageDAO();
		mypageDTO dto = dao.mypage(memberSeq);
		
		//회원 정보 조회
		MypageDAO dao2 = new MypageDAO();
		memberDTO dtoMember = dao2.memberInfo(memberSeq);
		
		System.out.println(dtoMember);
		
		//회원주문 상세정보 조회
		//ArrayList<memberOrderDTO> memOrder = dao.memOrder("1");
		
		//회원주문 상세정보 조회
		memberOrderDTO dtoOrder = dao.memOrder(memberSeq);
		
		//회원 후기 조회
		reviewDTO dtoReview = dao.review(memberSeq);
		
		//회원이 구매항 상품 정보 가져오기
		orderProductDTO dtoOp = dao.OP(memberSeq);
		
		//배송 현황 정보 가져오기
		ArrayList<MemDeliverDTO> dlist = dao.dlist(memberSeq);
		MemDeliverDTO dcount = dao.dcount(memberSeq);
		
			
		//후기 날짜 자르기
		
		if(dtoReview != null) {
			
			String reviewRegdate = dtoReview.getReviewRegdate().substring(0,10);

			//별점만큼 별 출력
			String reviewScore = dtoReview.getReviewScore();
			
			int num = Integer.parseInt(reviewScore);
			
			String star = "";
			
			for(int i=0; i<num; i++) {
				star += "⭐ ";
			}
			
			//후기 작성 날짜
			req.setAttribute("reviewRegdate", reviewRegdate);
			//별점 별 개수
			req.setAttribute("star", star);
		}
		
		//구매일자 출력
		String buyDate = "";
		if(dtoOp != null) {
			buyDate = dtoOp.getMemberBuyDate().substring(0, 10);
		}
		
		//회원 누적 금액 확인
		//ArrayList<orderProductDTO> addlist = dao.addlist("1");
		orderProductDTO addMoney = dao.addMoney(memberSeq);
		
		
				
		
				
		
		
		
		req.setAttribute("dto", dto);
		req.setAttribute("dtoMember", dtoMember);
		req.setAttribute("dtoOrder", dtoOrder);
		req.setAttribute("dtoReview", dtoReview);
		req.setAttribute("dlist", dlist);
		req.setAttribute("dcount", dcount);
		req.setAttribute("addMoney", addMoney);



		
		
		
		
		
		
		//구매내역 모든 정보
		req.setAttribute("dtoOp", dtoOp);
		
		//구매 날짜 2023-01-01 형식 출력
		req.setAttribute("buyDate", buyDate);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/mypage.jsp");
		dispatcher.forward(req, resp);
		

	}

}