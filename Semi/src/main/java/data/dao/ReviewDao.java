package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.ReviewDto;
import data.dto.SmartDto;
import data.dto.TestDto;
import mysql.db.DbConnect;

public class ReviewDao {
   
   DbConnect db=new DbConnect();
   
   
   //댓글 리스트
   public List<ReviewDto> getAllreview(String shopnum){
      
      List<ReviewDto> list=new Vector<>();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from reviewanswer where shopnum=? order by writeday";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, shopnum);
         rs=pstmt.executeQuery();
         
         while(rs.next()) {
            ReviewDto dto=new ReviewDto();
            
            dto.setIdx(rs.getString("idx"));
            dto.setWriter(rs.getString("writer"));
            dto.setPhoto(rs.getString("photo"));
            dto.setContent(rs.getString("content"));
            dto.setSmell(rs.getInt("smell"));
            dto.setTaste(rs.getInt("taste"));
            dto.setDelivery(rs.getInt("delivery"));
            dto.setWriteday(rs.getTimestamp("writeday"));
            
            
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
   
 //댓글 리스트
   public List<ReviewDto> getRecentreview(String writer){
      
      List<ReviewDto> list=new Vector<>();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from reviewanswer where writer=? order by writeday";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, writer);
         rs=pstmt.executeQuery();
         
         while(rs.next()) {
            ReviewDto dto=new ReviewDto();
            
            dto.setIdx(rs.getString("idx"));
          
            dto.setPhoto(rs.getString("photo"));
            dto.setContent(rs.getString("content"));
        
            dto.setWriteday(rs.getTimestamp("writeday"));
            
            
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
   
   //댓글별점 평균 구하기
   public int getReviewAvg(String shopnum) {
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs=null;
      
      String sql="select avg((smell+taste+delivery)/3) from reviewanswer where shopnum=?";
      int n=0;
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, shopnum);
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
   //insert
   public void insertSmart(ReviewDto dto) {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      String sql="insert into reviewanswer (shopnum,photo,writer, content,taste,delivery,smell,writeday) values(?,?,?,?,?,?,?,now())";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, dto.getShopnum());
         pstmt.setString(2, dto.getPhoto());
         pstmt.setString(3, dto.getWriter());
         pstmt.setString(4, dto.getContent());
         pstmt.setInt(5, dto.getTaste());
         pstmt.setInt(6, dto.getDelivery());
         pstmt.setInt(7, dto.getSmell());
         
         
         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }
   }
   
   
   public int getTotalCount(String shopnum) {
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs=null;
      
      String sql="select count(*) from reviewanswer where shopnum=?";
      int n=0;
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, shopnum);
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
   public List<ReviewDto> getList(int start,int perpage, String shopnum){
      List<ReviewDto> list=new Vector<>();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select*from reviewanswer where shopnum=? order by idx desc limit ?,?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, shopnum);
         pstmt.setInt(2, start);
         pstmt.setInt(3, perpage);
         
         rs=pstmt.executeQuery();
         
         while(rs.next()) {
            ReviewDto dto=new ReviewDto();
            
            dto.setIdx(rs.getString("idx"));
            dto.setWriter(rs.getString("writer"));
            dto.setShopnum(rs.getString("shopnum"));
            dto.setPhoto(rs.getString("photo"));
            dto.setContent(rs.getString("content"));
            dto.setSmell(rs.getInt("smell"));
            dto.setTaste(rs.getInt("taste"));
            dto.setDelivery(rs.getInt("delivery"));
            dto.setWriteday(rs.getTimestamp("writeday"));
            
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

   //전체 갯수 반환

   //onedata
   public ReviewDto getData(String idx) {
      ReviewDto dto=new ReviewDto();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select*from reviewanswer where idx=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, idx);
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
            dto.setIdx(rs.getString("idx"));
            dto.setWriter(rs.getString("writer"));
            dto.setShopnum(rs.getString("shopnum"));
            dto.setPhoto(rs.getString("photo"));
            dto.setContent(rs.getString("content"));
            dto.setSmell(rs.getInt("smell"));
            dto.setTaste(rs.getInt("taste"));
            dto.setDelivery(rs.getInt("delivery"));
            dto.setWriteday(rs.getTimestamp("writeday"));
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db. dbClose(rs, pstmt, conn);
      }
      
      return dto;
   }
   
   //update
   public void updateReview(ReviewDto dto) {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="update reviewanswer set photo=?, content=?, taste=?, delivery=?, smell=? where idx=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setString(1, dto.getPhoto());
         pstmt.setString(2, dto.getContent());
         pstmt.setInt(3, dto.getTaste());
         pstmt.setInt(4, dto.getDelivery());
         pstmt.setInt(5, dto.getSmell());
         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }
   }
   
   //delete
   public void deleteReview(String idx) {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="delete from reviewanswer where idx=?";
      
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