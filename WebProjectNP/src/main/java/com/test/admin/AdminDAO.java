package com.test.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.board.boardCommentDTO;
import com.test.board.boardDTO;
import com.test.board.qnaBoardDTO;
import com.test.member.memberDTO;
import com.test.my.DBUtil;
import com.test.notice.noticeDTO;
import com.test.store.productDTO;

public class AdminDAO {

	private Connection conn = null;
	private PreparedStatement pstat = null;
	private Statement stat = null;
	private ResultSet rs = null;

	public AdminDAO() {
		conn = DBUtil.open();
	}

	public ArrayList list(String table, String state, String seq, HashMap<String, String> map) {
		try {

			String sql = "";
			String where = "";
			
			

			if (state.equals("n")) {
				
				sql = String.format("select * from (select rownum as rnum, a.* from "+table+" a %s) where rnum between %s and %s", where, map.get("begin"), map.get("end"));
				
				
			} else {
				sql = "select * from " + table + "where memberSeq=" + seq;
			}

			if (table.toLowerCase().equals("tblmember")) {
				
				if(map.get("isSearch").equals("y")) {
					where = String.format(" where id like '%%' || '%s' || '%%' or name like '%%' || '%s' || '%%'", map.get("word"), map.get("word"));
				}else {
					where = "";
				}

				if (state.equals("n")) {
					sql = "select * from (select rownum as rnum, a.* from (select * from tblMember m inner join TBLLV l on m.MEMBERLVSEQ = l.LVSEQ"+where+" order by m.memberSeq) a) where rnum between "+map.get("begin")+" and " + map.get("end");
				} else {
					sql = "select * from tblMember m inner join TBLLV l on m.MEMBERLVSEQ = l.LVSEQ inner join TBLMYPAGE mp on mp.MEMBERSEQ = m.MEMBERSEQ where m.memberSeq="
							+ seq;
				}

				stat = conn.createStatement();
				rs = stat.executeQuery(sql);

				ArrayList<memberDTO> memberList = new ArrayList<memberDTO>();

				while (rs.next()) {
					memberDTO dto = new memberDTO();

					dto.setMemberSeq(rs.getString("memberSeq"));
					dto.setLvName(rs.getString("lv"));
					dto.setName(rs.getString("name"));
					dto.setId(rs.getString("id"));
					dto.setPw(rs.getString("pw"));
					dto.setEmail(rs.getString("email"));
					dto.setJumin(rs.getString("jumin"));
					dto.setGender(rs.getString("gender"));
					dto.setAddress(rs.getString("address"));
					dto.setTel(rs.getString("tel"));
					dto.setState(rs.getString("state"));
					if (state.equals("y")) {
						dto.setPoint(rs.getString("mypagePoint"));
					}
					dto.setMemberLvSeq(rs.getString("memberLvSeq"));

					memberList.add(dto);

				}
				
				rs.close();
				stat.close();

				return memberList;

			} else if (table.toLowerCase().equals("tblproduct")) {
				
				if(map.get("isSearch").equals("y")) {
					where = String.format(" where productName like '%%' || '%s' || '%%'", map.get("word"));
				}else {
					where = "";
				}

				if (state.equals("n")) {
					sql = "select * from (select rownum as rnum, productSeq, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, s.STORENAME\n"
							+ "	from TBLPRODUCT p inner join TBLCATEGORY c on p.CATEGORYSEQ = c.CATEGORYSEQ\n"
							+ "	inner join TBLSTORE s on s.STORESEQ = c.STORESEQ"+where+" order by PRODUCTSEQ) where rnum between "+map.get("begin")+" and " + map.get("end");
				} else {
					sql = "select productSeq, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, s.STORENAME\n"
							+ "	from TBLPRODUCT p inner join TBLCATEGORY c on p.CATEGORYSEQ = c.CATEGORYSEQ\n"
							+ "	inner join TBLSTORE s on s.STORESEQ = c.STORESEQ where productSeq=" + seq;
				}

				stat = conn.createStatement();

				rs = stat.executeQuery(sql);

				ArrayList<productDTO> productList = new ArrayList<productDTO>();

				while (rs.next()) {

					productDTO dto = new productDTO();

					dto.setProductSeq(rs.getString("productSeq"));
					dto.setProductDetailImage(rs.getString("productDetailImage"));
					dto.setProductImage(rs.getString("productImage"));
					dto.setProductInventory(rs.getString("productInventory"));
					dto.setProductName(rs.getString("productName"));
					dto.setProductPrice(rs.getString("productPrice"));
					dto.setCategoryName(rs.getString("storeName"));

					productList.add(dto);

				}

				rs.close();
				stat.close();

				return productList;

			} else if (table.toLowerCase().equals("tblqnaboard")) {
				
				if(map.get("isSearch").equals("y")) {
					where = String.format(" where qnaBoardTitle like '%%' || '%s' || '%%'", map.get("word"));
				}else {
					where = "";
				}

				if (state.equals("n")) {
					sql = "select * from (select rownum as rnum, b.QNABOARDSEQ, m.id, b.QNABOARDTITLE, b.QNABOARDTXT, b.QNABOARDDATE, b.QNABOARDIMG, qc.QNACATEGORYNAME , b.QNABOARDCHU \n"
							+ "	from TBLQNABOARD b \n"
							+ "	inner join TBLQNACATEGORY qc on b.QNACATEGORYSEQ = qc.QNACATEGORYSEQ\n"
							+ "	inner join TBLMEMBER m on b.MEMBERSEQ = m.MEMBERSEQ\n"
							+ where+" order by b.QNABOARDSEQ) where rnum between "+map.get("begin")+" and "+map.get("end");
				} else {
					sql = "select b.QNABOARDSEQ, m.id, b.QNABOARDTITLE, b.QNABOARDTXT, b.QNABOARDDATE, b.QNABOARDIMG, qc.QNACATEGORYNAME , b.QNABOARDCHU \n"
							+ "	from TBLQNABOARD b \n"
							+ "	inner join TBLQNACATEGORY qc on b.QNACATEGORYSEQ = qc.QNACATEGORYSEQ\n"
							+ "	inner join TBLMEMBER m on b.MEMBERSEQ = m.MEMBERSEQ" + " where b.qnaBoardSeq=" + seq;
				}

				String sql2 = "select count(*) as cnt from TBLQNABOARD";

				stat = conn.createStatement();
				rs = stat.executeQuery(sql);

				Statement stat2 = conn.createStatement();
				ResultSet rs2 = stat2.executeQuery(sql2);

				rs2.next();

				ArrayList<qnaBoardDTO> qnaList = new ArrayList<qnaBoardDTO>();

				while (rs.next()) {

					qnaBoardDTO dto = new qnaBoardDTO();

					dto.setQnaBoardSeq(rs.getString("qnaBoardSeq"));
					dto.setMemberId(rs.getString("id"));
					dto.setQnaBoardTitle(rs.getString("qnaBoardTitle"));
					dto.setQnaBoardTxt(rs.getString("qnaBoardTxt").replace("\r\n", "<br>"));
					dto.setQnaBoardDate(rs.getString("qnaBoardDate"));
					dto.setQnaBoardImg(rs.getString("qnaBoardImg"));
					dto.setQnaCategory(rs.getString("qnaCategoryName"));
					dto.setQnaBoardChu(rs.getString("qnaBoardChu"));
					dto.setQnaBoardNum(rs2.getString("cnt"));

					qnaList.add(dto);

				}

				rs.close();
				stat.close();

				return qnaList;

			} else if (table.toLowerCase().equals("tblfreeboard")) {
				
				if(map.get("isSearch").equals("y")) {
					where = String.format(" where freeBoardTitle like '%%' || '%s' || '%%'", map.get("word"));
				}else {
					where = "";
				}

				if (state.equals("n")) {
					sql = "select * from (select rownum as rnum, a.* from (select * from TBLFREEBOARD f inner join TBLMEMBER m on f.MEMBERSEQ = m.MEMBERSEQ"+where+") a) where rnum between "+map.get("begin")+" and "+map.get("end");
				} else {
					sql = "select * from TBLFREEBOARD f inner join TBLMEMBER m on f.MEMBERSEQ = m.MEMBERSEQ where freeBoardSeq="
							+ seq;
				}

				stat = conn.createStatement();
				rs = stat.executeQuery(sql);

				String sql2 = "select count(*) as cnt from tblFreeBoard";

				Statement stat2 = conn.createStatement();
				ResultSet rs2 = stat2.executeQuery(sql2);

				rs2.next();

				ArrayList<boardDTO> freeList = new ArrayList<boardDTO>();

				while (rs.next()) {

					boardDTO dto = new boardDTO();

					dto.setFreeBoardSeq(rs.getString("freeBoardSeq"));
					dto.setFreeBoardTitle(rs.getString("freeBoardTitle"));
					dto.setFreeBoardTxt(rs.getString("freeBoardTxt").replace("\r\n", "<br>"));
					dto.setFreeBoardDate(rs.getString("freeBoardDate"));
					dto.setFreeBoardImage(rs.getString("freeBoardImg"));
					dto.setFreeBoardChu(rs.getString("freeBoardChu"));
					dto.setMemberId(rs.getString("id"));
					dto.setFreeBoardNum(rs2.getString("cnt"));

					freeList.add(dto);

				}

				rs.close();
				stat.close();

				return freeList;

			} else if (table.toLowerCase().equals("tblnotice")) {
				
				if(map.get("isSearch").equals("y")) {
					where = String.format(" where noticeSubject like '%%' || '%s' || '%%'", map.get("word"));
				}else {
					where = "";
				}
				
				if (state.equals("y")) {
					sql = "select * from tblNotice where noticeSeq=" + seq;
				}else {
					sql = "select * from tblNotice"+where;
				}

				stat = conn.createStatement();
				rs = stat.executeQuery(sql);

				ArrayList<noticeDTO> noticeList = new ArrayList<noticeDTO>();

				String sql2 = "select count(*) as cnt from tblNotice";

				Statement stat2 = conn.createStatement();
				ResultSet rs2 = stat2.executeQuery(sql2);

				rs2.next();

				while (rs.next()) {

					noticeDTO dto = new noticeDTO();
					
					dto.setAdminSeq(rs.getString("adminSeq"));
					dto.setNoticeSeq(rs.getString("noticeSeq"));
					dto.setNoticeSubject(rs.getString("noticeSubject"));
					dto.setNoticeContent(rs.getString("noticeContent").replace("\r\n", "<br>"));
					dto.setNoticeRegdate(rs.getString("noticeRegdate"));
					dto.setNoticeImg(rs.getString("noticeimg"));
					dto.setNoticeNum(rs2.getString("cnt"));

					noticeList.add(dto);

				}

				rs.close();
				stat.close();

				return noticeList;

			}

		} catch (Exception e) {
			System.out.println("memberList");
			e.printStackTrace();
		}
		return null;
	}

