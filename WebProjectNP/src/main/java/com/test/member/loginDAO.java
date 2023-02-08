package com.test.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.test.my.DBUtil;

public class loginDAO  {
	
	private Connection conn = null;
	private PreparedStatement pstat = null;
	private Statement stat = null;
	private ResultSet rs = null;
	
	public loginDAO() {
		conn = DBUtil.open();
	}

	public memberDTO login(String id,String pw) throws SQLException {
		memberDTO dto = new memberDTO();
		
		String sql = "";
		
		if(id.substring(0, 5).toLowerCase().equals("admin")) {
			sql = "select * from tblAdmin where adminId=? and adminPw=?";
		}else {
		
			sql = "SELECT memberSeq, name, id from tblMember where id=? and pw=?";
		}
		
		pstat = conn.prepareStatement(sql);
		
		try {
			
			pstat.setString(1, id);
			pstat.setString(2, pw);
						
				rs = pstat.executeQuery(); 

				while (rs.next()) {	
					if(id.substring(0, 5).toLowerCase().equals("admin")) {
						dto.setId(rs.getString("adminId"));
						dto.setMemberSeq(rs.getString("adminSeq"));
					}else {
						dto.setMemberSeq(rs.getString(1));
						dto.setName(rs.getString(2));
						dto.setId(rs.getString(3));
					}
				
				}
			} catch(Exception e) {
				e.printStackTrace();
			}

			return dto;
		}

	}


