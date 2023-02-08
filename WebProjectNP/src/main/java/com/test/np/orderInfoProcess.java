package com.test.np;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.member.memberDAO;
import com.test.member.memberDTO;
import com.test.member.orderProductDTO;

@WebServlet("/orderInfoProcess.do")
public class orderInfoProcess extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean result = false;
		String productSeq = req.getParameter("productSeq");
		String comment = req.getParameter("commnet");
		HttpSession session = req.getSession();
		String memberSeq = (String)session.getAttribute("memberSeq");
		String name = (String)session.getAttribute("name");
		
		String seq[] = productSeq.split("@");
		
		System.out.println(seq.length);
		
		cartDAO dao = new cartDAO();
		MemOrderDAO odao = new MemOrderDAO();
		memberDAO mdao = new memberDAO();
		memberDTO mdto = new memberDTO();
		try {
			mdto = mdao.memInfo(memberSeq);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		com.test.np.orderProductDTO dto = new com.test.np.orderProductDTO();
		
		dto.setName(name);
		dto.setAddr(mdto.getAddr2() + " " + mdto.getAddr3());
		dto.setComment(comment);
		dto.setMemberSeq(memberSeq);
		
		if (seq.length == 1) {
			try {
				result = dao.deleteCart(seq[0], memberSeq);
				
				if (result) {
					dto.setProductSeq(seq[0]);
					result = odao.insertMemOrder(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			
			for (int i=0; i<seq.length; i++) {
				try {
					result = dao.deleteCart(seq[i], memberSeq);
					
					if (result) {
						dto.setProductSeq(seq[i]);
						result = odao.insertMemOrder(dto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		resp.sendRedirect("memOrder.do");
	}

}