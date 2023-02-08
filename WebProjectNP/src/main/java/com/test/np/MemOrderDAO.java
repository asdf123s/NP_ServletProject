package com.test.np;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.my.DBUtil;

public class MemOrderDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public MemOrderDAO() {
		conn = DBUtil.open();
	}

	public ArrayList<orderProductDTO> olist(String seq) {
		

		try {
			
			String sql = "select\r\n"
					+ "    tmo.memberSeq,\r\n"
					+ "    tmo.memberBuyDate,\r\n"
					+ "    tmo.memberDestination,\r\n"
					+ "    tp.productSeq,\r\n"
					+ "    tp.productName,\r\n"
					+ "    tp.productPrice,\r\n"
					+ "    tp.productImage\r\n"
					+ "from tblMemberOrder tmo\r\n"
					+ "            inner join tblProduct tp\r\n"
					+ "                on tmo.productSeq = tp.productSeq\r\n"
					+ "                    where memberSeq = ? order by tmo.memberBuyDate desc\r\n"
					+ "\r\n"
					+ "";
			
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<orderProductDTO> olist = new ArrayList<orderProductDTO>();
			    
			
	         while (rs.next()) {
	            
	            // 레코드 1개 > CodeDTO 1개
	        	 orderProductDTO dto = new orderProductDTO();
	            
	 			dto.setMemberSeq(rs.getString("memberSeq"));
				dto.setMemberBuyDate(rs.getString("memberBuyDate"));
				dto.setMemberDestination(rs.getString("memberDestination"));
				dto.setProductSeq(rs.getString("productSeq"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getString("productPrice"));
				dto.setProductImage(rs.getString("productImage"));
					
	        	olist.add(dto);
	            
	         }
	         
	         return olist;
			
		} catch (Exception e) {
			System.out.println("MemOrderDAO.olist");
			e.printStackTrace();
		}
		
		return null;
	}
	
	public boolean insertMemOrder(orderProductDTO dto) {
		boolean result = false;

		try {
			
			String sql = "insert into tblMemberOrder values (memberOrderSeq.nextVal, ?, 1, ?, ?, ?, sysdate, ?)" ;
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getMemberSeq());
			pstat.setString(2, dto.getAddr());
			pstat.setString(3, dto.getComment());
			pstat.setString(4, dto.getName());
			pstat.setString(5, dto.getProductSeq());
			
			int i = pstat.executeUpdate();
			    
			
	        if (i!=0) {
	            result = true;
	         }
			
		} catch (Exception e) {
			System.out.println("MemOrderDAO.olist");
			e.printStackTrace();
		}
		return result;
	}
	

}
