package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.DirectOrderDto;
import data.dto.GuestDto;
import data.dto.SmartAnswerDto;
import mysql.db.DbConnect;

public class DirectOrderDao {

DbConnect db=new DbConnect();
	
	//insert
	public void InsertOrder(DirectOrderDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt =null;
		
		String sql="insert into directorder(shopnum,num,receiver,addr,hp,bank,cardnum,cardpass,orderday) values"
				+ "(?,?,?,?,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getShopnum());
			pstmt.setString(2, dto.getNum());
			pstmt.setString(3, dto.getReceiver());
			pstmt.setString(4, dto.getAddr());
			pstmt.setString(5, dto.getHp());
			pstmt.setString(6, dto.getBank());
			pstmt.setString(7, dto.getCardnum());
			pstmt.setString(8, dto.getCardpass());
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
				
				/*
				 * dto.setOnum(rs.getString("idx")); dto.setNum(rs.getString("num"));
				 * dto.setNickname(rs.getString("nickname"));
				 * dto.setContent(rs.getString("content"));
				 * dto.setWriteday(rs.getTimestamp("writeday"));
				 */
				
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
