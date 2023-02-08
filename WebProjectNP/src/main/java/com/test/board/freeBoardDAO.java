package com.test.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.my.DBUtil;

public class freeBoardDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public freeBoardDAO() {
		conn = DBUtil.open();
	}
	
	
	public ArrayList<boardDTO> freeList(HashMap<String, String> map) {
		
		try {

			String sql = "";
			String where = "";

			if (map.get("isSearch").equals("y")) {

				where = String.format("where freeboardtitle like '%%' || '%s' || '%%' or freeboardtxt like '%%' || '%s' || '%%'", map.get("word"), map.get("word"));

			}


			sql = String.format(
					"select b.*, (select count(*) as commentcnt from tblfreecommentboard where FREEBOARDSEQ = b.FREEBOARDSEQ) as commentCnt from (select rownum as rnum, a.* from tblfreeboard a %s) b where rnum between %s and %s",
					where, map.get("begin"), map.get("end"));
			
			pstat = conn.prepareStatement(sql);
			
			rs = pstat.executeQuery();
			
			ArrayList<boardDTO> list = new ArrayList<boardDTO>();
			
			while (rs.next()) {
				
				boardDTO dto = new boardDTO();
				
				dto.setFreeBoardSeq(rs.getString("FREEBOARDSEQ"));
				dto.setFreeBoardTitle(rs.getString("FREEBOARDTITLE"));
				dto.setFreeBoardTxt(rs.getString("FREEBOARDTXT"));
				dto.setFreeBoardImage(rs.getString("FREEBOARDIMG"));
				dto.setFreeBoardChu(rs.getString("FREEBOARDCHU"));
				dto.setFreeBoardDate(rs.getString("FREEBOARDDATE"));
				dto.setMemberSeq(rs.getString("MEMBERSEQ"));
				
				dto.setComment(rs.getString("commentcnt"));
				
				list.add(dto);
				
			}
			
			System.out.println(list);
			
			return list;
			
		} catch (Exception e) {
			System.out.println("freeBoardDAO.freeList");
			e.printStackTrace();
		}
		
		return null;
	}


	public int getTotalCount(HashMap<String, String> map) {
		try {

			String sql = "";
			String where = "";

			if (map.get("isSearch").equals("y")) {

				where = String.format("where freeboardtitle like '%%' || '%s' || '%%' or freeboardtxt like '%%' || '%s' || '%%'", map.get("word"));

			}

			sql = "select count(*) as cnt from tblfreeBoard " + where;

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			if (rs.next()) {
				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			System.out.println("freeBoardDAO.getTotalCount");
			e.printStackTrace();
		}
		return 0;
	}


	public boardDTO get(String seq) {
		try {
			
			String sql = "select b.*, \r\n"
					+ "(select id from tblMember where memberSeq = b.memberSeq) id, \r\n"
					+ "(select count(*) from tblfreecommentboard where freeboardSeq = b.freeboardSeq) cnt\r\n"
					+ "from tblFreeBoard b where freeboardSeq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				boardDTO dto = new boardDTO();
				
				dto.setFreeBoardSeq(rs.getString("FREEBOARDSEQ"));
				dto.setFreeBoardTitle(rs.getString("FREEBOARDTITLE"));
				dto.setFreeBoardTxt(rs.getString("FREEBOARDTXT"));
				dto.setFreeBoardImage(rs.getString("FREEBOARDIMG"));
				dto.setFreeBoardChu(rs.getString("FREEBOARDCHU"));
				dto.setFreeBoardDate(rs.getString("FREEBOARDDATE"));
				dto.setMemberSeq(rs.getString("MEMBERSEQ"));
				
				dto.setComment(rs.getString("cnt"));
				
				dto.setMemberId(rs.getString("id"));
				
				return dto;
				
			}
			
		} catch (Exception e) {
			System.out.println("freeBoardDAO.get");
			e.printStackTrace();
		}
		return null;
	}


	public ArrayList<boardCommentDTO> clist(String boardSeq) {
		
		try {
			
			String sql = "select a.*, (select id from tblMember where memberSeq = a.memberSeq) as id from tblfreeCommentboard a where freeboardSeq = ? order by freeboardseq desc";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, boardSeq);

			rs = pstat.executeQuery();

			ArrayList<boardCommentDTO> clist = new ArrayList<boardCommentDTO>();

			while (rs.next()) {

				boardCommentDTO dto = new boardCommentDTO();
				
				dto.setFreeCommentSeq(rs.getString("freecommentseq"));
				dto.setFreeBoardSeq(rs.getString("freeboardseq"));
				dto.setCommentContent(rs.getString("commentcontent"));
				dto.setMemberSeq(rs.getString("memberseq"));
				dto.setMemberId(rs.getString("id"));
				dto.setFreeDate(rs.getString("freedate"));

				clist.add(dto);

			}

			System.out.println(clist);
			return clist;
			
		} catch (Exception e) {
			System.out.println("freeBoardDAO.clist");
			e.printStackTrace();
		}
		
		return null;
	}


	public int likeAdd(String seq) {
		try {
			
			String sql = "update tblfreeboard set freeboardchu = freeboardchu + 1 where freeboardSeq = ?";
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("freeBoardDAO.likeAdd");
			e.printStackTrace();
		}
		return 0;
	}


	public int likedel(String seq) {
		try {
			
			String sql = "update tblfreeboard set freeboardchu = freeboardchu - 1 where freeboardSeq = ?";
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("freeBoardDAO.likedel");
			e.printStackTrace();
		}
		return 0;
	}


	public int write(boardDTO dto) {
		try {
			
			String sql = "insert into tblfreeBoard (freeboardSeq, freeboardTitle, freeboardTxt, freeboardDate, freeboardimg, freeboardChu, memberSeq, type)"
					+ "values (freeboardSeq.nextVal, ?, ?, default, ?, 0, ?, default)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getFreeBoardTitle());
			pstat.setString(2, dto.getFreeBoardTxt());
			pstat.setString(3, dto.getFreeBoardImage());
			pstat.setString(4, dto.getMemberSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("freeBoardDAO.write");
			e.printStackTrace();
		}
		return 0;
	}


	public int edit(boardDTO dto) {
		try {
			
			String sql = "update tblfreeboard set freeboardTitle = ?, freeboardTxt = ? where freeboardSeq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getFreeBoardTitle());
			pstat.setString(2, dto.getFreeBoardTxt());
			pstat.setString(3, dto.getFreeBoardSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("freeBoardDAO.edit");
			e.printStackTrace();
		}
		return 0;
	}


	public void delAllComment(String boardSeq) {
		try {
			
			String sql = "delete from tblFreeCommentBoard where freeboardSeq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, boardSeq);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("freeBoardDAO.delAllComment");
			e.printStackTrace();
		}
		
	}


	public int del(String boardSeq) {
		try {
			
			String sql = "delete from tblfreeBoard where freeboardSeq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, boardSeq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("freeBoardDAO.del");
			e.printStackTrace();
		}
		return 0;
	}


	public int addComment(boardCommentDTO dto) {
		try {
			
			String sql = "insert into tblfreecommentBoard (freecommentSeq, freeboardSeq, commentContent, memberSeq, freeDate) "
					+ "values (freecommentSeq.nextVal, ?, ?, ?, default)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getFreeBoardSeq());
			pstat.setString(2, dto.getCommentContent());
			pstat.setString(3, dto.getMemberSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("freeBoardDAO.addComment");
			e.printStackTrace();
		}
		return 0;
	}


	public int delComment(String commentSeq) {
		try {
			
			String sql = "delete from tblFreeCommentBoard where FREECOMMENTSEQ = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, commentSeq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("freeBoardDAO.delComment");
			e.printStackTrace();
		}
		return 0;
	}


	public int editComment(boardCommentDTO dto) {
		try {
			
			String sql = "update tblfreecommentboard set commentcontent = ? where freecommentseq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getCommentContent());
			pstat.setString(2, dto.getFreeCommentSeq());
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("freeBoardDAO.editComment");
			e.printStackTrace();
		}
		return 0;
	}
	
	

}
