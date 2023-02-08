package com.test.member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.test.my.DBUtil;
import com.test.store.reviewDTO;

public class MypageDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public MypageDAO() {
		conn = DBUtil.open();
	}

	// 마이페이지 등급, 포인트 정보 조회
	public mypageDTO mypage(String memberSeq) {

		try {

			String sql = "select * from tblMypage where memberSeq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, memberSeq);

			rs = pstat.executeQuery();

			// 레코드 1줄 > DTO 1개에 담기

			if (rs.next()) {

				mypageDTO dto = new mypageDTO();

				dto.setMemberSeq(rs.getString("memberSeq"));
				dto.setMypageSeq(rs.getString("mypageSeq"));
				dto.setMypagePoint(rs.getString("mypagePoint"));
				dto.setMypageRank(rs.getString("mypageRank"));

				return dto;

			}

		} catch (Exception e) {
			System.out.println("MypageDAO.list");
			e.printStackTrace();
		}

		return null;
	}

	// 회원정보 조회
	public memberDTO memberInfo(String seq) {

		try {

			String sql = "select * from tblMember where memberSeq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			if (rs.next()) {

				memberDTO dtoMember = new memberDTO();

				dtoMember.setMemberSeq(rs.getString("memberSeq"));
				dtoMember.setName(rs.getString("name"));
				dtoMember.setId(rs.getString("id"));
				dtoMember.setPw(rs.getString("pw"));
				dtoMember.setEmail(rs.getString("email"));
				dtoMember.setJumin(rs.getString("jumin"));
				dtoMember.setGender(rs.getString("gender"));
				dtoMember.setAddress(rs.getString("address"));
				dtoMember.setTel(rs.getString("tel"));
				dtoMember.setMemberLvSeq(rs.getString("memberLvSeq"));

				return dtoMember;

			}

		} catch (Exception e) {
			System.out.println("MypageDAO.memberInfo");
			e.printStackTrace();
		}

		return null;
	}
	
	
	//주문내역 상세 정보
	public memberOrderDTO memOrder(String seq) {

		try {

			String sql = "select * from tblMemberOrder where memberSeq = ? order by memberBuyDate DESC";
			
			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			while (rs.next()) {

				memberOrderDTO dto = new memberOrderDTO();

				dto.setMemberOrderSeq(rs.getString("memberOrderSeq"));
				dto.setMemberSeq(rs.getString("memberSeq"));
				dto.setMemberDeliverySeq(rs.getString("memberDeliverySeq"));
				dto.setMemberDestination(rs.getString("memberDestination"));
				dto.setMemberRequest(rs.getString("memberRequest"));
				

				dto.setMemberBuyDate(rs.getString("memberBuyDate"));
				
				return dto;
			}

		} catch (Exception e) {
			System.out.println("MypageDAO.memOrder");
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
	
	//주문상품
	public orderProductDTO OP(String seq) {
		
		try {
			
		String sql = "select\r\n"
				+ "    tmo.memberSeq,\r\n"
				+ "    tmo.memberBuyDate,\r\n"
				+ "    tmo.memberDestination,\r\n"
				+ "    tp.productSeq,\r\n"
				+ "    tp.productName,\r\n"
				+ "    tp.productPrice,\r\n"
				+ "    tp.productImage\r\n"
				+ "from tblMemberOrder tmo\r\n"
				+ "    inner join tblProduct tp\r\n"
				+ "                on tmo.productSeq = tp.productSeq\r\n"
				+ "                    where memberSeq = ?  order by tmo.memberBuyDate desc";
		
		
		pstat = conn.prepareStatement(sql);

		pstat.setString(1, seq);

		rs = pstat.executeQuery();
		
		System.out.println(111);
		
		while (rs.next()) {

			orderProductDTO dto = new orderProductDTO();
			
			dto.setMemberSeq(rs.getString("memberSeq"));
			dto.setMemberBuyDate(rs.getString("memberBuyDate"));
			dto.setMemberDestination(rs.getString("memberDestination"));
			dto.setProductSeq(rs.getString("productSeq"));
			dto.setProductName(rs.getString("productName"));
			dto.setProductPrice(rs.getString("productPrice"));
			dto.setProductImage(rs.getString("productImage"));
			
			
			return dto;
		}

	} catch (Exception e) {
		System.out.println("MYpageDAO.OP");
		e.printStackTrace();
	}
		return null;
	}
	
	public ArrayList<orderProductDTO> addlist(String seq) {
		

		try {
			
			String sql = "select\r\n"
					+ "    tmo.memberSeq,\r\n"
					+ "    tmo.memberBuyDate,\r\n"
					+ "    tmo.memberDestination,\r\n"
					+ "    tp.productSeq,\r\n"
					+ "    tp.productName,\r\n"
					+ "    tp.productPrice,\r\n"
					+ "    tp.productImage\r\n"
					+ "from tblMemberOrder tmo\r\n"
					+ "    inner join tblOrderProduct top\r\n"
					+ "        on tmo.memberOrderSeq = top.memberOrderSeq\r\n"
					+ "            inner join tblProduct tp\r\n"
					+ "                on top.productSeq = tp.productSeq\r\n"
					+ "                    where memberSeq = ?\r\n"
					+ "                        group by tmo.memberSeq, tmo.memberBuyDate, tmo.memberDestination, tp.productSeq, tp.productName, tp.productPrice, tp.productImage\r\n"
					+ "\r\n"
					+ "";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<orderProductDTO> addlist = new ArrayList<orderProductDTO>();
			    
			
	         while (rs.next()) {
	            
	            // 레코드 1개 > CodeDTO 1개
	        	 orderProductDTO dto = new orderProductDTO();
	            
	 			dto.setMemberSeq(rs.getString("memberSeq"));
				dto.setMemberBuyDate(rs.getString("memberBuyDate"));
				dto.setMemberDestination(rs.getString("memberDestination"));
				dto.setProductSeq(rs.getString("productSeq"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getString("productPrice"));
				dto.setProductImage(rs.getString("productImage"));
					
				addlist.add(dto);
	            
	         }
	         
	         return addlist;
			
		} catch (Exception e) {
			System.out.println("MemOrderDAO.olist");
			e.printStackTrace();
		}
		
		return null;
	}
	
//	public List<HashMap<String, String>> addMoney(String seq) {
//		
//		List<HashMap<String, String>> addMoney = null;
//		
//		try {
//
//			String sql = "select\r\n"
//					+ "    tmo.memberOrderSeq,\r\n"
//					+ "    tmo.memberSeq,\r\n"
//					+ "    tp.productName,\r\n"
//					+ "    tp.productPrice\r\n"
//					+ "from tblMemberOrder tmo\r\n"
//					+ "    inner join tblOrderProduct top\r\n"
//					+ "        on tmo.memberOrderSeq = top.memberOrderSeq\r\n"
//					+ "            inner join tblProduct tp\r\n"
//					+ "                on top.productSeq = tp.productSeq\r\n"
//					+ "                    where memberSeq = ?";
//
//			pstat = conn.prepareStatement(sql);
//			
//			pstat.setString(1, seq);
//			
//			rs = pstat.executeQuery();
//			
//			;
//			
//			while(rs.next()) {
//				
//				addMoney = new ArrayList<HashMap<String, String>>();
//				
//				HashMap<String, String> map = new HashMap<String, String>();
//				
//				map.put("memberOrderSeq", rs.getString("memberOrderSeq"));
//				map.put("memberSeq", rs.getString("memberSeq"));
//				map.put("productName", rs.getString("productName"));
//				map.put("productPrice", rs.getString("productPrice"));
//				
//				addMoney.add(map);
//			}
//			
//			
//		} catch (Exception e) {
//			System.out.println("MypageDAO.addMoney");
//			e.printStackTrace();
//		}
//		
//		return addMoney;
//		
//	}
	
	public ArrayList<MemDeliverDTO> dlist(String seq) {
		
		try {

			String sql = "select \r\n"
					+ "*\r\n"
					+ "from tblMemberOrder tmo\r\n"
					+ "    inner join tblDeliver td\r\n"
					+ "        on tmo.memberDeliverySeq = td.memberDeliverySeq\r\n"
					+ "            where tmo.memberSeq = ? order by  memberBuyDate desc";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			ArrayList<MemDeliverDTO> dlist = new ArrayList<MemDeliverDTO>();

			while (rs.next()) {

				MemDeliverDTO dto = new MemDeliverDTO();
				
				dto.setMemberOrderSeq(rs.getString("memberOrderSeq"));
				dto.setMemberSeq(rs.getString("memberSeq"));

				dto.setMemberDeliverySeq(rs.getString("memberDeliverySeq"));
				dto.setMemberDestination(rs.getString("memberDestination"));
				dto.setMemberRequest(rs.getString("memberRequest"));
				dto.setRecipient(rs.getString("recipient"));

				dto.setMemberBuyDate(rs.getString("memberBuyDate"));
				dto.setDeliver(rs.getString("deliver"));

				dlist.add(dto);
				
			}
			
			return dlist;

		}  catch (Exception e) {
			System.out.println("MemDeliverDAO.dlist");
			e.printStackTrace();
		}
		
		return null;
	}

	//주문 배송 조회
	public MemDeliverDTO dcount(String seq) {
		
		try {

			String sql = "select \r\n"
					+ "    count(case when memberDeliverySeq='1' then 1 end) as stat1,\r\n"
					+ "    count(case when memberDeliverySeq='2' then 1 end) as stat2,\r\n"
					+ "    count(case when memberDeliverySeq='3' then 1 end) as stat3,\r\n"
					+ "    count(case when memberDeliverySeq='4' then 1 end) as stat4\r\n"
					+ "from tblMemberOrder tmo\r\n"
					+ "            inner join tblProduct tp\r\n"
					+ "                on tmo.productSeq = tp.productSeq\r\n"
					+ "                    where memberSeq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			if (rs.next()) {

				MemDeliverDTO dto = new MemDeliverDTO();

				dto.setStat1(rs.getString("stat1"));
				dto.setStat2(rs.getString("stat2"));
				dto.setStat3(rs.getString("stat3"));
				dto.setStat4(rs.getString("stat4"));

				return dto;

			}

		} catch (Exception e) {
			System.out.println("MypageDAO.dcount");
			e.printStackTrace();
		}
		
		return null;
	}
	
	//누적 주문 금액
	public orderProductDTO addMoney(String seq) {
		
		try {

			String sql = "select sum(tp.productPrice) as addMoney from tblMemberOrder mo inner join tblProduct tp on mo.productSeq = tp.productSeq where memberSeq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			if (rs.next()) {

				orderProductDTO dto = new orderProductDTO();

				dto.setAddMoney(rs.getString("addMoney"));

				return dto;

			}

		} catch (Exception e) {
			System.out.println("MypageDAO.dcount");
			e.printStackTrace();
		}
		
		return null;
	}
		
	
}
