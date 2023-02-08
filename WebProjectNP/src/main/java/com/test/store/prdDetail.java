package com.test.store;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/store/prdDetail.do")
public class prdDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		prdDetail.java

		//특정 상품 상세 보여주기
		//1.
		String productSeq = req.getParameter("seq"); //주소창
		
		//1.
		//특정 상품상세에서 <후기> 보여주기
		reviewDAO dao = new reviewDAO();
		
		//2.후기목록
		ArrayList<reviewDTO> reviewList = dao.reviewList(productSeq);
		req.setAttribute("reviewList", reviewList);
		//2.후기숫자
		reviewDTO dto = dao.reviewCnt(productSeq);
		req.setAttribute("dto", dto);
		//후기평균
		reviewDTO avg = dao.reviewAvg(productSeq);
		req.setAttribute("avg", avg);
		
		//2.상품
		productDAO dao1 = new productDAO();
		productDTO dto1 = dao1.get(productSeq);
		req.setAttribute("dto1", dto1);
		
		//차트
		reviewChartDAO dao2 = new reviewChartDAO();
		ArrayList<reviewChartDTO> clist = dao2.listReviewChart(productSeq);
		req.setAttribute("clist", clist);
		
		
		
		
		
		
		//첨부파일처리
//		if(dto.getReviewImage() != null
//				&&(dto.getReviewImage().toLowerCase().endsWith(".jpg")
//				|| dto.getReviewImage().toLowerCase().endsWith(".jpeg")
//				|| dto.getReviewImage().toLowerCase().endsWith(".gif")
//				|| dto.getReviewImage().toLowerCase().endsWith(".png"))){
//					
//				//이미지 정보 가져오기
//			BufferedImage img = ImageIO.read(new File(req.getRealPath("asset/files") + "\\" + dto.getReviewImage()));
//			
//			//이미지 크기 알아보기
////			System.out.println(img.getWidth());
////			System.out.println(img.getHeight());
//			
//			String temp = "";
//			
//			if(img.getWidth() > 200) {
//				temp = "style='width: 200px; background-size: cover;'";
//			}
//			
//			productSeq = dto.getReviewContent();
//			
//			productSeq = productSeq + String.format("<div style='margin-top: 15px;'><img src='/np/asset/files/%s' %s></div>", dto.getReviewImage(), temp);
//			
//			dto.setReviewContent(productSeq);
//			
//		}
		
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/store/prdDetail.jsp");
		dispatcher.forward(req, resp);

	}

}

