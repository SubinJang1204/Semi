package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.ShopAnswerDto;
import data.dto.ShopDto;
import mysql.db.DbConnect;

public class ShopAnswerDao {

	DbConnect db=new DbConnect();
	
public void insertAnswer(ShopAnswerDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		//나중에 좋아요 이런 애들도 0값  넣어주면 됨
		String sql="insert into shopanswer (shopnum,myid,content,writeday) values(?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getShopnum());
			pstmt.setString(2, dto.getMyid());
			pstmt.setString(3, dto.getContent());
		
			
			pstmt.execute();
			
			//실행
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}

//List
//List
public List<ShopAnswerDto> getAnswerList(String shopnum) {
   
   List<ShopAnswerDto> list = new ArrayList<>();
   
   Connection conn = db.getConnection();
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   String sql = "SELECT * FROM shopanswer WHERE shopnum=? ORDER BY idx DESC";
   
   try {
      pstmt = conn.prepareStatement(sql);
      
      pstmt.setString(1, shopnum);
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
         
         ShopAnswerDto dto = new ShopAnswerDto();
         
         dto.setIdx(rs.getString("idx"));
         dto.setShopnum(rs.getString("shopnum"));
         dto.setMyid(rs.getString("myid"));
         dto.setContent(rs.getString("content"));
         dto.setShopanswer(rs.getString("shopanswer"));
         dto.setWriteday(rs.getTimestamp("writeday"));
         
         list.add(dto);
      }
      
   } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
   } finally {
      db.dbClose(rs, pstmt, conn);
   }
   
   return list;
}

//샵 주인 댓글
public void updateShopAnswer(String idx, String answer) {
	
	Connection conn=db.getConnection();
	PreparedStatement pstmt=null;
	
	String sql="update shopanswer set shopanswer=? where idx=?";
	
	try {
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, answer);
		pstmt.setString(2, idx);
		
		pstmt.execute();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		db.dbClose(pstmt, conn);
	}
}

//삭제
public void deleteAnswer(String idx) {
	
	Connection conn=db.getConnection();
	PreparedStatement pstmt=null;
	
	String sql="delete from shopanswer where idx=?";
	
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

}
