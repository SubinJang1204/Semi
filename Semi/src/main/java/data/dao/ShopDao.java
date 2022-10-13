package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import data.dto.CartDto;
import data.dto.ShopDto;
import data.dto.SmartDto;
import mysql.db.DbConnect;

public class ShopDao {

	DbConnect db=new DbConnect();
	
public void insertShop(ShopDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		//나중에 좋아요 이런 애들도 0값  넣어주면 됨
		String sql="insert into shop (category,sangpum,photo,price,ipgoday,sangsae) values(?,?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getSangpum());
			pstmt.setString(3, dto.getPhoto());
			pstmt.setInt(4, dto.getPrice());
			pstmt.setString(5, dto.getIpgoday());
			pstmt.setString(6, dto.getSangsae());

			pstmt.execute();
			
			//실행
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}

///update
	public void updateShop(ShopDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update shop set category=?,sangpum=?,photo=?,price=?,ipgoday=?,sangsae=? where shopnum=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getSangpum());
			pstmt.setString(3, dto.getPhoto());
			pstmt.setInt(4, dto.getPrice());
			pstmt.setString(5, dto.getIpgoday());
			pstmt.setString(6, dto.getSangsae());
			pstmt.setString(7, dto.getShopnum());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//delete
	public void deleteShop(String shopnum) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from shop where shopnum=?";
		
		try {
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,shopnum);
		pstmt.execute();
		
	}catch(SQLException e){
		e.printStackTrace();
	}finally {
		db.dbClose(pstmt, conn);
	}
		
	}

