package com.test.recommend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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

@WebServlet("/recommend/recommendSearch.do")
public class RecommendSearch extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		String word = req.getParameter("word");
		
		ArrayList<productDTO> list = new ArrayList<productDTO>();
		
		RecommendDAO dao = new RecommendDAO();
		
		
		list = dao.getSearch(word);
		
		int count = 0;
		count = dao.getSearchCount(word);
		
		JSONArray searchItem = new JSONArray();
		
		if(list != null) {
			for(productDTO dto : list) {
				JSONObject obj = new JSONObject();
				
				obj.put("productName", dto.getProductName());
				obj.put("productPrice", dto.getProductPrice());
				obj.put("productImage", dto.getProductImage());
				obj.put("productSeq", dto.getProductSeq());
				obj.put("productCount", count);
				
				searchItem.add(obj);
			}
		}


		PrintWriter writer = resp.getWriter();
		
		writer.print(searchItem);
		
		
		writer.close();
	
		
		

	}

}