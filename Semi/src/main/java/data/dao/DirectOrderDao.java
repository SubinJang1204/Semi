package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import data.dto.DirectOrderDto;
import data.dto.GuestDto;
import data.dto.ShopDto;
import data.dto.SmartAnswerDto;
import mysql.db.DbConnect;

public class DirectOrderDao {

DbConnect db=new DbConnect();
	
	//insert
	public void InsertOrder(DirectOrderDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt =null;
		
		String sql="insert into directorder(shopnum,num,photo,sangpum,price,receiver,addr,hp,bank,cardnum,cardpass,orderday) values"
				+ "(?,?,?,?,?,?,?,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getShopnum());
			pstmt.setString(2, dto.getNum());
			pstmt.setString(3, dto.getPhoto());
			pstmt.setString(4, dto.getSangpum());
			pstmt.setInt(5, dto.getPrice());
			pstmt.setString(6, dto.getReceiver());
			pstmt.setString(7, dto.getAddr());
			pstmt.setString(8, dto.getHp());
			pstmt.setString(9, dto.getBank());
			pstmt.setString(10, dto.getCardnum());
			pstmt.setString(11, dto.getCardpass());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public List<DirectOrderDto> getOrderList(String num){
		List<DirectOrderDto> list=new ArrayList<DirectOrderDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select*from directorder where num=? order by onum desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				DirectOrderDto dto=new DirectOrderDto();
				
				  dto.setOnum(rs.getString("onum"));
				  dto.setShopnum(rs.getString("shopnum"));
				  dto.setNum(rs.getString("num"));
				  dto.setPhoto(rs.getString("photo"));
				  dto.setSangpum(rs.getString("sangpum"));
				  dto.setPrice(rs.getInt("price"));
				  dto.setReceiver(rs.getString("receiver"));
				  dto.setAddr(rs.getString("addr"));
				  dto.setHp(rs.getString("hp"));
				  dto.setBank(rs.getString("bank"));
				  dto.setCardnum(rs.getString("cardnum"));
				  dto.setCardpass(rs.getString("cardpass"));
				  dto.setOrderday(rs.getTimestamp("orderday"));
				 		
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
		public DirectOrderDto getDatas(String onum) {
			DirectOrderDto dto=new DirectOrderDto();
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select*from directorder where onum=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, onum);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					dto.setOnum(rs.getString("onum"));
					dto.setShopnum(rs.getString("shopnum"));
					dto.setNum(rs.getString("num"));			
					dto.setPhoto(rs.getString("photo"));			
					dto.setSangpum(rs.getString("sangpum"));			
					dto.setPrice(rs.getInt("price"));			
					dto.setReceiver(rs.getString("receiver"));
					dto.setAddr(rs.getString("addr"));
					dto.setHp(rs.getString("hp"));
					dto.setBank(rs.getString("bank"));
					dto.setCardnum(rs.getString("cardnum"));
					dto.setCardpass(rs.getString("cardpass"));
					dto.setOrderday(rs.getTimestamp("orderday"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db. dbClose(rs, pstmt, conn);
			}
			
			return dto;
		}
		
}
