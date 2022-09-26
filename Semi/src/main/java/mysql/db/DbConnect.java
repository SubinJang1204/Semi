package mysql.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {

	//mysql 드라이버
	static final String MYSQLDRIVER="com.mysql.jdbc.Driver";
	//url
	static  final String MYSQL_URL="jdbc:mysql://localhost:3306/sist";
	
	//오라클 드라이버.. 생성자..18버전은 생략 가능
	public DbConnect() {

		try {
			Class.forName(MYSQLDRIVER);
			System.out.println("오라클 드라이버 성공");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("오라클 드라이버 실패!");
		}

	}
	
	//Connection...오라클과 자바 연결
	public Connection getConnection() {
		Connection conn=null;
		
		try {
			conn=DriverManager.getConnection(MYSQL_URL, "dragon", "1234");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("오라클 연결 실패... 계정 틀렸는 지 확인"+e.getMessage());
		}
		return conn;
	}
	
	//close 메소드가 총 4개
	
	public void dbClose(ResultSet rs,PreparedStatement pstmt,Connection conn) {
		try {
		if(rs!=null) 
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
	}
	
	
	
	public void dbClose(ResultSet rs,Statement stmt,Connection conn) {
		try {
		if(rs!=null) 
			rs.close();
		if(stmt!=null)
			stmt.close();
		if(conn!=null)
			conn.close();
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
		
		
		public void dbClose(Statement stmt,Connection conn) {
			try {
			
			if(stmt!=null)
				stmt.close();
			if(conn!=null)
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	}

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		DbConnect db= new DbConnect();
		
		
		
	}

}
