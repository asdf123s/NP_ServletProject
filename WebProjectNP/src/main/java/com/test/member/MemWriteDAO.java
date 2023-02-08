package com.test.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.my.DBUtil;

public class MemWriteDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public MemWriteDAO() {
		conn = DBUtil.open();
	}

	public ArrayList<MemWriteQnaDTO> qlist(String seq) {
		
		try {
			
			String sql = "select \r\n"
					+ "    tqb.qnaBoardSeq,\r\n"
					+ "    tm.memberSeq,\r\n"
					+ "    tqb.qnaBoardTitle,\r\n"
					+ "    tqb.qnaBoardDate\r\n"
					+ "from tblMember tm\r\n"
					+ "    inner join tblQnaBoard tqb\r\n"
					+ "        on tm.memberSeq = tqb.memberSeq\r\n"
					+ "            where tm.memberSeq = ? order by tqb.qnaBoardDate desc";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<MemWriteQnaDTO> qlist = new ArrayList<MemWriteQnaDTO>();
			 
			
	         while (rs.next()) {
	            
	            // 레코드 1개 > CodeDTO 1개
	        	 MemWriteQnaDTO dto = new MemWriteQnaDTO();
	        	 
	        	 dto.setQnaBoardSeq(rs.getString("qnaBoardSeq"));
	        	 dto.setMemberSeq(rs.getString("memberSeq"));
	        	 dto.setQnaBoardTitle(rs.getString("qnaBoardTitle"));
	        	 dto.setQnaBoardDate(rs.getString("qnaBoardDate"));

	        	 qlist.add(dto);
	            
	         }
			
	         
	         
	         return qlist;
			
		} catch (Exception e) {
			System.out.println("MemWriteDAO.Qlist");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<MemWriteFreeDTO> flist(String seq) {
		
		try {
			
			String sql = "select \r\n"
					+ "    tfb.freeBoardSeq,\r\n"
					+ "    tm.memberSeq,\r\n"
					+ "    tfb.freeBoardTitle,\r\n"
					+ "    tfb.freeBoardDate\r\n"
					+ "from tblMember tm\r\n"
					+ "    inner join tblFreeBoard tfb\r\n"
					+ "        on tm.memberSeq = tfb.memberSeq\r\n"
					+ "            where tm.memberSeq = ? order by tfb.freeBoardDate desc\r\n"
					+ "            ";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<MemWriteFreeDTO> flist = new ArrayList<MemWriteFreeDTO>();
			 
			if(true)
	         while (rs.next()) {
	            
	            // 레코드 1개 > CodeDTO 1개
	        	 MemWriteFreeDTO dto = new MemWriteFreeDTO();
	        	 
	        	 dto.setFreeBoardSeq(rs.getString("freeBoardSeq"));
	        	 dto.setMemberSeq(rs.getString("memberSeq"));
	        	 dto.setFreeBoardTitle(rs.getString("freeBoardTitle"));
	        	 dto.setFreeBoardDate(rs.getString("freeBoardDate"));

	        	 flist.add(dto);
	            
	         }
			
	         
	         return flist;
			
		} catch (Exception e) {
			System.out.println("MemWriteDAO.flist");
			e.printStackTrace();
		}
		
		return null;
	}

}
