package com.test.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.test.store.productDTO;

@WebServlet("/admin/prdEditOk.do")
public class PrdEditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
req.setCharacterEncoding("UTF-8");
		
		MultipartRequest multi = null;
		HttpSession session = req.getSession();
		
		String path = req.getRealPath("/asset/images");
		
		session.setAttribute("path", path);

		int size = 1024*1024*100; //100메가
		
		
		multi = new MultipartRequest(req,
									path,
									size,
									"UTF-8",
									new DefaultFileRenamePolicy());
		
		String prdImg = multi.getFilesystemName("prdImg");
		String prdDetailImg = multi.getFilesystemName("prdDetailImg");
		String name = multi.getParameter("name");
		String price = multi.getParameter("price");
		String invetory = multi.getParameter("inventory");
		String category = multi.getParameter("category");
		String seq = multi.getParameter("seq");

		
		productDTO dto = new productDTO();
		
		category = category.substring(1,category.length()-1);
		
		dto.setCategorySeq(category);
		dto.setProductImage(prdImg);
		dto.setProductDetailImage(prdDetailImg);
		dto.setProductPrice(price);
		dto.setProductInventory(invetory);
		dto.setProductName(name);
		dto.setProductSeq(seq);
		
		AdminDAO dao = new AdminDAO();
		
		System.out.println(dto);
		
		int result = dao.EditProduct(dto);
		
		if(result == 1) {
			resp.sendRedirect("/np/admin/productViewDetail.do?seq="+seq);
		}else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>");
			writer.print("alert('상품수정에 실패했습니다.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.close();
		}
		
		
		
	}

}