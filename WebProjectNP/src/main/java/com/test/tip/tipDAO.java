package com.test.tip;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.my.DBUtil;
import com.test.tip.tipDTO;

public class tipDAO {

private Connection conn = null;
private PreparedStatement pstat = null;
private Statement stat = null;
private ResultSet rs = null;

public tipDAO() {
	conn = DBUtil.open();
}
	
	public ArrayList<tipDTO> selectTip() throws SQLException {
		ArrayList<tipDTO> list = new ArrayList<tipDTO>();		
		
		String sql = "SELECT tipSeq, adminSeq, tipSubject, tipContent, tipRegdate, tipImg FROM tblTip ORDER BY tipRegdate desc";
		pstat = conn.prepareStatement(sql);
		
		try {
			
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				tipDTO dto = new tipDTO();
				dto.setTipSeq(rs.getString(1));
				dto.setAdminSeq(rs.getString(2)); //DB자료형에 따라 달라짐
				dto.setTipSubject(rs.getString(3));
				dto.setTipContent(rs.getString(4));
				dto.setTipContent(dto.getTipContent().substring(0, 40)+ "...");				
				dto.setTipRegdate(rs.getString(5));
				dto.setTipImg(rs.getString(6));
				
				list.add(dto);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public tipDTO selectTipDetail(String TipDetailSeq) throws SQLException {	
		tipDTO dto = new tipDTO();
		
		String sql = "SELECT tipSeq, adminSeq, tipSubject, tipContent, TO_CHAR(tipRegdate, 'YYYY-MM-DD'), tipImg FROM tblTip where tipSeq = ?";
		pstat = conn.prepareStatement(sql);
		
		try {
			
			pstat.setString(1,TipDetailSeq);
			
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				
				dto.setTipSeq(rs.getString(1));
				dto.setAdminSeq(rs.getString(2)); //DB자료형에 따라 달라짐
				dto.setTipSubject(rs.getString(3));
				dto.setTipContent(rs.getString(4));			
				dto.setTipRegdate(rs.getString(5));
				dto.setTipImg(rs.getString(6));
				
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
