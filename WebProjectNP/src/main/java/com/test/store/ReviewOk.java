package com.test.store;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/store/reviewOk.do")
public class ReviewOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		HttpSession session = req.getSession();

		//1.
		req.setCharacterEncoding("UTF-8");
		//req.getParameter("reviewScore");
		
		//파일
		MultipartRequest multi = null;
		
		String path = req.getRealPath("/asset/pic");
		int size = 1024 * 1024 * 100;

		System.out.println(path); // 확인용

		multi = new MultipartRequest(
					req, 
					path, 
					size, 
					"UTF-8", 
					new DefaultFileRenamePolicy()
				);
		
		
		HttpSession session = req.getSession();
		String memberSeq = multi.getParameter("memberSeq");
		String productSeq = multi.getParameter("productSeq");
		String reviewScore = multi.getParameter("reviewScore");
		String reviewContent = multi.getParameter("reviewContent");
		String reviewImage = multi.getFilesystemName("attach");
		
		//2. 
		reviewDTO dto = new reviewDTO();
		
//		dto.setMemberSeq((String)session.getAttribute("name")); //이부분 고려
		dto.setMemberSeq(memberSeq);
		dto.setProductSeq(productSeq);
		dto.setReviewScore(reviewScore);
		dto.setReviewContent(reviewContent);
		dto.setReviewImage(reviewImage); //파일
		
		reviewDAO dao = new reviewDAO();
		
		int result = dao.reviewAdd(dto);
		
		//4.
		if(result == 1) {
			//후기 등록하고 갈 페이지
			resp.sendRedirect("/np/store/prdDetail.do?seq=" + productSeq);
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>");
			writer.print("alert('failed');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.close();
		}


	}

}

