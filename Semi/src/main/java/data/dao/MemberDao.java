package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import data.dto.MemberDto;
import data.dto.MemberDto;
import mysql.db.DbConnect;

public class MemberDao {

	DbConnect db=new DbConnect();
	
	//아이디 체크, boolean이었다면 0,1이 아니라 true false로
	public int isIdCheck(String id) {
		
		int isid=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from member where id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				//해당 아이디가 존재한다면 1, 존재하지 않으면 0
				/*
				 * if(rs.getInt(1)==1) isid=1;
				 */
				
				isid=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return isid;
	}
	//아이디에 대한 이름 반환
	public String getName(String id) {
		
		String name="";
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select *from member where id=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) 
				
				name=rs.getString("name");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return name;
	}
	
	//아이디를 통해서 num얻기
	//로그인 상태에서 알 수 있는 건 id밖에 없기 때문에... id로 다 알아봐야함
public String getNum(String id) {
		
		String num="";
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select num from member where id=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) 
				
				num=rs.getString("num");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return num;
	}
	
	//insert
public void insertMember(MemberDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		//나중에 좋아요 이런 애들도 0값  넣어주면 됨
		String sql="insert into member (name,id,pass,hp,addr,email,gaipday) values(?,?,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getHp());
			pstmt.setString(5, dto.getAddr());
			pstmt.setString(6, dto.getEmail());
			
			pstmt.execute();
			
			//실행
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//전체출력
public List<MemberDto> getAllMembers(){
	List<MemberDto> list=new Vector<>();
	Connection conn=db.getConnection();
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="select*from member order by id";
	
	try {
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			MemberDto dto=new MemberDto();
			
			dto.setNum(rs.getString("num"));
			dto.setName(rs.getString("name"));
			dto.setId(rs.getString("id"));
			dto.setHp(rs.getString("hp"));
			dto.setAddr(rs.getString("addr"));
			dto.setEmail(rs.getString("email"));
			dto.setGaipday(rs.getTimestamp("gaipday"));
			
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

//비밀번호 체크
public boolean isPassEqual(String num, String pass) {
	
	boolean b=false;
	Connection conn=db.getConnection();
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
    String sql="select*from member where num=? and pass=?";
	
    try {
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, num);
		pstmt.setString(2, pass);
		rs=pstmt.executeQuery();
		
		if(rs.next())
			b=true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    		
    return b;
}

//num반환
public MemberDto getMember(String num) {
	
	MemberDto dto=new MemberDto();
	
	Connection conn=db.getConnection();
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="select*from member where num=?";
	
	try {
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, num);
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			dto.setNum(rs.getString("num"));
			dto.setName(rs.getString("name"));
			dto.setId(rs.getString("id"));
			dto.setPass(rs.getString("pass"));
			dto.setHp(rs.getString("hp"));
			dto.setAddr(rs.getString("addr"));
			dto.setEmail(rs.getString("email"));	
			dto.setGaipday(rs.getTimestamp("gaipday"));
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		db. dbClose(rs, pstmt, conn);
	}
	
	return dto;
}
//수정
	public void updateMember(MemberDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update member set name=?,hp=?,addr=?,email=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
		
			pstmt.setString(2, dto.getHp());
			pstmt.setString(3, dto.getAddr());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getNum());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}

//삭제
public void deleteMember(String num) {
	Connection conn=db.getConnection();
	PreparedStatement pstmt=null;
	
	String sql="delete from member where num=?";
	
	try {
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, num);
		pstmt.execute();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		db.dbClose(pstmt, conn);
	}
}

//아이디와 비번 체크
public boolean isIdPass(String id,String pass) {
	boolean b=false;
	
	Connection conn=db.getConnection();
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="select*from member where id=? and pass=?";
	
	try {
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		
		rs=pstmt.executeQuery();
		
		if(rs.next())
			b=true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		db.dbClose(rs, pstmt, conn);
	}
	
	return b;
}





}
