package com.test.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.my.DBUtil;


	public class likeProductDAO {
		
		private Connection conn;
		private Statement stat;
		private PreparedStatement pstat;
		private ResultSet rs;

		public likeProductDAO() {
			conn = DBUtil.open();
		}

		public ArrayList<likeProductDTO> likeList(String seq) {
			
			try {
				
				String sql = "select\r\n"
						+ "    tm.memberSeq,\r\n"
						+ "    tp.productName,\r\n"
						+ "    tp.productPrice,\r\n"
						+ "    tp.productSeq,\r\n"
						+ "    tl.likeProductSeq,\r\n"
						+ "    tp.productImage\r\n"
						+ "from tblMember tm\r\n"
						+ "    inner join tblLikeProduct tl\r\n"
						+ "        on tm.memberSeq = tl.memberSeq\r\n"
						+ "            inner join tblProduct tp\r\n"
						+ "                on tl.productSeq = tp.productSeq\r\n"
						+ "                    where tm.memberSeq = ?";
				
				pstat = conn.prepareStatement(sql);
				
				pstat.setString(1, seq);
				
				rs = pstat.executeQuery();
				
				ArrayList<likeProductDTO> likeList = new ArrayList<likeProductDTO>();
				    
				
		         while (rs.next()) {
		            
		            // 레코드 1개 > CodeDTO 1개
		        	 likeProductDTO dto = new likeProductDTO();
		            
		        	dto.setLikeProductSeq(rs.getString("likeProductSeq"));
		 			dto.setMemberSeq(rs.getString("memberSeq"));
					dto.setProductSeq(rs.getString("productSeq"));
					dto.setProductName(rs.getString("productName"));
					dto.setProductPrice(rs.getString("productPrice"));
					dto.setProductImage(rs.getString("productImage"));
						
					likeList.add(dto);
		            
		         }
		         
		         return likeList;
				
			} catch (Exception e) {
				System.out.println("likeProductDAO.likeList");
				e.printStackTrace();
			}
			
			return null;
		}
		
		public int del(String seq, String product) {
			
			try {
				
				String sql = "delete from tblLikeProduct where memberSeq = ? and productSeq in (?)";
				pstat = conn.prepareStatement(sql);
				
				pstat.setString(1, seq);
				pstat.setString(2, product);
				
				System.out.println(seq + product);
				
				return pstat.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("likeProductDAO.del");
				e.printStackTrace();
			}
			
			return 0;
		}
		
		
	
}
