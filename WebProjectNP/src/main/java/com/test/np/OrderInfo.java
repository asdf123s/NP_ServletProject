package com.test.np;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.member.memberDAO;
import com.test.member.memberDTO;
import com.test.store.productDAO;
import com.test.store.productDTO;

@WebServlet("/orderInfo.do")
public class OrderInfo extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String productSeq = req.getParameter("productSeq");
		String productCount= req.getParameter("productCount");
		String flag = req.getParameter("flag");		
		
		req.setAttribute("productSeq", productSeq);
		
		productDAO dao = new productDAO();
		
		HttpSession session = req.getSession();
		String memberSeq = (String)session.getAttribute("memberSeq");
		
		if (flag.equals("store")) {			
			productDTO dto = dao.get(productSeq);			
			dto.setMemberOrderCount(productCount);	
			req.setAttribute("dto", dto);
			req.setAttribute("flag", "one");
		} else {
			String seq[] = productSeq.split("@");
			String count[] = productCount.split("@");
			
			if (seq.length == 1) {
				productDTO dto = dao.get(seq[0]);
				dto.setMemberOrderCount(count[0]);	
				req.setAttribute("dto", dto);
				req.setAttribute("flag", "one");
				
			} else {
				ArrayList<productDTO> list = new ArrayList<productDTO>();
				int allPrice = 0;
				for (int i=0; i<seq.length; i++) {
					productDTO dto = dao.get(seq[i]);
					dto.setMemberOrderCount(count[i]);
					
					allPrice += Integer.parseInt(dto.getProductPrice()) *Integer.parseInt(count[i]);
					
					
					list.add(dto);
					
					req.setAttribute("flag", "two");
				}
				req.setAttribute("allPrice", allPrice);
				req.setAttribute("list", list);
			}
		}	
		
		memberDAO mdao = new memberDAO();
		try {
			memberDTO mdto = mdao.memInfo(memberSeq);			
			
			req.setAttribute("mdto", mdto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		RequestDispatcher dispacher = req.getRequestDispatcher("/WEB-INF/views/store/orderInfo.jsp");
		dispacher.forward(req, resp);
	}

}