public int getTotalCount() {
	
	Connection conn=db.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs=null;
	
	String sql="select count(*) from shop";
	int n=0;
	
	try {
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			n=rs.getInt(1);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		db.dbClose(rs, pstmt, conn);
	}
	return n;
}
//pagingList
	public List<ShopDto> getList(int start,int perpage){
		List<ShopDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select*from shop order by shopnum desc limit ?,?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ShopDto dto=new ShopDto();
				
				dto.setShopnum(rs.getString("shopnum"));
				dto.setCategory(rs.getString("category"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setPhoto(rs.getString("photo"));
				dto.setPrice(rs.getInt("price"));
				dto.setIpgoday(rs.getString("ipgoday"));
				 dto.setSangsae(rs.getString("sangsae"));

				//리스트에 추가
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}

	
	//onedata
	public ShopDto getData(String shopnum) {
		ShopDto dto=new ShopDto();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select*from shop where shopnum=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, shopnum);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setShopnum(rs.getString("shopnum"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setCategory(rs.getString("category"));			
				dto.setIpgoday(rs.getString("ipgoday"));
				dto.setPrice(rs.getInt("price"));
				dto.setPhoto(rs.getString("photo"));
				dto.setLikes(rs.getInt("likes"));
				dto.setSangsae(rs.getString("sangsae"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db. dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	//cart insert
public void insertCart(CartDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		//나중에 좋아요 이런 애들도 0값  넣어주면 됨
		String sql="insert into cart values(null,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getShopnum());
			pstmt.setString(2, dto.getNum());	
			pstmt.setInt(3, dto.getCnt());
			pstmt.setInt(4, dto.getPojang());
		
			pstmt.execute();
			
			//실행
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
//장바구니 출력
public List<HashMap<String, String>> getCartList(String id){
	
	List<HashMap<String, String>> list=new ArrayList<HashMap<String, String>>();
	
	Connection conn=db.getConnection();
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="select c.idx, s.sangpum, s.shopnum, s.photo, s.price, c.cnt, c.pojang, c.cartday "
			+ "from cart c,  shop s, member m"
					+ " where c.shopnum=s.shopnum and c.num=m.num and m.id=?" ;
	
	try {
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, String> map=new HashMap<String, String>();
			
			map.put("idx", rs.getString("idx"));
			map.put("sangpum", rs.getString("sangpum"));
			map.put("shopnum", rs.getString("shopnum"));
			map.put("photo", rs.getString("photo"));
			map.put("price", rs.getString("price"));
			map.put("cnt", rs.getString("cnt"));
			map.put("pojang", rs.getString("pojang"));
			map.put("cartday", rs.getString("cartday"));
			
			
			list.add(map);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		db.dbClose(rs, pstmt, conn);
	}
	return list;
}



//장바구니에서 체크한 상품 삭제
public void deleteCart(String idx) {
	Connection conn=db.getConnection();
	PreparedStatement pstmt=null;
	
	String sql="delete from cart where idx=?";
	
	try {
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, idx);
		pstmt.execute();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		db.dbClose(pstmt, conn);
	}
}

//가격높은순
	public List<ShopDto> getpriceDescSangpums(){
		List<ShopDto>list=new ArrayList<>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from shop order by price desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ShopDto dto=new ShopDto();
				dto.setShopnum(rs.getString("shopnum"));
				dto.setCategory(rs.getString("category"));
				dto.setPhoto(rs.getString("photo"));
				dto.setPrice(rs.getInt("price"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setIpgoday(rs.getString("ipgoday"));
				dto.setLikes(rs.getInt("likes"));
				dto.setSangsae(rs.getString("sangsae"));

				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	
	//가격낮은순
		public List<ShopDto> getpriceAscSangpums(){
			List<ShopDto>list=new ArrayList<>();
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from shop order by price";
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					ShopDto dto=new ShopDto();
					dto.setShopnum(rs.getString("shopnum"));
					dto.setCategory(rs.getString("category"));
					dto.setPhoto(rs.getString("photo"));
					dto.setPrice(rs.getInt("price"));
					dto.setSangpum(rs.getString("sangpum"));
					dto.setIpgoday(rs.getString("ipgoday"));
					dto.setLikes(rs.getInt("likes"));
					 dto.setSangsae(rs.getString("sangsae"));

					list.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return list;
		}
		//서치
				public List<ShopDto> getSearchSang(String sangpum){
					List<ShopDto> list=new ArrayList<>();
					Connection conn=db.getConnection();
					PreparedStatement pstmt=null;
					ResultSet rs=null;
					
					String sql="select * from shop where sangpum like ?";
					
					try {
						pstmt=conn.prepareStatement(sql);
						pstmt.setString(1, "%"+sangpum+"%");
						
						rs=pstmt.executeQuery();
						
						while(rs.next()) {
							ShopDto dto=new ShopDto();
							
							dto.setShopnum(rs.getString("shopnum"));
							dto.setCategory(rs.getString("category"));
							dto.setPhoto(rs.getString("photo"));
							dto.setPrice(rs.getInt("price"));
							dto.setSangpum(rs.getString("sangpum"));
							dto.setIpgoday(rs.getString("ipgoday"));
							dto.setLikes(rs.getInt("likes"));
							list.add(dto);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						db.dbClose(rs, pstmt, conn);
					}
					return list;
				}
		
		public List<ShopDto> getbest(){
			List<ShopDto>list=new ArrayList<>();
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from shop order by likes desc";
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					ShopDto dto=new ShopDto();
					dto.setShopnum(rs.getString("shopnum"));
					dto.setCategory(rs.getString("category"));
					dto.setPhoto(rs.getString("photo"));
					dto.setPrice(rs.getInt("price"));
					dto.setSangpum(rs.getString("sangpum"));
					dto.setIpgoday(rs.getString("ipgoday"));
					dto.setLikes(rs.getInt("likes"));
					
					list.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return list;
		}

		public void updatelikes(String shopnum) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="update shop set likes=likes+1 where shopnum=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, shopnum);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
			
		}
		//전체 상품 반환
		public List<ShopDto> getAllSangpums(){
			List<ShopDto>list=new ArrayList<>();
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from shop order by shopnum desc";
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					ShopDto dto=new ShopDto();
					dto.setShopnum(rs.getString("shopnum"));
					dto.setCategory(rs.getString("category"));
					dto.setPhoto(rs.getString("photo"));
					dto.setPrice(rs.getInt("price"));
					dto.setSangpum(rs.getString("sangpum"));
					dto.setIpgoday(rs.getString("ipgoday"));
					dto.setLikes(rs.getInt("likes"));
					
					list.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return list;
		}
}
