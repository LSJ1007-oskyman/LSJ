package reboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDBBean {
	private static BoardDBBean instance = new BoardDBBean();
	private static Connection conn = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	
	public static  BoardDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		Context  init=new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/orcl");
		
		return ds.getConnection();
	}
	
	public int insert(BoardDataBean board) {
		int result=0;
		try {
			conn = getConnection();
			
			String sql = "insert into reboard values(reboard_seq.nextval,?,?,?,?,sysdate,0,reboard_seq.nextval,0,0,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getEmail());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getPasswd());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getIp());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int getCount() {
		int result=0;
		try {
			conn = getConnection();
			
			String sql = "select count(*) from reboard";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public List<BoardDataBean> getList(int startRow, int endRow) {
		List<BoardDataBean> list = new ArrayList<BoardDataBean>();
		try {
			conn = getConnection();
			
			String sql = "select * from (select rownum as rnum, board.*  from (select* from reboard order by ref desc, re_step asc) board ) where rnum between ? and ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,startRow);
			pstmt.setInt(2,endRow);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDataBean dto = new BoardDataBean();
				
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setEmail(rs.getString("email"));
				dto.setSubject(rs.getString("subject"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRef(rs.getInt("readcount"));
				dto.setRe_step(rs.getInt("re_step"));
				dto.setRe_level(rs.getInt("re_level"));
				dto.setContent(rs.getString("content"));				
				dto.setIp(rs.getString("ip"));
				
				list.add(dto);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public BoardDataBean updateContent(int num) {
		BoardDataBean dto = new BoardDataBean();
		
		try {
			conn = getConnection();
			
			String sql = "update reboard set readcount=readcount+1 where num= ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();
			
			
			sql = "select * from reboard where num= ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			rs=pstmt.executeQuery();
			
			
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setEmail(rs.getString("email"));
				dto.setSubject(rs.getString("subject"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRef(rs.getInt("ref"));
				dto.setRe_step(rs.getInt("re_step"));
				dto.setRe_level(rs.getInt("re_level"));
				dto.setContent(rs.getString("content"));				
				dto.setIp(rs.getString("ip"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	public int reply(BoardDataBean board) {
		int result=0;
		
		int ref= board.getRef();
		int re_step=board.getRe_step();
		int re_level = board.getRe_level();
		
		try {
			conn = getConnection();
			
//1. 원문이 부모인 경우
//	 원문이 re_step =0이기 때문에, 모든 댓글들의 re_step값이 1씩 증가 된다.
//2. 댓글이 부모인 경우
//	 부모의 re_step보다 큰 댓글만 re_step값이 1씩 증가 된다.
			
			String sql = "update reboard set re_step=re_step+1 where ref=? and re_step>?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,ref);
			pstmt.setInt(2,re_step);
			pstmt.executeUpdate();
			
			sql = "insert into reboard values(reboard_seq.nextval,?,?,?,?,sysdate,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getEmail());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getPasswd());
			pstmt.setInt(5, 0);
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step+1);
			pstmt.setInt(8, re_level+1);
			pstmt.setString(9, board.getContent());
			pstmt.setString(10, board.getIp());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int isReplyExist(int num) {
		int result=0;
		
	
		
		try {
			conn = getConnection();
			
			String sql = "select count(*) from reply where ref= ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public BoardDataBean getContent(int num) {
		BoardDataBean dto = new BoardDataBean();
		
		try {
			conn = getConnection();
			
			String sql = "select * from reboard where num= ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			rs=pstmt.executeQuery();
			
			
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setEmail(rs.getString("email"));
				dto.setSubject(rs.getString("subject"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRef(rs.getInt("ref"));
				dto.setRe_step(rs.getInt("re_step"));
				dto.setRe_level(rs.getInt("re_level"));
				dto.setContent(rs.getString("content"));				
				dto.setIp(rs.getString("ip"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	
	//글수정
	public int update(BoardDataBean board) {
		int result=0;
		
		try {
			conn = getConnection();
			
			String sql = "update reboard set writer=?,email=?,subject=?,content=? where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,board.getWriter());
			pstmt.setString(2,board.getEmail());
			pstmt.setString(3,board.getSubject());
			pstmt.setString(4,board.getContent());
			pstmt.setInt(5,board.getNum());
			pstmt.executeUpdate();
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	//글삭제
	public int delete(BoardDataBean board) {
		int result=0;
		
		
		
		try {
			conn = getConnection();
			String sql="";
			
			if(board.getRe_level()==0) {
				sql ="update reboard set subject=?,content=? where num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,"관리자에 의해서 삭제되었습니다.");
				pstmt.setString(2," ");
				pstmt.setInt(3,board.getNum());
			}else {
				sql = "delete from reboard where num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1,board.getNum());
			}
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
