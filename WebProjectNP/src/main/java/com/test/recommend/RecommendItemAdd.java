package com.test.recommend;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.test.store.productDTO;

@WebServlet("/recommend/recommendItemAdd.do")
public class RecommendItemAdd extends HttpServlet {
	
	public static ArrayList<productDTO> list = new ArrayList<productDTO>();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		
		RecommendDAO dao = new RecommendDAO();
		
		productDTO dto = dao.recommendAddItem(seq);
		
		list.add(dto);
		
		JSONArray addedItem = new JSONArray();
		
		for(productDTO d : list) {
			JSONObject obj = new JSONObject();
			
			obj.put("productSeq", d.getProductSeq());
			obj.put("productImage", d.getProductImage());
			obj.put("productName", d.getProductName());
			
			addedItem.add(obj);
		}
		
		PrintWriter writer = resp.getWriter();
		
		writer.print(addedItem);
		
		writer.close();
		
		
		
		
	}

}
