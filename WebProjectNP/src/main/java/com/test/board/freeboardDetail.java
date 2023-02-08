package com.test.board;

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
import javax.servlet.http.HttpSession;



@WebServlet("/board/freeboardDetail.do")
public class freeboardDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		HttpSession session = req.getSession();
		
		String boardSeq = req.getParameter("boardSeq");
		
		freeBoardDAO dao = new freeBoardDAO();
		
		boardDTO dto = dao.get(boardSeq);

		
		
		// 2.5
		// - 데이터 조작
		String content = dto.getFreeBoardTxt();
		String subject = dto.getFreeBoardTitle();
		

		// 태그 이스케이프
		content = content.replace("<", "&lt;").replace(">", "&gt;");
		subject = subject.replace("<", "&lt;").replace(">", "&gt;");

		dto.setFreeBoardTitle(subject);

		// 개행 문자 처리
		content = content.replace("\r\n", "<br>");

		dto.setFreeBoardTxt(content);
		
		


		// 첨부 파일 처리
		if (dto.getFreeBoardImage() != null && (dto.getFreeBoardImage().toLowerCase().endsWith(".jpg")
				|| dto.getFreeBoardImage().toLowerCase().endsWith(".jpeg") || dto.getFreeBoardImage().toLowerCase().endsWith(".gif")
				|| dto.getFreeBoardImage().toLowerCase().endsWith(".png"))) {

			// 이미지 정보 획득
			BufferedImage img = ImageIO.read(new File(req.getRealPath("asset/pic") + "\\" + dto.getFreeBoardImage()));

			// System.out.println(img.getWidth());
			// System.out.println(img.getHeight());

			String temp = "";

			if (img.getWidth() > 240) {
				temp = "style='width:240px;'";
			}

			content = dto.getFreeBoardTxt();

			content = content + String.format("<div style='margin-top:15px;'><img src='/np/asset/pic/%s' %s></div>",
					dto.getFreeBoardImage(), temp);

			dto.setFreeBoardTxt(content);

			String pdsLat = ""; // Latitude
			String pdsLon = ""; // Longitude

			

		}

		// 2.7
		ArrayList<boardCommentDTO> clist = dao.clist(boardSeq);
		
//		for(boardCommentDTO clist2 : clist) {
//			
//			String date = clist2.getFreeDate();
//			System.out.println(date);
//			
//			date = date.substring(0, 11);
//			date = date.replace("-", ".");
//			
//			clist2.setFreeDate(date);
//			System.out.println(date);
//			
//		}
		
		System.out.println(dto);
		System.out.println(clist);
		
		
		
		

		// 3.
		req.setAttribute("dto", dto);

		req.setAttribute("clist", clist);
		
		
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/freeboardDetail.jsp");
		dispatcher.forward(req, resp);

	}

}