package com.test.np;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.my.DBUtil;
import com.test.store.productDTO;

public class cartDAO  {
	
	private Connection conn = null;
	private PreparedStatement pstat = null;
	private Statement stat = null;
	private ResultSet rs = null;
	
	public cartDAO() {
		conn = DBUtil.open();
	}

	public boolean insertCart(String productSeq, String memberSeq, String memberOrderCount ) throws SQLException {
		boolean result = false;
		
		String sql = "";
	
		sql = "insert into tblMemberCart values (memberCartSeq.nextVal, ?, ?, ?)";
	
		
		pstat = conn.prepareStatement(sql);
		
		try {
			
			pstat.setString(1, productSeq);
			pstat.setString(2, memberSeq);
			pstat.setString(3, memberOrderCount);
						
				int i = pstat.executeUpdate(); 

				if (i!=0) {
					result = true;
				}
			} catch(Exception e) {
				e.printStackTrace();
			}

			return result;
		}
	
	
	
	public ArrayList<productDTO> selectCart(String memberSeq ) throws SQLException {
		boolean result = false;
		
		ArrayList<productDTO> list = new ArrayList<productDTO>();
		
		String sql = "";
	
		sql = "select a.productSeq, a.productName, a.productPrice, a.memberOrderCount, a.productImage, t.categoryName, s.storeName  from (\r\n"
				+ "select m.memberSeq as memberSeq, m.productSeq as productSeq, sum(m.memberOrderCount) as memberOrderCount , p.productImage, p.productName, p.productPrice, p.categorySeq \r\n"
				+ "from tblmemberCart m, tblProduct p\r\n"
				+ "where m.productSeq = p.productSeq\r\n"
				+ "group by m.memberSeq, m.productSeq, p.productSeq, p.productImage, p.productName, p.productPrice, p.categorySeq\r\n"
				+ ") a, tblCategory t, tblStore s\r\n"
				+ "where a.categorySeq = t.categorySeq\r\n"
				+ " and t.storeSeq = s.storeSeq"
				+ " and a.memberSeq = ?";
	
		
		pstat = conn.prepareStatement(sql);
		
		try {
			
			pstat.setString(1, memberSeq);
						
				rs = pstat.executeQuery(); 

				while(rs.next()) {
					productDTO dto = new productDTO();
					dto.setProductSeq(rs.getString(1));
					dto.setProductName(rs.getString(2));
					dto.setProductPrice(rs.getString(3));
					dto.setMemberOrderCount(rs.getString(4));
					dto.setProductImage(rs.getString(5));
					dto.setCategoryName(rs.getString(6));
					dto.setStoreName(rs.getString(7));
					
					list.add(dto);
				}
			} catch(Exception e) {
				e.printStackTrace();
			}

			return list;
		}
	
	public boolean deleteCart(String productSeq, String memberSeq) throws SQLException {
		boolean result = false;
		
		String sql = "delete from tblMemberCart where productSeq = ? and memberSeq = ?";
		
		pstat = conn.prepareStatement(sql);
		
		System.out.println("productSeq = " +productSeq + " memberSeq = " +memberSeq );
		
		try {
			
			pstat.setString(1, productSeq);
			pstat.setString(2, memberSeq);
						
				int i = pstat.executeUpdate();

				if (i!=0) {
					result = true;
				}
			} catch(Exception e) {
				e.printStackTrace();
			}

			return result;
		}
	
	

	}






