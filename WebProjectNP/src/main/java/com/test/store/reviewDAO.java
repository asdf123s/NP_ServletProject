package com.test.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.my.DBUtil;



public class reviewDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public reviewDAO() {
		conn = DBUtil.open();
	}

	// 후기 상세
	public reviewDTO get(String reviewSeq) {

		try {

			String sql = "select * from tblProduct where productSeq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, reviewSeq);

			rs = pstat.executeQuery();

			if (rs.next()) {

				reviewDTO dto = new reviewDTO();
				
				dto.setMemberSeq("memberseq");
				dto.setName("name");
				dto.setProductSeq("productseq");
				dto.setReviewContent("reviewcontent");
				dto.setReviewImage("reviewimage"); 
				dto.setReviewRegdate("reviewregdate");
				dto.setReviewScore("reviewscore");
				dto.setReviewSeq("reviewseq");
				
				return dto;
			}

		} catch (Exception e) {
			System.out.println("reviewDAO.get");
			e.printStackTrace();
		}
		
		return null;
	}

	//후기 작성 
	public int reviewAdd(reviewDTO dto) {

		try {
			
			String sql ="insert into tblReview (reviewseq, memberseq, productseq, reviewscore, reviewcontent, reviewImage, reviewRegdate) values (reviewseq.nextVal, ?, ?, ?, ?, ?, default)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getMemberSeq());
			pstat.setString(2, dto.getProductSeq());
			pstat.setString(3, dto.getReviewScore());
			pstat.setString(4, dto.getReviewContent());
			pstat.setString(5, dto.getReviewImage());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("reviewDAO.reviewAdd");
			e.printStackTrace();
		}
		return 0;
	}

	//후기 목록 보여주기
	public ArrayList<reviewDTO> reviewList(String productSeq) {
		
		try {
			
			String sql ="select reviewSeq, productSeq, (select name from tblMember where memberSeq = tblReview.memberSeq) as name, reviewScore, reviewContent, reviewImage, reviewRegdate from tblReview where productSeq = ? order by reviewRegdate desc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, productSeq);
			
			rs = pstat.executeQuery();
			
			ArrayList<reviewDTO> reviewList = new ArrayList<reviewDTO>();
			
			while (rs.next()) {
				
				reviewDTO dto = new reviewDTO();
				
				dto.setReviewContent(rs.getString("reviewcontent"));
				dto.setReviewImage(rs.getString("reviewimage"));
				dto.setReviewScore(rs.getString("reviewscore"));
				dto.setReviewSeq(rs.getString("reviewseq"));
				dto.setProductSeq(rs.getString("productseq"));
				dto.setReviewRegdate(rs.getString("reviewregdate"));
				
				dto.setName(rs.getString("name"));
				
				
				reviewList.add(dto);
			}
			
			return reviewList;
			
		} catch (Exception e) {
			System.out.println("reviewDAO.reviewList");
			e.printStackTrace();
		}
		
		return null;
	}

	
	//후기 개수...
	public reviewDTO reviewCnt(String productSeq) {
		
try {
			
			String sql ="select productSeq, count(*) as reviewCnt from tblReview where productSeq = ? group by productSeq";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, productSeq);
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				
				reviewDTO dto = new reviewDTO();
				
				dto.setReviewCnt(rs.getInt("reviewCnt"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("reviewDAO.reviewList");
			e.printStackTrace();
		}

		return null;
	}

	//후기평균
	public reviewDTO reviewAvg(String productSeq) {

		try {
						
			String sql ="select productSeq, round(avg(reviewScore)) as reviewAvg from tblReview where productSeq = ? group by productSeq";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, productSeq);
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				
				reviewDTO avg = new reviewDTO();
				
				avg.setReviewAvg(rs.getInt("reviewAvg"));
				
				return avg;
			}
			
		} catch (Exception e) {
			System.out.println("reviewDAO.reviewAvg");
			e.printStackTrace();
		}
		return null;
	}


	
}
