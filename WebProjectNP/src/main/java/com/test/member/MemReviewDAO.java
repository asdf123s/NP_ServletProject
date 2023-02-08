package com.test.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.my.DBUtil;
import com.test.store.reviewDTO;


public class MemReviewDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public MemReviewDAO() {
		conn = DBUtil.open();
	}

//	public reviewDTO reviewList(String seq) {
//		
//		try {
//
//			String sql = "select * from tblReview where memberSeq = ?";
//			
//			pstat = conn.prepareStatement(sql);
//
//			pstat.setString(1, seq);
//
//			rs = pstat.executeQuery();
//
//			while (rs.next()) {
//
//				reviewDTO dto = new reviewDTO();
//
//	        	 dto.setReviewSeq(rs.getString("reviewSeq"));
//	        	 dto.setMemberSeq(rs.getString("memberSeq"));
//	        	 dto.setProductSeq(rs.getString("productSeq"));
//	        	 dto.setReviewScore(rs.getString("reviewScore"));
//	        	 dto.setReviewContent(rs.getString("reviewContent"));
//	        	 dto.setReviewImage(rs.getString("reviewImage"));
//	        	 dto.setReviewRegdate(rs.getString("reviewRegdate"));
//				
//				return dto;
//			}
//
//		} catch (Exception e) {
//			System.out.println("MemReviewDAO.reviewList");
//			e.printStackTrace();
//		}
//		
//		
//		return null;
//	}

	
	

	public ArrayList<reviewDTO> rlist(String seq) {
		
		try {
			
			String sql = "select * from tblReview where memberSeq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<reviewDTO> rlist = new ArrayList<reviewDTO>();
			    
	         while (rs.next()) {
	            
	            // 레코드 1개 > CodeDTO 1개
	        	 reviewDTO dto = new reviewDTO();
	            
	        	 dto.setReviewSeq(rs.getString("reviewSeq"));
	        	 dto.setMemberSeq(rs.getString("memberSeq"));
	        	 dto.setProductSeq(rs.getString("productSeq"));
	        	 dto.setReviewScore(rs.getString("reviewScore"));
	        	 dto.setReviewContent(rs.getString("reviewContent"));
	        	 dto.setReviewImage(rs.getString("reviewImage"));
	        	 dto.setReviewRegdate(rs.getString("reviewRegdate"));
	            
	        	 rlist.add(dto);
	            
	         }
	         
	         return rlist;
			
		} catch (Exception e) {
			System.out.println("MemReviewDAO.reviewList");
			e.printStackTrace();
		}
		
		return null;
	}
	
	//회원 후기정보
		public reviewDTO review(String seq) {

			try {

				String sql = "select \r\n"
						+ "*\r\n"
						+ "from tblreview tr\r\n"
						+ "    inner join tblMember tm\r\n"
						+ "        on tr.memberSeq = tm.memberSeq\r\n"
						+ "            where tr.memberSeq = ? order by reviewRegdate DESC";
				
				pstat = conn.prepareStatement(sql);

				pstat.setString(1, seq);

				rs = pstat.executeQuery();

				while (rs.next()) {

					reviewDTO dto = new reviewDTO();
					
					dto.setMemberSeq(rs.getString("memberSeq"));
					dto.setProductSeq(rs.getString("productSeq"));
					dto.setReviewContent(rs.getString("reviewContent"));
					dto.setReviewScore(rs.getString("reviewScore"));
					dto.setReviewContent(rs.getString("reviewContent"));
					dto.setReviewImage(rs.getString("reviewImage"));
					dto.setReviewRegdate(rs.getString("reviewRegdate"));
					
					return dto;
				}

			} catch (Exception e) {
				System.out.println("MypageDAO.memOrder");
				e.printStackTrace();
			}
			return null;

		}
		
		//별점 구하는 코드
		public ArrayList<reviewDTO> rStar(String seq) {
			
			try {
				
				String sql = "select\r\n"
						+ "    memberSeq,\r\n"
						+ "    reviewScore\r\n"
						+ "from tblReview where memberSeq = ?";
				
				pstat = conn.prepareStatement(sql);
				
				pstat.setString(1, seq);
				
				rs = pstat.executeQuery();
				
				ArrayList<reviewDTO> rStar = new ArrayList<reviewDTO>();
				    
		         while (rs.next()) {
		            
		            // 레코드 1개 > CodeDTO 1개
		        	 reviewDTO dto = new reviewDTO();
		            
		 			dto.setReviewScore(rs.getString("reviewScore"));
						
					rStar.add(dto);
		            
		         }
		         
		     
		         return rStar;
				
			} catch (Exception e) {
				System.out.println("MypageDAO.rStar");
				e.printStackTrace();
			}
			
			return null;
		}
	
}