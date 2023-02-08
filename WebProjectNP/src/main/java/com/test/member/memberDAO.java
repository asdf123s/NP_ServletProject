package com.test.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.my.DBUtil;
import com.test.store.productDTO;



public class memberDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public memberDAO() {
		conn = DBUtil.open();
	}

	public memberCartDTO memlv(String memberSeq) {
		try {
			
			String sql = "select a.*, (select lv from tbllv where lvseq = a.memberlvseq) as lv from tblmember a where memberseq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, memberSeq);
			rs = pstat.executeQuery();
			if(rs.next()) {
				
				memberCartDTO dto = new memberCartDTO();
				
				dto.setMemberLv(rs.getString("lv"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("memberDAO.memlv");
			e.printStackTrace();
		}
		return null;
	}

	public memberDTO orderMem(String memberSeq) {
		try {
			
			String sql = "select * from tblmember where memberseq = ?";
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, memberSeq);
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				memberDTO dto = new memberDTO();
				
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				dto.setAddress(rs.getString("address"));
				
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("memberDAO.orderMem");
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	public boolean insertSignUp(memberDTO dto) throws SQLException {
		boolean result = false;
				
		String sql = "INSERT INTO tblMember VALUES (memberSeq.nextVal,?,?,?,?,?,?,?,?,1,'y')";
		
		pstat = conn.prepareStatement(sql);
		
		System.out.println("dto.getName() " + dto.getName());
		System.out.println("dto.getId() " + dto.getId());
		System.out.println("dto.getPw() " + dto.getPw());
		System.out.println("dto.getEmail() " + dto.getEmail());
		System.out.println("dto.getJumin() " + dto.getJumin());
		System.out.println("dto.getGender() " + dto.getGender());
		System.out.println("dto.getAddress() " + dto.getAddress());
		System.out.println("dto.getTel() " + dto.getTel());
		
		try {
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getId());
			pstat.setString(3, dto.getPw());
			pstat.setString(4, dto.getEmail());
			pstat.setString(5, dto.getJumin());
			pstat.setString(6, dto.getGender());
			pstat.setString(7, dto.getAddress());
			pstat.setString(8, dto.getTel());
			
			int i = pstat.executeUpdate(); 
			
			if (i != 0) {
				result = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	

	public boolean idCheck(String id) throws SQLException {
		
		boolean result = false;
		String sql = "SELECT id from tblMember where id = ?";
		
		pstat = conn.prepareStatement(sql);
		
		String cId = "";
		
		try {
			
			pstat.setString(1, id);
						
				rs = pstat.executeQuery(); 

				while (rs.next()) {	
					cId = rs.getString(1);
						result=true;
					
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		
		
		return result;
	}
	
	public String findId(String name, String jumin) throws SQLException {
		
		String sql = "SELECT id from tblMember where name=? and jumin=?";
		
		pstat = conn.prepareStatement(sql);
		
		String id = "";
		
		try {
			
			pstat.setString(1, name);
			pstat.setString(2, jumin);
						
				rs = pstat.executeQuery(); 

				while (rs.next()) {	
					id = rs.getString("id");
				
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		
		System.out.println(id);
		return id;
	}
	
	public String findPw(String id, String jumin, String email) throws SQLException {
		
		String sql = "SELECT memberSeq from tblMember where id=? and jumin=? and email=?";
		
		pstat = conn.prepareStatement(sql);
		
		String memberSeq = "";
		
		try {
			
			pstat.setString(1, id);
			pstat.setString(2, jumin);
			pstat.setString(3, email);
						
				rs = pstat.executeQuery(sql); 

				while (rs.next()) {	
					memberSeq = rs.getString(1);
				
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		
		
		return memberSeq;
	}
	
	public boolean editPw(String pw, String memberSeq) throws SQLException {
		boolean result = false;
		String sql = "update tblMember set pw = ? where memberSeq = ?";
		
		pstat = conn.prepareStatement(sql);
		
		try {
			
			pstat.setString(1, pw);
			pstat.setString(2, memberSeq);
						
				int i = pstat.executeUpdate(); 

				if (i !=0 ) {	
					result = true;
				
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		
		
		return result;
	}
	
	public boolean infoEdit(memberDTO dto, String memberSeq) throws SQLException {
		boolean result = false;
				
		String sql = "update tblMember set pw = ?, tel = ?, address = ? where memberSeq = ?";
		
		pstat = conn.prepareStatement(sql);
		
		try {

			pstat.setString(1, dto.getPw());
			pstat.setString(2, dto.getTel());
			pstat.setString(3, dto.getAddress());
			pstat.setString(4, memberSeq);
			
			
			int i = pstat.executeUpdate(); 
			
			if (i != 0) {
				result = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public memberDTO memInfo(String memberSeq) throws SQLException {	
		memberDTO dto = new memberDTO();
		
		String sql = "SELECT id, name, tel, gender, jumin, email, address FROM tblMember where memberSeq = ?";
		pstat = conn.prepareStatement(sql);
		
		try {
			
			pstat.setString(1,memberSeq);
			
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTel(rs.getString(3)); 
				dto.setGender(rs.getString(4));
				dto.setJumin(rs.getString(5));			
				dto.setEmail(rs.getString(6));
				
				String addr [] = rs.getString(7).split("@");
				dto.setAddr1(addr[0]);				
				dto.setAddr2(addr[1]);
				dto.setAddr3(addr[2]);
				
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public ArrayList<productDTO> selectSubscribe(String memberSeq) throws SQLException {
		ArrayList<productDTO> list = new ArrayList<productDTO>();		
		
		String sql = "select p.productImage, p.productName, TO_CHAR(s.subsDate, 'YYYY-MM-DD'), p.productPrice, s.subsSeq from tblSubscribe s, tblProduct p where s.memberSeq = ? and p.productSeq = s.productSeq order by s.subsDate";
		pstat = conn.prepareStatement(sql);
		
		try {
			pstat.setString(1,memberSeq);
			
			rs = pstat.executeQuery();
			
			while(rs.next()) {
				productDTO pdto = new productDTO();
				pdto.setProductImage(rs.getString(1));
				pdto.setProductName(rs.getString(2)); 
				pdto.setSubsDate(rs.getString(3));
				pdto.setProductPrice(rs.getString(4));
				pdto.setSubsSeq(rs.getString(5));
				
				
				list.add(pdto);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean deleteSubscribe(String subsSeq) throws SQLException {	
		boolean result = false;
		
		String sql = "delete from tblSubscribe where subsSeq = ?";
		pstat = conn.prepareStatement(sql);
		
		try {
			pstat.setString(1,subsSeq);
			
			int i = pstat.executeUpdate();
			
			if (i!=0) {
				result = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
}
