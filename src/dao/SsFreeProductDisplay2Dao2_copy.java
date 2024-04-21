package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.자유상품상세검색Dto;

public class SsFreeProductDisplay2Dao2_copy {
	public ArrayList<자유상품상세검색Dto> list상세검색(String search, long pNumber, String pName, String model, String scode,
			String choose, String order) {
		Connection conn = Jdbc.connect();

		ArrayList<자유상품상세검색Dto> listDetail = new ArrayList<자유상품상세검색Dto>();

		String sql = "SELECT p.pnumber, p.image, p.pname, p.sales_status,"
				+ "p.display_status, p.price, c.large, c.middle, c.sub, c.small, p.delivery_cost, "
				+ "(SELECT count(*) from review where product_order_num in (SELECT product_order_num from product_order where pnumber = p.pnumber)) "
				+ ",(SELECT avg(buyer_grade) FROM review where product_order_num in (SELECT product_order_num from product_order where pnumber = p.pnumber))"
				+ " FROM product p, category c, product_order po";
		String sqlPnum = " AND p.pnumber=?";
		String sqlPname = " AND p.pname=?";
		String sqlModel = " AND p.model_name=?";
		String sqlScode = " AND p.pcode=?";
		String free = " AND p.delivery_cost = 0";
		String where = " WHERE p.category_id=c.category_id AND p.pnumber = po.pnumber";
		String groupBy = " GROUP BY p.pnumber, p.image, p.pname, p.sales_status, p.display_status, p.price, c.large, c.middle, c.sub, c.small, p.delivery_cost";
		String popular = ", likey l" + where + " AND p.pnumber=l.pnumber";
		String popular1 = groupBy + ", po.pnumber ORDER BY COUNT(l.pnumber) DESC";
		String register = groupBy + ", po.pnumber "
				+ "ORDER BY (SELECT COUNT(product_order_num) FROM product_order WHERE claim_status = '정상') DESC";
		String regidate = ", review ro" + where + " AND ro.product_order_num = po.product_order_num";
		String regd = "ORDER BY p.product_registration DESC";
		String review = "ORDER BY (SELECT count(*) from review where product_order_num IN (SELECT product_order_num from product_order where pnumber = p.pnumber)) DESC";
		String gr = groupBy + review;

		if (choose.equals("무료배송")) {
			if (search.equals("상품번호") || search.equals("상품명") || search.equals("모델명") || search.equals("판매자상품코드")) {
				switch (order) {
				case "인기도순":
					sql += popular + free;
					break;
				case "누적판매순":
					sql += where + free;
					break;
				case "최신등록순":
					sql += regidate + free;
					break;
				case "리뷰순":
					sql += regidate + free;
					break;
				}
			}
		} else if (choose.equals("리뷰")) {
			if (search.equals("상품번호") || search.equals("상품명") || search.equals("모델명") || search.equals("판매자상품코드")) {
				switch (order) {
				case "인기도순":
					sql += popular;
					if (search.equals("상품번호")) {
						sql += sqlPnum + groupBy + review + ", COUNT(l.pnumber) DESC";
					} else if (search.equals("상품명")) {
						sql += sqlPname + gr
								+ ",(SELECT COUNT(product_order_num) FROM product_order WHERE claim_status = '정상') DESC";
					} else if (search.equals("모델명")) {
						sql += sqlModel + gr + ", p.product_registration DESC";
					} else if (search.equals("판매자상품코드")) {
						sql += sqlScode + gr;
					}
					break;
				case "누적판매순":
					sql += where;
					if (search.equals("상품번호")) {
						sql += sqlPnum + register;
					} else if (search.equals("상품명")) {
						sql += sqlPname + register;
					} else if (search.equals("모델명")) {
						sql += sqlModel + register;
					} else if (search.equals("판매자상품코드")) {
						sql += sqlScode + register;
					}
					break;
				case "최신등록순":
					sql += regidate;
					if (search.equals("상품번호")) {
						sql += sqlPnum + regd;
					} else if (search.equals("상품명")) {
						sql += sqlPname + regd;
					} else if (search.equals("모델명")) {
						sql += sqlModel + regd;
					} else if (search.equals("판매자상품코드")) {
						sql += sqlScode + regd;
					}
					break;
				case "리뷰순":
					sql += regidate;
					if (search.equals("상품번호")) {
						sql += sqlPnum + review;
					} else if (search.equals("상품명")) {
						sql += sqlPname + review;
					} else if (search.equals("모델명")) {
						sql += sqlModel + review;
					} else if (search.equals("판매자상품코드")) {
						sql += sqlScode + review;
					}
					break;
				}
			}
		} else if (choose.equals("전체")) {
			if (search.equals("상품번호") || search.equals("상품명") || search.equals("모델명") || search.equals("판매자상품코드")) {
				switch (order) {
				case "인기도순":
					sql += popular;
					break;
				case "누적판매순":
					sql += where;
					break;
				case "최신등록순":
					sql += regidate;
					break;
				case "리뷰순":
					sql += regidate;
					break;
				}
			}
		}

		if (choose.equals("무료배송") || choose.equals("전체")) {
			switch (order) {
			case "인기도순":
				if (search.equals("상품번호")) {
					sql += sqlPnum + popular1;
				} else if (search.equals("상품명")) {
					sql += sqlPname + popular1;
				} else if (search.equals("모델명")) {
					sql += sqlModel + popular1;
				} else if (search.equals("판매자상품코드")) {
					sql += sqlScode + popular1;
				}
				break;

			case "누적판매순":
				if (search.equals("상품번호")) {
					sql += sqlPnum + register;
				} else if (search.equals("상품명")) {
					sql += sqlPname + register;
				} else if (search.equals("모델명")) {
					sql += sqlModel + register;
				} else if (search.equals("판매자상품코드")) {
					sql += sqlScode + register;
				}
				break;

			case "최신등록순":
				if (search.equals("상품번호")) {
					sql += sqlPnum + regd;
				} else if (search.equals("상품명")) {
					sql += sqlPname + regd;
				} else if (search.equals("모델명")) {
					sql += sqlModel + regd;
				} else if (search.equals("판매자상품코드")) {
					sql += sqlScode + regd;
				}
				break;

			case "리뷰순":
				if (search.equals("상품번호")) {
					sql += sqlPnum + review;
				} else if (search.equals("상품명")) {
					sql += sqlPname + review;
				} else if (search.equals("모델명")) {
					sql += sqlModel + review;
				} else if (search.equals("판매자상품코드")) {
					sql += sqlScode + review;
				}
				break;
			}
		}

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);

			if (search.equals("상품번호")) {
				pstmt.setLong(1, pNumber);
			} else if (search.equals("상품명")) {
				pstmt.setString(1, pName);
			} else if (search.equals("모델명")) {
				pstmt.setString(1, model);
			} else if (search.equals("판매자상품코드")) {
				pstmt.setString(1, scode);
			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				long pnumber = rs.getLong("pnumber");
				String image = rs.getString("image");
				String pname = rs.getString("pname");
				String salesStatus = rs.getString("sales_status");
				String displayStatus = rs.getString("display_status");
				int price = rs.getInt("price");
				String large = rs.getString("large");
				String middle = rs.getString("middle");
				String sub = rs.getString("sub");
				String small = rs.getString("small");
				String dct = (rs.getInt("delivery_cost") == 0 ? "무료" : "유료");
				int reviewCount = rs.getInt(12);
				double grade = rs.getDouble(13);
				자유상품상세검색Dto dto = new 자유상품상세검색Dto(pnumber, image, pname, salesStatus, displayStatus, price, large,
						middle, sub, small, dct, reviewCount, grade);
				listDetail.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listDetail;
	}
}
