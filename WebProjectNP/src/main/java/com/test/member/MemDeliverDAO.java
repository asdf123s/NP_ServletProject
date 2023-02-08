package com.test.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.test.my.DBUtil;

public class MemDeliverDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public MemDeliverDAO() {
		conn = DBUtil.open();
	}

//	public MemDeliverDTO dlist(String seq) {
//		
//		try {
//
//			String sql = "select \r\n"
//					+ "*\r\n"
//					+ "from tblMemberOrder tmo\r\n"
//					+ "    inner join tblDeliver td\r\n"
//					+ "        on tmo.memberDeliverySeq = td.memberDeliverySeq\r\n"
//					+ "            where tmo.memberSeq = ? order by  memberBuyDate desc";
//
//			pstat = conn.prepareStatement(sql);
//
//			pstat.setString(1, seq);
//
//			rs = pstat.executeQuery();
//
//			if (rs.next()) {
//
//				MemDeliverDTO dto = new MemDeliverDTO();
//				
//				dto.setMemberOrderSeq(rs.getString("memberOrderSeq"));
//				dto.setMemberSeq(rs.getString("memberSeq"));
//				dto.setMemberCartSeq(rs.getString("memberCartSeq"));
//				dto.setMemberDeliverySeq(rs.getString("memberDeliverySeq"));
//				dto.setMemberDestination(rs.getString("memberDestination"));
//				dto.setMemberRequest(rs.getString("memberRequest"));
//				dto.setRecipient(rs.getString("recipient"));
//				dto.setMemberPayment(rs.getString("memberPayment"));
//				dto.setMemberBuyDate(rs.getString("memberBuyDate"));
//				dto.setDeliver(rs.getString("deliver"));
//
//				return dto;
//				
//			}
//
//		}  catch (Exception e) {
//			System.out.println("MemDeliverDAO.dlist");
//			e.printStackTrace();
//		}
//		
//		return null;
//	}
	
	public List<HashMap<String, String>> dstate(String seq) {
		
		List<HashMap<String, String>> dstate = null;
		
		try {

			String sql = "select \r\n"
					+ "    tmo.memberDeliverySeq,\r\n"
					+ "    tmo.memberSeq,\r\n"
					+ "    tmo.memberBuyDate,\r\n"
					+ "    td.deliver\r\n"
					+ "from tblMemberOrder tmo\r\n"
					+ "    inner join tblDeliver td\r\n"
					+ "        on tmo.memberDeliverySeq = td.memberDeliverySeq\r\n"
					+ "            where tmo.memberSeq = ?";

			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			dstate = new ArrayList<HashMap<String, String>>();
			
			while(rs.next()) {
				
				HashMap<String, String> map = new HashMap<String, String>();
				
				map.put("memberDeliverySeq", rs.getString("memberDeliverySeq"));
				map.put("memberSeq", rs.getString("memberSeq"));
				map.put("memberBuyDate", rs.getString("memberBuyDate"));
				map.put("deliver", rs.getString("deliver"));
				
				
				dstate.add(map);
			}
			
			
		} catch (Exception e) {
			System.out.println("MypageDAO.addMoney");
			e.printStackTrace();
		}
		return dstate;
		
		
	}

	public ArrayList<MemDeliverDTO> dlist(String seq) {
		
try {
			
			String sql = "select\r\n"
					+ "*\r\n"
					+ "from tblMemberOrder tmo\r\n"
					+ "    inner join tblDeliver td\r\n"
					+ "        on tmo.memberDeliverySeq = td.memberDeliverySeq\r\n"
					+ "                    inner join tblProduct tp\r\n"
					+ "                        on tmo.productSeq = tp.productSeq\r\n"
					+ "                            where tmo.memberSeq = ?  order by  memberBuyDate desc";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<MemDeliverDTO> dlist = new ArrayList<MemDeliverDTO>();
			 
			
	         while (rs.next()) {
	            
	            // 레코드 1개 > CodeDTO 1개
	        	 MemDeliverDTO dto = new MemDeliverDTO();
	        	 
					dto.setMemberOrderSeq(rs.getString("memberOrderSeq"));
					dto.setMemberSeq(rs.getString("memberSeq"));

					dto.setMemberDeliverySeq(rs.getString("memberDeliverySeq"));
					dto.setMemberDestination(rs.getString("memberDestination"));
					dto.setMemberRequest(rs.getString("memberRequest"));
					dto.setRecipient(rs.getString("recipient"));

					dto.setMemberBuyDate(rs.getString("memberBuyDate"));
					dto.setDeliver(rs.getString("deliver"));
					dto.setProductSeq(rs.getString("productSeq"));
					dto.setProductName(rs.getString("productName"));
					dto.setProductPrice(rs.getString("productPrice"));
					dto.setProductImage(rs.getString("productImage"));

	        	 dlist.add(dto);
	            
	         }
	         
	         return dlist;
			
		} catch (Exception e) {
			System.out.println("MemDeliverDAO.dlist");
			e.printStackTrace();
		}
		
		return null;
	}

	
	
}



