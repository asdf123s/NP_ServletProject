package com.test.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.my.DBUtil;



public class productDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public productDAO() {
		conn = DBUtil.open();
	}
	
	//특정 상품 상세 부분 보여주기
	public productDTO get(String productSeq) {

		try {

			String sql = "select * from tblProduct where productSeq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, productSeq);

			rs = pstat.executeQuery();

			if (rs.next()) {

				productDTO dto1 = new productDTO();
				
				dto1.setProductSeq(rs.getString("productseq"));
				dto1.setProductName(rs.getString("productname"));
				dto1.setProductInventory(rs.getString("productinventory"));
				dto1.setProductPrice(rs.getString("productprice"));
				dto1.setProductImage(rs.getString("productimage"));
				dto1.setProductDetailImage(rs.getString("productdetailimage"));
				dto1.setCategorySeq(rs.getString("categoryseq"));
				
				
				return dto1;
			}

		} catch (Exception e) {
			System.out.println("productDAO.get");
			e.printStackTrace();
		}
		return null;
	}

	
}
