package com.test.np;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.store.productDTO;
import com.test.store.reviewDTO;
import com.test.store.storeDAO;
import com.test.store.storeDTO;

@WebServlet("/index.do")
public class index extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		productDTO dto = new productDTO();
		
		storeDAO dao = new storeDAO();
		
		ArrayList<productDTO> best = new ArrayList<productDTO>();
		ArrayList<reviewDTO> review = new ArrayList<reviewDTO>();
		
		best = dao.bestProduct();
		
		review = dao.indexReview();
		
		int productNum = dao.productTotalNum();
		int boardNum = dao.boardTotalNum();
		int reviewNum = dao.reviewTotalNum();
		int memNum = dao.memberTotalNum();
		
		req.setAttribute("best", best);
		req.setAttribute("review", review);
		
		req.setAttribute("productNum", productNum);
		req.setAttribute("boardNum", boardNum);
		req.setAttribute("reviewNum", reviewNum);
		req.setAttribute("memNum", memNum);
		
		
		RequestDispatcher dispacher = req.getRequestDispatcher("/WEB-INF/views/index.jsp");
		dispacher.forward(req, resp);
	}

}