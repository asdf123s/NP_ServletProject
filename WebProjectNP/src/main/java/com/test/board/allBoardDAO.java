package com.test.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.my.DBUtil;


public class allBoardDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public allBoardDAO() {
		conn = DBUtil.open();
	}
	
	
	public ArrayList<allBoardDTO> allList(HashMap<String, String> map) {
		try {
			
			String sql = "";
			String where = "";
			String where2 = "";

			if (map.get("isSearch").equals("y")) {

				where = String.format("where freeboardtitle like '%%' || '%s' || '%%' or freeboardtxt like '%%' || '%s' || '%%'", map.get("word"), map.get("word"));
				where2 = String.format("where qnaboardtitle like '%%' || '%s' || '%%' or qnaboardtxt like '%%' || '%s' || '%%'", map.get("word"), map.get("word"));

			}


			sql = String.format(
					"select b.* from \r\n"
					+ "(select rownum as rnum, a.* from\r\n"
					+ "    (select freeboardSeq as \"boardSeq\", freeboardTitle as \"title\", freeboardTxt as \"txt\", freeboardDate as \"date\", \r\n"
					+ "        (select count(*) from tblfreecommentboard where freeboardSeq = tblFreeBoard.freeboardSeq) as \"comment\", type\r\n"
					+ "    from tblFreeBoard %s union\r\n"
					+ "    select qnaboardSeq as \"boardSeq\", qnaboardTitle as \"title\", qnaboardTxt as \"txt\", qnaboardDate as \"date\", \r\n"
					+ "        (select count(*) from tblQnaComment where qnaboardSeq = tblQnaBoard.qnaboardSeq) as \"comment\", type\r\n"
					+ "    from tblQnaBoard %s) a) b\r\n"
					+ "where rnum between %s and %s",
					where, where2, map.get("begin"), map.get("end"));
			
			pstat = conn.prepareStatement(sql);
			
			rs = pstat.executeQuery();
			
			ArrayList<allBoardDTO> list = new ArrayList<allBoardDTO>();
			
			while (rs.next()) {
				
				allBoardDTO dto = new allBoardDTO();
				
				dto.setRnum(rs.getString("rnum"));
				dto.setSeq(rs.getString("boardSeq"));
				dto.setTitle(rs.getString("title"));
				dto.setTxt(rs.getString("txt"));
				dto.setRegdate(rs.getString("date"));
				dto.setComment(rs.getString("comment"));
				dto.setType(rs.getString("type"));
				
				list.add(dto);
				
			}
			
			System.out.println(list);
			
			return list;
			
		} catch (Exception e) {
			System.out.println("allBoardDAO.allList");
			e.printStackTrace();
		}
		return null;
	}


	public int getTotalCount(HashMap<String, String> map) {
		try {
			
			
			String sql = "";
			String where = "";
			String where2 = "";

			if (map.get("isSearch").equals("y")) {

				where = String.format("where freeboardtitle like '%%' || '%s' || '%%' or freeboardtxt like '%%' || '%s || '%%'", map.get("word"), map.get("word"));
				where2 = String.format("where qnaboardtitle like '%%' || '%s' || '%%' or qnaboardtxt like '%%' || '%s' || '%%'", map.get("word"), map.get("word"));
				
			}

			sql = String.format("select count(*) as cnt from (\r\n"
					+ "select freeboardSeq as \"boardSeq\", freeboardTitle as \"title\", freeboardTxt as \"txt\", freeboardDate as \"date\", \r\n"
					+ "(select count(*) from tblfreecommentboard where freeboardSeq = tblFreeBoard.freeboardSeq) as \"comment\", type\r\n"
					+ "from tblfreeboard %s union\r\n"
					+ "select qnaboardSeq as \"boardSeq\", qnaboardTitle as \"title\", qnaboardTxt as \"txt\", qnaboardDate as \"date\", \r\n"
					+ "(select count(*) from tblQnaComment where qnaboardSeq = tblQnaBoard.qnaboardSeq) as \"comment\", type\r\n"
					+ "from tblQnaBoard %s)", where, where2);

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
			
		} catch (Exception e) {
			System.out.println("allBoardDAO.getTotalCount");
			e.printStackTrace();
		}
		return 0;
	}

}