	public HashMap<String, Integer> productChart() {
		try {
			String sql = "select c.CATEGORYNAME, count(*) as cnt from tblOrderProduct op\n"
					+ "	inner join TBLPRODUCT p on op.productSeq = p.PRODUCTSEQ\n"
					+ "	inner join TBLCATEGORY c on c.CATEGORYSEQ = p.CATEGORYSEQ\n" + "	group by c.CATEGORYNAME";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			HashMap<String, Integer> productChart = new HashMap<String, Integer>();

			while (rs.next()) {
				productChart.put(rs.getString("categoryName"), Integer.parseInt(rs.getString("cnt")));
			}

			rs.close();
			stat.close();

			return productChart;

		} catch (Exception e) {
			System.out.println("memberList");
			e.printStackTrace();
		}
		return null;
	}

	public HashMap<String, Integer> memberChart() {

		try {

			String sql = "select count(*) as cnt, state from TBLMEMBER group by state";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			HashMap<String, Integer> memberChart = new HashMap<String, Integer>();

			while (rs.next()) {
				memberChart.put(rs.getString("state"), Integer.parseInt(rs.getString("cnt")));
			}

			rs.close();
			stat.close();

			return memberChart;

		} catch (Exception e) {
			System.out.println("memberChart");
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<boardCommentDTO> comment(String type, String seq, String one) {

		try {

			String sql = "";

			if (type.toLowerCase().equals("qna")) {

				if (one.equals("y")) {
					sql = "select * from TBLQNACOMMENT q inner join tblMember m on q.MEMBERSEQ = m.MEMBERSEQ where qnaCommentSeq = "
							+ seq;
				} else {

					sql = "select * from TBLQNACOMMENT q inner join TBLMEMBER m on q.memberSeq = m.MEMBERSEQ where q.qnaBoardSeq = "
							+ seq;
				}

				stat = conn.createStatement();

				rs = stat.executeQuery(sql);

				ArrayList<boardCommentDTO> list = new ArrayList<boardCommentDTO>();

				while (rs.next()) {

					boardCommentDTO dto = new boardCommentDTO();

					dto.setCommentContent(rs.getString("qnaCommentTxt"));
					dto.setMemberName(rs.getString("name"));
					dto.setFreeCommentSeq(rs.getString("qnaCommentSeq"));
					dto.setFreeBoardSeq(rs.getString("qnaBoardSeq"));

					list.add(dto);

				}

				rs.close();
				stat.close();

				return list;

			} else if (type.toLowerCase().equals("free")) {

				if (one.equals("y")) {
					sql = "select * from tblFreeCommentBoard q inner join tblMember m on q.MEMBERSEQ = m.MEMBERSEQ where freeCommentSeq = "
							+ seq;
				} else {
					sql = "select * from TBLFREECOMMENTBOARD f inner join TBLMEMBER m on f.memberSeq = m.MEMBERSEQ where f.FREEBOARDSEQ = "
							+ seq;
				}

				stat = conn.createStatement();

				rs = stat.executeQuery(sql);

				ArrayList<boardCommentDTO> list = new ArrayList<boardCommentDTO>();

				while (rs.next()) {

					boardCommentDTO dto = new boardCommentDTO();

					dto.setCommentContent(rs.getString("CommentContent"));
					dto.setMemberName(rs.getString("name"));
					dto.setFreeCommentSeq(rs.getString("freeCommentSeq"));
					dto.setFreeBoardSeq(rs.getString("freeBoardSeq"));

					list.add(dto);

				}

				rs.close();
				stat.close();

				return list;
			}

		} catch (Exception e) {
			System.out.println("comment");
			e.printStackTrace();
		}

		return null;
	}

	public int memEdit(String seq, memberDTO dto) {

		try {

			String sql = "update tblMember set NAME = ?, PW = ?, TEL = ?, MEMBERLVSEQ = ?, EMAIL = ?, GENDER = ?, ADDRESS = ? where MEMBERSEQ =?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getTel());
			pstat.setString(4, dto.getMemberLvSeq());
			pstat.setString(5, dto.getEmail());
			pstat.setString(6, dto.getGender());
			pstat.setString(7, dto.getAddress());
			pstat.setString(8, dto.getMemberSeq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("memEdit");
			e.printStackTrace();
		}

		return 0;
	}

	public int memDel(String seq) {
		try {
			String sql = "update tblMember set state = 'n' where memberSeq = " + seq;

			stat = conn.createStatement();

			int result = stat.executeUpdate(sql);

			stat.close();

			return result;

		} catch (Exception e) {
			System.out.println("memDel");
			e.printStackTrace();
		}
		return 0;
	}

	public int addProduct(productDTO dto) {

		try {
			String sql = "insert into tblProduct(productSeq, productName, productInventory, productPrice, productImage, productDetailImage, categorySeq)"
					+ "values (productSeq.nextVal,?,?,?,?,?,?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getProductName());
			pstat.setString(2, dto.getProductInventory());
			pstat.setString(3, dto.getProductPrice());
			pstat.setString(4, dto.getProductImage());
			pstat.setString(5, dto.getProductDetailImage());
			pstat.setString(6, dto.getCategorySeq());

			System.out.println(dto);

			int result = pstat.executeUpdate();

			pstat.close();

			return result;

		} catch (Exception e) {
			System.out.println("addProduct");
			e.printStackTrace();
		}

		return 0;
	}

	public int EditProduct(productDTO dto) {

		try {

			String sql = "update tblProduct set productName = ?, productPrice = ?, productInventory = ?, CategorySeq = ?, productImage = ?, productDetailImage = ? where productSeq =?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getProductName());
			pstat.setString(2, dto.getProductPrice());
			pstat.setString(3, dto.getProductInventory());
			pstat.setString(4, dto.getCategorySeq());
			pstat.setString(5, dto.getProductImage());
			pstat.setString(6, dto.getProductDetailImage());
			pstat.setString(7, dto.getProductSeq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("memEdit");
			e.printStackTrace();
		}

		return 0;
	}

	public int prdDel(String seq) {
		try {

			String sql = "delete from tblProduct where productSeq = " + seq;

			stat = conn.createStatement();

			return stat.executeUpdate(sql);

		} catch (Exception e) {
			System.out.println("prdDel");
			e.printStackTrace();
		}
		return 0;
	}

	public int addNotice(noticeDTO dto) {
		try {

			String sql = "insert into tblNotice (noticeSeq, adminSeq, noticeSubject, noticeContent, noticeRegdate, noticeImg)"
					+ "values (noticeSeq.nextVal, 1, ?, ?, default, ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getNoticeSubject());
			pstat.setString(2, dto.getNoticeContent());
			pstat.setString(3, dto.getNoticeImg());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("addNotice");
			e.printStackTrace();
		}
		return 0;
	}

	public int noticeEdit(noticeDTO dto) {
		try {
			String sql = "update tblNotice set noticeContent = ?, noticeSubject = ?, noticeImg = ? where noticeSeq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getNoticeContent());
			pstat.setString(2, dto.getNoticeSubject());
			pstat.setString(3, dto.getNoticeImg());
			pstat.setString(4, dto.getNoticeSeq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("noticeEdit");
			e.printStackTrace();
		}
		return 0;
	}

	public int boardEdit(String type, qnaBoardDTO dto) {
		try {

			String sql = "";

			if (type.equals("qna")) {

				sql = "update tblQnaBoard set qnaBoardTitle = ?, qnaBoardTxt = ? where qnaBoardSeq = ?";

				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getQnaBoardTitle());
				pstat.setString(2, dto.getQnaBoardTxt());
				pstat.setString(3, dto.getQnaBoardSeq());

			} else if (type.equals("free")) {

				sql = "update tblfreeBoard set freeBoardTitle = ?, freeBoardTxt = ? where freeBoardSeq = ?";

				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getQnaBoardTitle());
				pstat.setString(2, dto.getQnaBoardTxt());
				pstat.setString(3, dto.getQnaBoardSeq());

			}

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("boardEdit");
			e.printStackTrace();
		}
		return 0;
	}

	public int boardDel(String type, String seq) {

		try {

			String sql = "";

			if (type.equals("notice")) {
				sql = "delete from tblNotice where noticeSeq = " + seq;
			} else if (type.equals("qna")) {
				sql = "delete from tblQnaBoard where qnaBoardSeq = " + seq;
			} else if (type.equals("free")) {
				sql = "delete from tblFreeBoard where freeBoardSeq = " + seq;
			}

			stat = conn.createStatement();

			return stat.executeUpdate(sql);

		} catch (Exception e) {
			System.out.println("boardDel");
			e.printStackTrace();
		}

		return 0;
	}

	public int commentEdit(String type, boardCommentDTO dto) {
		try {

			String sql = "";

			if (type.equals("qna")) {
				sql = "update tblQnaComment set qnaCommentTxt=? where qnaCommentSeq = " + dto.getFreeCommentSeq();
			} else if (type.equals("free")) {
				sql = "update tblFreeCommentBoard set commentContent=? where freeCommentSeq = "
						+ dto.getFreeCommentSeq();
			}

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getCommentContent());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("commentEdit");
			e.printStackTrace();
		}
		return 0;
	}

	public int commentDel(String type, String seq) {

		try {

			String sql = "";

			if (type.equals("free")) {
				sql = "delete from tblFreeCommentBoard where freeCommentSeq = " + seq;
			} else if (type.equals("qna")) {
				sql = "delete from tblQnaComment where qnaCommentSeq = " + seq;
			}

			stat = conn.createStatement();

			return stat.executeUpdate(sql);

		} catch (Exception e) {
			System.out.println("commentDel");
			e.printStackTrace();
		}

		return 0;
	}

	public int getTotalCount(HashMap<String, String> map, String type) {
		try {
			String sql = "";
			
			if(map.get("isSearch").equals("n")) {
				if (type.equals("product")) {
					sql = "select count(*) as cnt from tblProduct";
				} else if (type.equals("member")) {
					sql = "select count(*) as cnt from tblMember";
				} else if (type.equals("free")) {
					sql = "select count(*) as cnt from tblFreeBoard";
				} else if (type.equals("qna")) {
					sql = "select count(*) as cnt from tblQnaBoard";
				} else if (type.equals("notice")) {
					sql = "select count(*) as cnt from tblNotice";
				}
			}else {
				if (type.equals("product")) {
					sql = "select count(*) as cnt from tblProduct where productName like '%"+map.get("word")+"%'";
				} else if (type.equals("member")) {
					sql = "select count(*) as cnt from tblMember where name like '%"+map.get("word")+"%' or id like '%"+map.get("word")+"%'";
				} else if (type.equals("free")) {
					sql = "select count(*) as cnt from tblFreeBoard where freeBoardTitle like '%"+map.get("word")+"%'";
				} else if (type.equals("qna")) {
					sql = "select count(*) as cnt from tblQnaBoard where qnaBoardTitle like '%"+map.get("word")+"%'";
				} else if (type.equals("notice")) {
					sql = "select count(*) as cnt from tblNotice where noticeSubject like '%"+map.get("word")+"%'";
				}
			}

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			rs.next();

			return rs.getInt("cnt");

		} catch (Exception e) {
			System.out.println("getTotalCount");
			e.printStackTrace();
		}
		return 0;
	}
	
public ArrayList<SubscribeDTO> subList() {
		
		// 관리자 -> 구독관리
		
		try {
			
			String sql = "select sub.subsSeq, sub.memberSeq, mem.name, sub.productSeq, pd.productName, sub.memberOrderSeq, sub.subsDate\n" + 
					"from tblSubscribe sub\n" + 
					"    inner join tblMember mem on sub.memberSeq = mem.memberSeq\n" + 
					"    inner join tblProduct pd on pd.productSeq = sub.productSeq";
			
			pstat = conn.prepareStatement(sql);
			
			rs = pstat.executeQuery();
			
			System.out.println("subList:" + sql);
			
			ArrayList<SubscribeDTO> subList = new ArrayList<SubscribeDTO>();
			
			while (rs.next()) {
				
				SubscribeDTO dto = new SubscribeDTO();
				
				dto.setSubsSeq(rs.getString("subsSeq"));
				dto.setName(rs.getString("name"));
				dto.setProductName(rs.getString("productName"));
				dto.setSubsDate(rs.getString("subsDate"));
				
				subList.add(dto);
				
			}
			
			System.out.println(subList);
			
			return subList;
			
		} catch (Exception e) {
			System.out.println("AdminDAO.subList");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<SubscribeDTO> subListDetail(String seq) {
		
		//관리자 -> 구독관리 -> 구독자세히보기
		
		try {
			
			String sql = "select sub.subsSeq, sub.memberSeq, mem.name, sub.productSeq, pd.productName, sub.memberOrderSeq, sub.subsDate, mo.memberPayment\n" + 
					"from tblSubscribe sub\n" + 
					"    inner join tblMember mem on sub.memberSeq = mem.memberSeq\n" + 
					"    inner join tblProduct pd on pd.productSeq = sub.productSeq\n" + 
					"    inner join tblMemberOrder mo on mo.memberOrderSeq= sub.memberOrderSeq\n" +
					"where sub.subsSeq = " + seq;
			
			pstat = conn.prepareStatement(sql);
			
			rs = pstat.executeQuery();
			
			System.out.println("subListDetail:" + sql);
			
			ArrayList<SubscribeDTO> subListDetail = new ArrayList<SubscribeDTO>();
			
			while (rs.next()) {
				
				SubscribeDTO dto = new SubscribeDTO();
				
				dto.setSubsSeq(rs.getString("subsSeq"));
				dto.setSubsDate(rs.getString("subsDate"));
				dto.setMemberSeq(rs.getString("memberSeq"));
				dto.setName(rs.getString("name"));
				dto.setProductSeq(rs.getString("productSeq"));
				dto.setProductName(rs.getString("productName"));
				dto.setMemberOrderSeq(rs.getString("memberOrderSeq"));
				dto.setMemberPayment(rs.getString("memberPayment"));
				
				subListDetail.add(dto);
				
			}
			
			System.out.println(subListDetail);
			
			return subListDetail;
			
		} catch (Exception e) {
			System.out.println("AdminDAO.subListDetail");
			e.printStackTrace();
		}
		
		return null;
	}

}
