package com.test.recommend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;

import com.test.my.DBUtil;
import com.test.store.productDTO;

public class RecommendDAO {
	private Connection conn = null;
	private PreparedStatement pstat = null;
	private Statement stat = null;
	private ResultSet rs = null;

	public RecommendDAO() {
		conn = DBUtil.open();
	}

	public ArrayList<productDTO> getSearch(String word){

		try {

			String sql = "select PRODUCTNAME\n"
					+ "	, (select PRODUCTPRICE from TBLPRODUCT where PRODUCTNAME = v.PRODUCTNAME) as productPrice\n"
					+ "	, (select PRODUCTIMAGE from TBLPRODUCT where PRODUCTNAME = v.PRODUCTNAME) as productImage\n"
					+ "	, (select PRODUCTSEQ from TBLPRODUCT where PRODUCTNAME = v.PRODUCTNAME) as productSeq\n"
					+ "		from vwIntake v where PRODUCTNAME like '%"+word+"%' group by PRODUCTNAME";

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			ArrayList<productDTO> list = new ArrayList<productDTO>();

			while (rs.next()) {
				productDTO dto = new productDTO();

				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getString("productPrice"));
				dto.setProductImage(rs.getString("productImage"));
				dto.setProductSeq(rs.getString("productSeq"));

				list.add(dto);

			}
			
			rs.close();
			stat.close();
			
			return list;
			
			

		} catch (Exception e) {
			System.out.println("getSearch");
			e.printStackTrace();
		}
		
		
		return null;
		
		
	}

	public int getSearchCount(String word) {
		try {
			String sql = "select count(*) cnt from (select PRODUCTNAME from vwIntake v where PRODUCTNAME like '%"+word+"%' group by PRODUCTNAME)";

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			rs.next();

			return rs.getInt("cnt");

		} catch (Exception e) {
			System.out.println("com.test.recommend, getSearchCount");
			e.printStackTrace();
		}
		return 0;
	}

	public productDTO recommendAddItem(String seq) {

		try {
			String sql = "select * from tblProduct where productSeq=?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			while (rs.next()) {
				productDTO dto = new productDTO();

				dto.setProductSeq(rs.getString("productSeq"));
				dto.setProductImage(rs.getString("productImage"));
				dto.setProductName(rs.getString("productName"));

				return dto;
			}
		} catch (Exception e) {
			System.out.println("com.test.recommend, getSearchCount");
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<recommendChartDTO> recommendChartList(String[] productSeq) {

		try {

			ArrayList<recommendChartDTO> list = new ArrayList<recommendChartDTO>();

			for (String seq : productSeq) {
				String sql = "select * from vwIntake where productSeq = ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, seq);

				rs = pstat.executeQuery();

				while (rs.next()) {
					recommendChartDTO dto = new recommendChartDTO();

					if (list.size() == 0) {
						dto.setProductSeq(rs.getString("productSeq"));
						dto.setProductName(rs.getString("productName"));
						dto.setIngredientName(rs.getString("ingredientName"));
						dto.setNutritionalIntake(rs.getString("nutritionalIntake"));
						dto.setIngredientIntake(rs.getString("ingredientIntake"));

						list.add(dto);
					} else {

						for (int i = 0; i < list.size(); i++) {

							if (list.get(i).getIngredientName().equals(rs.getString("ingredientName"))) {

								String[] split = list.get(i).getNutritionalIntake().split("\\(");
								double num = Double.parseDouble(split[0]);

								split = rs.getString("nutritionalIntake").split("\\(");
								num = num + Double.parseDouble(split[0]);

								dto.setProductSeq(rs.getString("productSeq"));
								dto.setProductName(rs.getString("productName"));
								dto.setIngredientName(rs.getString("ingredientName"));
								dto.setNutritionalIntake(num + "");
								dto.setIngredientIntake(rs.getString("ingredientIntake"));

								list.add(dto);
								break;

							} else {
								dto.setProductSeq(rs.getString("productSeq"));
								dto.setProductName(rs.getString("productName"));
								dto.setIngredientName(rs.getString("ingredientName"));
								dto.setNutritionalIntake(rs.getString("nutritionalIntake"));
								dto.setIngredientIntake(rs.getString("ingredientIntake"));

								list.add(dto);
								break;
							}
						}
					}

				}

			}

			ArrayList<recommendChartDTO> result = new ArrayList<recommendChartDTO>();
			Boolean exist = false;

			for (recommendChartDTO dto : list) {

				recommendChartDTO newdto = new recommendChartDTO();

				if (result.size() == 0) {
					String[] split = dto.getIngredientIntake().split("\\(");
					double num = Double.parseDouble(split[0]);
					newdto.setIngredientIntake(num + "");

					split = dto.getNutritionalIntake().split("\\(");
					num = Double.parseDouble(split[0]);
					newdto.setNutritionalIntake(num + "");
					newdto.setMeasure("(" + split[1]);
					newdto.setIngredientName(dto.getIngredientName());
					newdto.setProductName(dto.getProductName());

					newdto.setProductSeq(dto.getProductSeq());
					
					newdto.setIngredient(dto.getIngredientName());

					result.add(newdto);
				} else {
					for (recommendChartDTO d : result) {
						if (dto.getIngredientName().equals(d.getIngredientName())) {
							exist = true;

							String[] split = d.getNutritionalIntake().split("\\(");
							double num = Double.parseDouble(split[0]);

							split = dto.getNutritionalIntake().split("\\(");
							num = num + Double.parseDouble(split[0]);

							newdto.setIngredientName(dto.getIngredientName());
							newdto.setMeasure("(" + split[1]);

							newdto.setNutritionalIntake(num + "");

							split = dto.getIngredientIntake().split("\\(");
							num = Double.parseDouble(split[0]);

							newdto.setIngredientIntake(num + "");
							newdto.setProductName(dto.getProductName());

							newdto.setProductSeq(dto.getProductSeq());
							
							newdto.setIngredient(dto.getIngredientName());

							result.remove(d);
							result.add(newdto);

							break;
						}
					}

					if (!exist) {
						newdto.setIngredientName(dto.getIngredientName());
						newdto.setProductName(dto.getProductName());

						String[] split = dto.getIngredientIntake().split("\\(");
						double num = Double.parseDouble(split[0]);
						newdto.setIngredientIntake(num + "");

						split = dto.getNutritionalIntake().split("\\(");
						num = Double.parseDouble(split[0]);
						newdto.setNutritionalIntake(num + "");
						newdto.setProductSeq(dto.getProductSeq());
						newdto.setMeasure("(" + split[1]);
						
						newdto.setIngredient(dto.getIngredientName());

						result.add(newdto);
					}
				}

			}

			return result;

		} catch (Exception e) {
			System.out.println("WebProjectNP, recommendChartList");
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<VwIntakeNumDTO> vwRcommendItem(ArrayList<recommendChartDTO> list) {
		try {

			ArrayList<VwIntakeNumDTO> vwlist = new ArrayList<VwIntakeNumDTO>();

			for (recommendChartDTO rdto : list) {
				String sql = "select * from vwIntakeNum where ingredientName like '%' || ? || '%' and intake <= ? and not productName like '%' || ? || '%'";

				double num = Double.parseDouble(rdto.getIngredientIntake())
						- Double.parseDouble(rdto.getNutritionalIntake());

				pstat = conn.prepareStatement(sql);
				pstat.setString(1, rdto.getIngredientName());
				pstat.setString(2, num + "");
				pstat.setString(3, rdto.getProductName());

				rs = pstat.executeQuery();

				while (rs.next()) {
					VwIntakeNumDTO vdto = new VwIntakeNumDTO();

					vdto.setIngredientName(rs.getString("ingredientName"));
					vdto.setIntake(rs.getString("intake"));
					vdto.setProductImage(rs.getString("productImage"));
					vdto.setProductName(rs.getString("productName"));

					vwlist.add(vdto);

				}
			}

			return vwlist;

		} catch (Exception e) {
			System.out.println("vwRcommendItem");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<recommendChartDTO> warningTxt(ArrayList<recommendChartDTO> list) {

		ArrayList<recommendChartDTO> warningList = new ArrayList<recommendChartDTO>();

		for (recommendChartDTO dto : list) {

			String txt = "";

			recommendChartDTO newdto = new recommendChartDTO();

			if (warningList.size() == 0) {
				
				if (dto.getIngredientName().equals("칼슘") || dto.getIngredientName().equals("마그네슘")) {
					txt += "칼슘/마그네슘은 철분과 함께 복용하면 시너지 역할을 얻지 못하는 상극의 영양제입니다.<br>체네에 흡수되는 통로가 유일하기에 함께 복용하면 체내 흡수를 방해시킨답니다!<br>또한 골다공증약과도 상극이니 주의하세요!<br>";

				}
				else if (dto.getIngredientName().equals("아연")) {
					txt += "아연은 셀레늄의 흡수를 저해하고 철분과 아연은 서로 흡수를 방해해요! 따라서 아연과 셀레늄/철분은 따로 먹어야해요!<br>";
				}
				else if (dto.getIngredientName().equals("비타민C") || dto.getIngredientName().equals("구리")) {
					txt += "비타민C는 구리 흡수를 억제해요! 그러므로 구리가 들어있는 종합비타민을 아무리 먹어도 비타민C가 포함되어있으면 아무런 효과가 없어요. 구리가 걱정이 된다면 음식을 통해 추가 섭취를 해보세요!<br>";
				}
				
				if(!(txt.equals(""))){

					newdto.setWarning(txt);
					newdto.setProductName(dto.getProductName());
					newdto.setProductImage("product_" + dto.getProductSeq() + ".png");
					newdto.setIngredient(dto.getIngredient());
	
					warningList.add(newdto);
				}

			} else {

				boolean result = false;

				for (recommendChartDTO searchdto : warningList) {
					if (searchdto.getProductName().equals(dto.getProductName())) {
						
						if(searchdto.getIngredient().equals("칼슘") || searchdto.getIngredient().equals("마그네슘")) {
							
							if (dto.getIngredientName().equals("아연")) {
								txt += searchdto.getWarning() + "아연은 셀레늄의 흡수를 저해하고 철분과 아연은 서로 흡수를 방해해요! 따라서 아연과 셀레늄/철분은 따로 먹어야해요!<br><br>";
							}
							else if (dto.getIngredientName().equals("비타민C") || dto.getIngredientName().equals("구리")) {
								txt += searchdto.getWarning() + "비타민C는 구리 흡수를 억제해요! 그러므로 구리가 들어있는 종합비타민을 아무리 먹어도 비타민C가 포함되어있으면 아무런 효과가 없어요. 구리가 걱정이 된다면 음식을 통해 추가 섭취를 해보세요!";
							}else {
								result = true;
								break;
							}
						}
						
						else if(searchdto.getIngredient().equals("아연")) {
							if (dto.getIngredientName().equals("칼슘") || dto.getIngredientName().equals("마그네슘")) {
								txt += searchdto.getWarning() + "칼슘/마그네슘은 철분과 함께 복용하면 시너지 역할을 얻지 못하는 상극의 영양제입니다.<br>체네에 흡수되는 통로가 유일하기에 함께 복용하면 체내 흡수를 방해시킨답니다!<br>또한 골다공증약과도 상극이니 주의하세요!<br><br>";
							}
							else if (dto.getIngredientName().equals("비타민C") || dto.getIngredientName().equals("구리")) {
								txt += searchdto.getWarning() + "비타민C는 구리 흡수를 억제해요! 그러므로 구리가 들어있는 종합비타민을 아무리 먹어도 비타민C가 포함되어있으면 아무런 효과가 없어요. 구리가 걱정이 된다면 음식을 통해 추가 섭취를 해보세요!";
							}else {
								result = true;
								break;
							}
						}
						
						else if(searchdto.getIngredient().equals("비타민C")) {
							
							if (dto.getIngredientName().equals("칼슘") || dto.getIngredientName().equals("마그네슘")) {
								txt += searchdto.getWarning() + "칼슘/마그네슘은 철분과 함께 복용하면 시너지 역할을 얻지 못하는 상극의 영양제입니다.<br>체네에 흡수되는 통로가 유일하기에 함께 복용하면 체내 흡수를 방해시킨답니다!<br>또한 골다공증약과도 상극이니 주의하세요!<br><br>";
							}
							else if (dto.getIngredientName().equals("아연")) {
								txt += searchdto.getWarning() + "아연은 셀레늄의 흡수를 저해하고 철분과 아연은 서로 흡수를 방해해요! 따라서 아연과 셀레늄/철분은 따로 먹어야해요!<br><br>";
							}else {
								result = true;
								break;
							}
						}
						
						searchdto.setWarning(txt);
						result = true;
					}

				}

				if (!result) {
					txt = "";

					if (dto.getIngredientName().equals("칼슘") || dto.getIngredientName().equals("마그네슘")) {
						txt = "칼슘/마그네슘은 철분과 함께 복용하면 시너지 역할을 얻지 못하는 상극의 영양제입니다.<br>체네에 흡수되는 통로가 유일하기에 함께 복용하면 체내 흡수를 방해시킨답니다!<br>또한 골다공증약과도 상극이니 주의하세요!<br><br>";

					}
					if (dto.getIngredientName().equals("아연")) {
						txt += "아연은 셀레늄의 흡수를 저해하고 철분과 아연은 서로 흡수를 방해해요! 따라서 아연과 셀레늄/철분은 따로 먹어야해요!<br><br>";
					}
					if (dto.getIngredientName().equals("비타민C") || dto.getIngredientName().equals("구리")) {
						txt += "비타민C는 구리 흡수를 억제해요! 그러므로 구리가 들어있는 종합비타민을 아무리 먹어도 비타민C가 포함되어있으면 아무런 효과가 없어요. 구리가 걱정이 된다면 음식을 통해 추가 섭취를 해보세요!<br><br>";
					}

					if(!(txt.equals(""))){
						newdto.setWarning(txt);
						newdto.setProductName(dto.getProductName());
						newdto.setProductImage("product_" + dto.getProductSeq() + ".png");
						newdto.setIngredient(dto.getIngredient());
	
						warningList.add(newdto);
					}

				}
			}

		}

		if (warningList.size() != 0) {
			return warningList;
		} else {
			return null;
		}
	}


}
