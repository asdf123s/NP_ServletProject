package com.test.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.my.DBUtil;

public class qnaBoardDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public qnaBoardDAO() {
		conn = DBUtil.open();
	}
	
	public ArrayList<qnaBoardDTO> qnaList(HashMap<String, String> map) {
		try {
			
			String sql = "";
			String where = "";

			if (map.get("isSearch").equals("y")) {

				where = String.format("where qnaboardtitle like '%%' || '%s' || '%%' or qnaboardtxt like '%%' || '%s' || '%%'", map.get("word"), map.get("word"));

			}


			sql = String.format(
					"select b.*, \r\n"
					+ "(select count(*) as commentcnt from tblqnacomment where qnaboardseq = b.qnaboardseq) as commentCnt, \r\n"
					+ "(select qnacategoryname from tblqnacategory where qnacategoryseq = b.qnacategoryseq) as category\r\n"
					+ "from (select rownum as rnum, a.* from tblqnaboard a %s where qnacategorySeq = %s) b where rnum between %s and %s",
					where, map.get("categorySeq"), map.get("begin"), map.get("end"));
			
			System.out.println(sql);
			
			pstat = conn.prepareStatement(sql);
			
			rs = pstat.executeQuery();
			
			ArrayList<qnaBoardDTO> list = new ArrayList<qnaBoardDTO>();
			
			while (rs.next()) {
				
				qnaBoardDTO dto = new qnaBoardDTO();
				
				dto.setQnaBoardSeq(rs.getString("qnaBoardSeq"));
				dto.setQnaBoardTitle(rs.getString("qnaBoardTitle"));
				dto.setQnaBoardTxt(rs.getString("qnaBoardTxt"));
				dto.setQnaCategorySeq(rs.getString("qnaCategorySeq"));
				dto.setQnaBoardImg(rs.getString("qnaBoardImg"));
				dto.setQnaBoardDate(rs.getString("qnaBoardDate"));
				dto.setQnaBoardChu(rs.getString("qnaBoardChu"));
				dto.setMemberSeq(rs.getString("memberSeq"));
				
				dto.setComment(rs.getString("commentcnt"));
				
				dto.setQnaCategory(rs.getString("category"));
				
				list.add(dto);
				
			}
			
			System.out.println(list);
			
			return list;
			
		} catch (Exception e) {
			System.out.println("qnaBoardDAO.qnaList");
			e.printStackTrace();
		}
		return null;
	}

	public int getTotalCount(HashMap<String, String> map) {
		try {
			
			String sql = "";
			String where = "";

			if (map.get("isSearch").equals("y")) {

				where = String.format("where qnaboardtitle like '%%' || '%s' || '%%' or qnaboardtxt like '%%' || '%s' || '%%'", map.get("word"), map.get("word"));

			} else {
				
				where = String.format("where qnaCategorySeq = %s", map.get("categorySeq"));
			
			}
			

			sql = "select count(*) as cnt from tblqnaBoard " + where;

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("qnaBoardDAO.getTotalCount");
			e.printStackTrace();
		}
		return 0;
	}

	public qnaBoardDTO get(String boardSeq) {

		try {

			String sql = "select b.*, (select id from tblMember where memberSeq = b.memberSeq) id,\r\n"
					+ "(select count(*) from tblqnaComment where qnaboardSeq = b.qnaboardSeq) cnt,\r\n"
					+ "(select qnacategoryname from tblqnaCategory where qnacategorySeq = b.qnacategorySeq) category\r\n"
					+ "from tblQnaBoard b where qnaboardSeq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, boardSeq);

			rs = pstat.executeQuery();

			if (rs.next()) {

				qnaBoardDTO dto = new qnaBoardDTO();

				dto.setQnaBoardSeq(rs.getString("QNABOARDSEQ"));
				dto.setMemberSeq(rs.getString("memberSeq"));
				dto.setQnaCategorySeq(rs.getString("qnaCategorySeq"));
				dto.setQnaBoardTitle(rs.getString("QNABOARDTITLE"));
				dto.setQnaBoardTxt(rs.getString("QNABOARDTXT"));
				dto.setQnaBoardDate(rs.getString("QNABOARDDATE"));
				dto.setQnaBoardImg(rs.getString("QNABOARDIMG"));
				dto.setQnaBoardChu(rs.getString("QNABOARDCHU"));
				dto.setMemberId(rs.getString("id"));
				dto.setComment(rs.getString("cnt"));
				dto.setQnaCategory(rs.getString("category"));
				

				

				

				return dto;

			}

		} catch (Exception e) {
			System.out.println("qnaBoardDAO.get");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<qnaCommentDTO> clist(String boardSeq) {
		try {
			
			
			String sql = "select a.*, (select id from tblMember where memberSeq = a.memberSeq) as id from tblqnaComment a where qnaboardSeq = ? order by qnaboardseq desc";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, boardSeq);

			rs = pstat.executeQuery();

			ArrayList<qnaCommentDTO> clist = new ArrayList<qnaCommentDTO>();

			while (rs.next()) {

				qnaCommentDTO dto = new qnaCommentDTO();
				
				dto.setQnaCommentSeq(rs.getString("qnacommentseq"));
				dto.setQnaBoardSeq(rs.getString("qnaboardseq"));
				dto.setQnacommentTxt(rs.getString("qnacommenttxt"));
				dto.setMemberSeq(rs.getString("memberseq"));
				dto.setMemberId(rs.getString("id"));
				dto.setQnaDate(rs.getString("qnadate"));

				clist.add(dto);

			}

			System.out.println(clist);
			return clist;
			
			
		} catch (Exception e) {
			System.out.println("qnaBoardDAO.clist");
			e.printStackTrace();
		}
		return null;
	}

	public int likeAdd(String seq) {
		try {
			
			String sql = "update tblqnaboard set qnaboardchu = qnaboardchu + 1 where qnaboardSeq = ?";
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("qnaBoardDAO.likeAdd");
			e.printStackTrace();
		}
		return 0;
	}

	public int likedel(String seq) {
		try {
			
			String sql = "update tblqnaboard set qnaboardchu = qnaboardchu - 1 where qnaboardSeq = ?";
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("qnaBoardDAO.likedel");
			e.printStackTrace();
		}
		return 0;
	}

	public int write(qnaBoardDTO dto) {
		try {
			
			String sql = "insert into tblqnaboard "
					+ "(qnaboardSeq, memberSeq, qnacategorySeq, qnaboardTitle, qnaboardTxt, qnaboardDate, qnaboardImg, qnaboardChu, type) "
					+ "values (qnaboardSeq.nextVal, ?, ?, ?, ?, default, ?, 0, default)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getMemberSeq());
			pstat.setString(2, dto.getQnaCategorySeq());
			pstat.setString(3, dto.getQnaBoardTitle());
			pstat.setString(4, dto.getQnaBoardTxt());
			pstat.setString(5, dto.getQnaBoardImg());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("qnaBoardDAO.write");
			e.printStackTrace();
		}
		return 0;
	}

	public int addComment(qnaCommentDTO dto) {
		try {
			
			String sql = "insert into tblqnacomment (qnacommentSeq, qnaboardSeq, memberseq, qnacommenttxt, qnaDate) "
					+ "values (qnacommentSeq.nextVal, ?, ?, ?, default)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getQnaBoardSeq());
			pstat.setString(2, dto.getMemberSeq());
			pstat.setString(3, dto.getQnacommentTxt());
			
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("qnaBoardDAO.addComment");
			e.printStackTrace();
		}
		return 0;
	}

	public int delComment(String commentSeq) {
		try {
			
			String sql = "delete from tblqnacomment where qnacommentSeq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, commentSeq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("qnaBoardDAO.delComment");
			e.printStackTrace();
		}
		return 0;
	}

	public int editComment(qnaCommentDTO dto) {
		try {
			
			String sql = "update tblqnacomment set qnacommenttxt = ? where qnacommentseq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getQnacommentTxt());
			pstat.setString(2, dto.getQnaCommentSeq());
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("qnaBoardDAO.editComment");
			e.printStackTrace();
		}
		return 0;
	}

	public int edit(qnaBoardDTO dto) {
		try {
			
			String sql = "update tblqnaboard set qnaboardTitle = ?, qnaboardTxt = ?, qnacategorySeq = ? where qnaboardSeq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getQnaBoardTitle());
			pstat.setString(2, dto.getQnaBoardTxt());
			pstat.setString(3, dto.getQnaCategorySeq());
			pstat.setString(4, dto.getQnaBoardSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("qnaBoardDAO.edit");
			e.printStackTrace();
		}
		return 0;
	}

	public void delAllComment(String boardSeq) {
		try {
			
			String sql = "delete from tblqnaComment where qnaboardSeq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, boardSeq);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("qnaBoardDAO.delAllComment");
			e.printStackTrace();
		}
		
	}

	public int del(String boardSeq) {
		try {
			
			String sql = "delete from tblqnaBoard where qnaboardSeq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, boardSeq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("qnaBoardDAO.del");
			e.printStackTrace();
		}
		return 0;
	}

}
