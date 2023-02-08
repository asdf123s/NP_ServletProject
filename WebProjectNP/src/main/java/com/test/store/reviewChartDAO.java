package com.test.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.my.DBUtil;



public class reviewChartDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public reviewChartDAO() {
		conn = DBUtil.open();
	}

//	차트
	public ArrayList<reviewChartDTO> listReviewChart(String productSeq) {

		try {
			
			String sql = "select reviewScore, count(*) as cnt from tblReview where productSeq = ? group by reviewScore order by reviewScore";
			
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, productSeq);
			
			rs = pstat.executeQuery();
			
			ArrayList<reviewChartDTO> chart = new ArrayList<reviewChartDTO>();
			
			while(rs.next()) {
				
				reviewChartDTO dto = new reviewChartDTO();
				
				dto.setReviewScore(rs.getString("reviewScore"));
				dto.setCnt(rs.getInt("cnt"));
				
				chart.add(dto);
			}
			
			return chart;
			
		} catch (Exception e) {
			System.out.println("reviewChartDAO.listReviewChart");
			e.printStackTrace();
		}
		return null;
	}

}
