package com.test.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.my.DBUtil;


public class noticeDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public noticeDAO() {
		conn = DBUtil.open();
	}

//	목록
	public ArrayList<noticeDTO> list() {
		try {
			
			String sql ="select * from tblNotice order by noticeSeq desc";
			
			
			pstat = conn.prepareStatement(sql);
			
			rs = pstat.executeQuery();
			
			ArrayList<noticeDTO> list = new ArrayList<noticeDTO>();
			
			while (rs.next()) {
				
				noticeDTO dto = new noticeDTO();
				
				dto.setNoticeSeq(rs.getNString("noticeseq"));
				dto.setAdminSeq(rs.getString("adminseq"));
				dto.setNoticeSubject(rs.getNString("noticesubject"));
				dto.setNoticeContent(rs.getNString("noticecontent"));
				dto.setNoticeRegdate(rs.getNString("noticeregdate"));
				dto.setNoticeImg(rs.getNString("noticeimg"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("noticeDAO.list");
			e.printStackTrace();
		}
		return null;
	}

	//디테일
	public noticeDTO get(String noticeSeq) {

		try {
			
			String sql = "select * from tblNotice where noticeSeq = ?";
			
//			System.out.println(noticeSeq);
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, noticeSeq);
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				
				noticeDTO dto = new noticeDTO();
				
				dto.setNoticeSeq(rs.getNString("noticeseq"));
				dto.setAdminSeq(rs.getString("adminseq"));
				dto.setNoticeSubject(rs.getNString("noticesubject"));
				dto.setNoticeContent(rs.getNString("noticecontent"));
				dto.setNoticeRegdate(rs.getNString("noticeregdate"));
				dto.setNoticeImg(rs.getNString("noticeimg"));

				return dto;
				
			}
			
		} catch (Exception e) {
			System.out.println("noticeDAO.get");
			e.printStackTrace();
		}
		return null;
	}
	
	
	
}
