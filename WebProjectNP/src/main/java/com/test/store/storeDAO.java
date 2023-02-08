package com.test.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.my.DBUtil;


public class storeDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public storeDAO() {
		conn = DBUtil.open();
	}//storeDAO
	

	public ArrayList<productDTO> plist(HashMap<String, String> map) {
		
		try {
			
			String sql = "";
			String where = "";
			
			if (map.get("isSearch").equals("y")) {
				
				//System.out.println(map.get("word"));
				where = String.format("where productName like '%%' || '%s' || '%%'", map.get("word"));				
				
			}
			
			sql = String.format("select rvp.productSeq, rvp.productName, rvp.productInventory, rvp.productPrice, rvp.productImage, rvp.productDetailImage, rvp.categorySeq, \r\n" + 
					"        CASE WHEN rv.reviewScore is null THEN 0\r\n" + 
					"            ELSE rv.reviewScore\r\n" + 
					"        END AS \"joinReviewScore\",\r\n" + 
					"        count(rv.reviewScore) AS \"joinReviewCount\"\r\n"  +
					"            from (select rownum as rnum, a.* from vwProduct a %s) rvp full outer join tblReview rv on rvp.productSeq = rv.productSeq where rnum between %s and %s \r\n" + 
					"group by rvp.productSeq, rvp.productName, rvp.productInventory, rvp.productPrice, rvp.productImage, rvp.productDetailImage, rvp.categorySeq, rv.reviewScore\r\n" + 
					"order by rvp.productSeq asc", where, map.get("begin"), map.get("end"));
			
			pstat = conn.prepareStatement(sql);
			
			rs = pstat.executeQuery();
			
			System.out.println("plist:" + sql);
			
			ArrayList<productDTO> productList = new ArrayList<productDTO>();
			
			while (rs.next()) {
				
				productDTO dto = new productDTO();
				
				dto.setProductSeq(rs.getString("productSeq"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getString("productPrice"));
				dto.setProductImage(rs.getString("productImage"));
				dto.setReviewScore(rs.getDouble("joinReviewScore"));
				dto.setReviewCount(rs.getInt("joinReviewCount"));
				
				productList.add(dto);
				
			}
			
			System.out.println(productList);
			
			return productList;
			
		} catch (Exception e) {
			System.out.println("storeDAO.plist");
			e.printStackTrace();
		}
		
		return null;
	}


	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			
			String sql = "";
			String where = "";
			
			if (map.get("isSearch").equals("y")) {
				
				//System.out.println(map.get("word"));
				where = String.format("where productName like '%%' || '%s' || '%%'", map.get("word"));				
				
			}	
			
			sql = "select count(*) as cnt from tblProduct " + where;
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				//System.out.println(sql);
				//System.out.println(rs.getInt("cnt"));
				return rs.getInt("cnt");
				
			}
			
		} catch (Exception e) {
			System.out.println("storeDAO.getTotalCount");
			e.printStackTrace();
		}
		
		return 0;
	}


	public ArrayList<productDTO> plistNutrition(HashMap<String, String> map) {
		
		//스토어카테고리 -> 영양제
		
		try {
			
			String sql = "";
			String where = "";
			String where_cate = "";
			
			
			if (map.get("isSearch").equals("y")) {
				
				//System.out.println(map.get("word"));
				where = String.format("and productName like '%%' || '%s' || '%%'", map.get("word"));				
				
			}
			
			
			if (map.get("getNutritionCategory").equals("ALL")) {
				
				where_cate = String.format("where rnum between %s and %s", map.get("begin"), map.get("end"));
				
			} else if (map.get("getNutritionCategory") != null && map.get("getNutritionCategory") != "" ) {
				
				//System.out.println("map.get(getNutritionCategory):" + map.get("getNutritionCategory"));
				where_cate = String.format("where cg.categoryName = '%s'" , map.get("getNutritionCategory"));
				
			}
			
			
			
			sql = String.format("select rvp.productSeq, rvp.productName, rvp.productInventory, rvp.productPrice, rvp.productImage, rvp.productDetailImage, rvp.categorySeq, st.storeSeq, st.storeName, \r\n" + 
					"        CASE WHEN rv.reviewScore is null THEN 0\r\n" + 
					"            ELSE rv.reviewScore\r\n" + 
					"        END AS \"joinReviewScore\",\r\n" + 
					"        count(rv.reviewScore) AS \"joinReviewCount\",\r\n" + 
					"        cg.categoryName\r\n" + 
					"            from (select rownum as rnum, a.* from vwProduct a where storeSeq = 1 %s) rvp \r\n" +
					"				full outer join tblReview rv on rvp.productSeq = rv.productSeq \r\n" + 
					"				inner join tblCategory cg on rvp.categorySeq = cg.categorySeq \r\n" +
					"				inner join tblStore st on st.storeSeq = cg.storeSeq \r\n" +
					"%s \r\n" + 
					"group by rvp.productSeq, rvp.productName, rvp.productInventory, rvp.productPrice, rvp.productImage, rvp.productDetailImage, rvp.categorySeq, rv.reviewScore, cg.categoryName, st.storeSeq, st.storeName \r\n" + 
					"order by rvp.productSeq asc", where, where_cate);
			
			pstat = conn.prepareStatement(sql);
			
			rs = pstat.executeQuery();
			
			System.out.println("nutrition:" + sql);
			
			ArrayList<productDTO> productListNutrition = new ArrayList<productDTO>();
			
			while (rs.next()) {
				
				productDTO dto = new productDTO();
				
				dto.setProductSeq(rs.getString("productSeq"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getString("productPrice"));
				dto.setProductImage(rs.getString("productImage"));
				dto.setReviewScore(rs.getDouble("joinReviewScore"));
				dto.setReviewCount(rs.getInt("joinReviewCount"));
				
				productListNutrition.add(dto);
				
			}
			
			System.out.println(productListNutrition);
			
			return productListNutrition;
			
		} catch (Exception e) {
			System.out.println("storeDAO.plistNutrition");
			e.printStackTrace();
		}
		
		return null;
	}


	public int getTotalCountNutrition(HashMap<String, String> map) {
		
		//스토어카테고리 -> 영양제
		
		try {
			
			String sql = "";
			String where = "";
			String where_cate = "";
			
			if (map.get("isSearch").equals("y")) {
				
				//System.out.println(map.get("word"));
				where = String.format("and pd.productName like '%%' || '%s' || '%%'", map.get("word"));				
				
			}	
			
			if (map.get("getNutritionCategory").equals("ALL")) {
				
				where_cate = "";
				
			} else if (map.get("getNutritionCategory") != null && map.get("getNutritionCategory") != "" ) {
				
				//System.out.println("map.get(getNutritionCategory):" + map.get("getNutritionCategory"));
				where_cate = String.format("and cg.categoryName = '%s'" , map.get("getNutritionCategory"));
				
			}
			
			sql = "select count(pd.productSeq) as cnt from tblProduct pd \r\n" + 
					"        inner join tblCategory cg on pd.categorySeq = cg.categorySeq\r\n" + 
					"		 inner join tblStore st on st.storeSeq = cg.storeSeq\r\n" +		
					"			where st.storeSeq = 1" + where + where_cate;
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				//System.out.println(sql);
				//System.out.println(rs.getInt("cnt"));
				return rs.getInt("cnt");
				
			}
			
		} catch (Exception e) {
			System.out.println("storeDAO.getTotalCountNutrition");
			e.printStackTrace();
		}
		
		return 0;
	}


	public ArrayList<productDTO> plistFood(HashMap<String, String> map) {
		
		//스토어카테고리 -> 식품
		
		try {
			
			String sql = "";
			String where = "";
			String where_cate = "";
			
			if (map.get("isSearch").equals("y")) {
				
				//System.out.println(map.get("word"));
				where = String.format("and productName like '%%' || '%s' || '%%'", map.get("word"));				
				
			}
			
			
			if (map.get("getFoodCategory").equals("ALL")) {
				
				where_cate = String.format("where rnum between %s and %s", map.get("begin"), map.get("end"));
				
			} else if (map.get("getFoodCategory") != null && map.get("getFoodCategory") != "" ) {
				
				//System.out.println("map.get(getFoodCategory):" + map.get("getFoodCategory"));
				where_cate = String.format("where cg.categoryName = '%s'" , map.get("getFoodCategory"));
				
			}
			
			
			sql = String.format("select rvp.productSeq, rvp.productName, rvp.productInventory, rvp.productPrice, rvp.productImage, rvp.productDetailImage, rvp.categorySeq, st.storeSeq, st.storeName, \r\n" + 
					"        CASE WHEN rv.reviewScore is null THEN 0\r\n" + 
					"            ELSE rv.reviewScore\r\n" + 
					"        END AS \"joinReviewScore\",\r\n" + 
					"        count(rv.reviewScore) AS \"joinReviewCount\",\r\n" + 
					"        cg.categoryName\r\n" + 
					"            from (select rownum as rnum, a.* from vwProduct a where storeSeq = 2 %s) rvp \r\n" +
					"				full outer join tblReview rv on rvp.productSeq = rv.productSeq \r\n" + 
					"				inner join tblCategory cg on rvp.categorySeq = cg.categorySeq \r\n" +
					"				inner join tblStore st on st.storeSeq = cg.storeSeq \r\n" +
					"%s \r\n" + 
					"group by rvp.productSeq, rvp.productName, rvp.productInventory, rvp.productPrice, rvp.productImage, rvp.productDetailImage, rvp.categorySeq, rv.reviewScore, cg.categoryName, st.storeSeq, st.storeName \r\n" + 
					"order by rvp.productSeq asc", where, where_cate);
			
			pstat = conn.prepareStatement(sql);
			
			rs = pstat.executeQuery();
			
			System.out.println("food:" + sql);
			
			ArrayList<productDTO> productListFood = new ArrayList<productDTO>();
			
			while (rs.next()) {
				
				productDTO dto = new productDTO();
				
				dto.setProductSeq(rs.getString("productSeq"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getString("productPrice"));
				dto.setProductImage(rs.getString("productImage"));
				dto.setReviewScore(rs.getDouble("joinReviewScore"));
				dto.setReviewCount(rs.getInt("joinReviewCount"));
				
				productListFood.add(dto);
				
			}
			
			System.out.println(productListFood);
			
			return productListFood;
			
		} catch (Exception e) {
			System.out.println("storeDAO.plistFood");
			e.printStackTrace();
		}
		
		return null;
	}


	public int getTotalCountFood(HashMap<String, String> map) {
		
		//스토어카테고리 -> 식품
		
		try {
			
			String sql = "";
			String where = "";
			String where_cate= "";
			
			if (map.get("isSearch").equals("y")) {
				
				//System.out.println(map.get("word"));
				where = String.format("and productName like '%%' || '%s' || '%%'", map.get("word"));				
				
			}
			
			
			if (map.get("getFoodCategory").equals("ALL")) {
				
				where_cate = "";
				
			} else if (map.get("getFoodCategory") != null && map.get("getFoodCategory") != "" ) {
				
				//System.out.println("map.get(getFoodCategory):" + map.get("getFoodCategory"));
				where_cate = String.format("and cg.categoryName = '%s'" , map.get("getFoodCategory"));
				
			}

			
			sql =  "select count(pd.productSeq) as cnt from tblProduct pd \r\n" + 
					"        inner join tblCategory cg on pd.categorySeq = cg.categorySeq\r\n" + 
					"		 inner join tblStore st on st.storeSeq = cg.storeSeq\r\n" +		
					"			where st.storeSeq = 2" + where + where_cate;
			
			
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				//System.out.println(sql);
				//System.out.println(rs.getInt("cnt"));
				return rs.getInt("cnt");
				
			}
			
		} catch (Exception e) {
			System.out.println("storeDAO.getTotalCountFood");
			e.printStackTrace();
		}
		
		return 0;
	}


	public ArrayList<productDTO> plistSupplies(HashMap<String, String> map) {
		
		//스토어카테고리 -> 용품
		
		try {
			
			String sql = "";
			String where = "";
			String where_cate = "";
			
			
			if (map.get("isSearch").equals("y")) {
				
				//System.out.println(map.get("word"));
				where = String.format("and productName like '%%' || '%s' || '%%'", map.get("word"));				
				
			}
			
			
			if (map.get("getSuppliesCategory").equals("ALL")) {
				
				where_cate = String.format("where rnum between %s and %s", map.get("begin"), map.get("end"));
				
			} else if (map.get("getSuppliesCategory") != null && map.get("getSuppliesCategory") != "" ) {
				
				//System.out.println("map.get(getSuppliesCategory):" + map.get("getSuppliesCategory"));
				where_cate = String.format("where cg.categoryName = '%s'" , map.get("getSuppliesCategory"));
				
			}

			
			sql = String.format("select rvp.productSeq, rvp.productName, rvp.productInventory, rvp.productPrice, rvp.productImage, rvp.productDetailImage, rvp.categorySeq, st.storeSeq, st.storeName, \r\n" + 
					"        CASE WHEN rv.reviewScore is null THEN 0\r\n" + 
					"            ELSE rv.reviewScore\r\n" + 
					"        END AS \"joinReviewScore\",\r\n" + 
					"        count(rv.reviewScore) AS \"joinReviewCount\",\r\n" + 
					"        cg.categoryName\r\n" + 
					"            from (select rownum as rnum, a.* from vwProduct a where storeSeq = 3 %s) rvp \r\n" +
					"				full outer join tblReview rv on rvp.productSeq = rv.productSeq \r\n" + 
					"				inner join tblCategory cg on rvp.categorySeq = cg.categorySeq \r\n" +
					"				inner join tblStore st on st.storeSeq = cg.storeSeq \r\n" +
					"%s \r\n" + 
					"group by rvp.productSeq, rvp.productName, rvp.productInventory, rvp.productPrice, rvp.productImage, rvp.productDetailImage, rvp.categorySeq, rv.reviewScore, cg.categoryName, st.storeSeq, st.storeName \r\n" + 
					"order by rvp.productSeq asc", where, where_cate);
			
			pstat = conn.prepareStatement(sql);
			
			rs = pstat.executeQuery();
			
			System.out.println("supplies:" + sql);
			
			ArrayList<productDTO> productListSupplies = new ArrayList<productDTO>();
			
			while (rs.next()) {
				
				productDTO dto = new productDTO();
				
				dto.setProductSeq(rs.getString("productSeq"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getString("productPrice"));
				dto.setProductImage(rs.getString("productImage"));
				dto.setReviewScore(rs.getDouble("joinReviewScore"));
				dto.setReviewCount(rs.getInt("joinReviewCount"));
				
				productListSupplies.add(dto);
				
			}
			
			System.out.println(productListSupplies);
			
			return productListSupplies;
			
		} catch (Exception e) {
			System.out.println("storeDAO.plistSupplies");
			e.printStackTrace();
		}
		
		return null;
	}


	public int getTotalCountSupplies(HashMap<String, String> map) {
		
		//스토어카테고리 -> 용품
		
		try {
			
			String sql = "";
			String where = "";
			String where_cate = "";
			
			if (map.get("isSearch").equals("y")) {
				
				//System.out.println(map.get("word"));
				where = String.format("and productName like '%%' || '%s' || '%%'", map.get("word"));				
				
			}
			
			
			if (map.get("getSuppliesCategory").equals("ALL")) {
				
				where_cate = "";
				
			} else if (map.get("getSuppliesCategory") != null && map.get("getSuppliesCategory") != "" ) {
				
				//System.out.println("map.get(getSuppliesCategory):" + map.get("getSuppliesCategory"));
				where_cate = String.format("and cg.categoryName = '%s'" , map.get("getSuppliesCategory"));
				
			}

			
			sql = "select count(pd.productSeq) as cnt from tblProduct pd \r\n" + 
					"        inner join tblCategory cg on pd.categorySeq = cg.categorySeq\r\n" + 
					"		 inner join tblStore st on st.storeSeq = cg.storeSeq\r\n" +		
					"			where st.storeSeq = 3" + where + where_cate;
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				//System.out.println(sql);
				//System.out.println(rs.getInt("cnt"));
				return rs.getInt("cnt");
				
			}
			
		} catch (Exception e) {
			System.out.println("storeDAO.getTotalCountSupplies");
			e.printStackTrace();
		}
		
		return 0;
	}


	public ArrayList<productDTO> bestProduct() {
		
		try {
			//String sql = "select * from (select count(*) as cnt, PRODUCTSEQ from TBLORDERPRODUCT group by PRODUCTSEQ) a inner join TBLPRODUCT p on a.productSeq = p.PRODUCTSEQ order by cnt desc";
			String sql = "select * from tblProduct";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<productDTO> list = new ArrayList<productDTO>();
			
			while(rs.next()) {
				productDTO dto = new productDTO();
				
				dto.setProductName(rs.getString("productName"));
				dto.setProductSeq(rs.getString("productSeq"));
				dto.setProductPrice(rs.getString("productPrice"));
				dto.setProductImage(rs.getString("productImage"));
				
				list.add(dto);
			}
			
			return list;
			
			

		} catch (Exception e) {
			System.out.println("bestProduct");
			e.printStackTrace();
		}
		
		return null;
	}


	public ArrayList<reviewDTO> indexReview() {
		
		try {
			String sql = "select * from tblReview r inner join TBLMEMBER m on m.MEMBERSEQ = r.MEMBERSEQ inner join TBLLV l on m.MEMBERLVSEQ = l.LVSEQ order by reviewSeq desc";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<reviewDTO> list = new ArrayList<reviewDTO>();
			
			while(rs.next()) {
				reviewDTO dto = new reviewDTO();
				
				dto.setReviewContent(rs.getString("reviewContent"));
				dto.setMemberName(rs.getString("name"));
				dto.setLvName(rs.getString("lv"));
				dto.setProductSeq(rs.getString("productSeq"));
				
				list.add(dto);

			}
			
			return list;
			

		} catch (Exception e) {
			System.out.println("indexReview");
			e.printStackTrace();
		}
		
		return null;
	}


	public int boardTotalNum() {
		
		try {
			String sql = "select (select count(*) from TBLQNABOARD) + (select count(*) from TBLFREEBOARD ) + (select count(*) from tblNotice) as cnt from dual";
			
			stat = conn.createStatement();
			
			rs= stat.executeQuery(sql);
			
			rs.next();
			
			return rs.getInt("cnt");

		} catch (Exception e) {
			System.out.println("boardTotalNum");
			e.printStackTrace();
		}
		
		return 0;
	}


	public int productTotalNum() {
		try {
			String sql = "select count(*) as cnt from tblProduct";
			
			stat = conn.createStatement();
			
			rs= stat.executeQuery(sql);
			
			rs.next();
			
			return rs.getInt("cnt");

		} catch (Exception e) {
			System.out.println("productTotalNum");
			e.printStackTrace();
		}
		return 0;
	}


	public int reviewTotalNum() {
		try {
			
			String sql = "select count(*) as cnt from tblReview";
			
			stat = conn.createStatement();
			
			rs= stat.executeQuery(sql);
			
			rs.next();
			
			return rs.getInt("cnt");
			

		} catch (Exception e) {
			System.out.println("reviewTotalNum");
			e.printStackTrace();
		}
		
		return 0;
	}


	public int memberTotalNum() {
		
		try {
			
			String sql = "select count(*) as cnt from tblMember";
			
			stat = conn.createStatement();
			
			rs= stat.executeQuery(sql);
			
			rs.next();
			
			return rs.getInt("cnt");
			

		} catch (Exception e) {
			System.out.println("reviewTotalNum");
			e.printStackTrace();
		}
		
		return 0;
	}
	
	
	
	
}
