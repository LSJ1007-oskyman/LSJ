package board;

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
	private static Connection conn=null;
	private static PreparedStatement pstmt=null;
	private static ResultSet rs = null;
	
	public static BoardDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
  		
  		return ds.getConnection();
	}
	
	public int insert(BoardDataBean board) {
		int result =0;
		
		try{
			conn = getConnection();
			String sql= "insert into board values(board_seq.nextval,?,?,?,?,sysdate,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,board.getWriter());
			pstmt.setString(2,board.getEmail());
			pstmt.setString(3,board.getSubject());
			pstmt.setString(4,board.getPasswd());
			pstmt.setInt(5,board.getReadcount());
			pstmt.setString(6,board.getContent());
			pstmt.setString(7,board.getIp());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		return result;
	}
	
	public int getCount() {
		int result =0;
		
		try{
			conn = getConnection();
			String sql= "select count(*) from board";
			
			pstmt = conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		return result;
	}
	
	
	//게시판 목록구하기
	public List<BoardDataBean> getList(int startRow, int endRow) {
		List<BoardDataBean> list = new ArrayList<BoardDataBean>();
		try{
			conn = getConnection();
			String sql= "select * from (select rownum as rnum, board.* from (select * from board order by num desc) board) where rnum between ? and ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDataBean board=new BoardDataBean();
				board.setNum(rs.getInt("num"));
				board.setWriter(rs.getString("writer"));
				board.setEmail(rs.getString("Email"));
				board.setSubject(rs.getString("subject"));
				board.setPasswd(rs.getString("passwd"));
				board.setReg_date(rs.getTimestamp("reg_date"));
				board.setReadcount(rs.getInt("readcount"));
				board.setContent(rs.getString("content"));
				board.setIp(rs.getString("ip"));
				list.add(board);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		return list;
	}
	
	//상세 페이지 :조회수 1증가 + 상세정보 구하기
	public BoardDataBean updateContent(int num) {
		BoardDataBean board = new BoardDataBean();
		
		try{
			conn = getConnection();
			String sql="update board set readcount=readcount+1 where num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			sql = "select * from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				board.setNum(rs.getInt("num"));
				board.setWriter(rs.getString("writer"));
				board.setEmail(rs.getString("Email"));
				board.setSubject(rs.getString("subject"));
				board.setPasswd(rs.getString("passwd"));
				board.setReg_date(rs.getTimestamp("reg_date"));
				board.setReadcount(rs.getInt("readcount"));
				board.setContent(rs.getString("content"));
				board.setIp(rs.getString("ip"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		return board;
	}
	
	public BoardDataBean getContent(int num) {
		BoardDataBean board = new BoardDataBean();
		
		try{
			conn = getConnection();
			
			String sql = "select * from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				board.setNum(rs.getInt("num"));
				board.setWriter(rs.getString("writer"));
				board.setEmail(rs.getString("Email"));
				board.setSubject(rs.getString("subject"));
				board.setPasswd(rs.getString("passwd"));
				board.setReg_date(rs.getTimestamp("reg_date"));
				board.setReadcount(rs.getInt("readcount"));
				board.setContent(rs.getString("content"));
				board.setIp(rs.getString("ip"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		return board;
	}
	
	//글수정
		
	public int update(BoardDataBean board) {
		int result=0;
		
		try{
			conn = getConnection();
			String sql="update board set writer=?,email=?,subject=?,content=?  where num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getEmail());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getContent());
			pstmt.setInt(5, board.getNum());
			result=pstmt.executeUpdate();
	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		return result;
	}
	
	public int delete(BoardDataBean board) {
		int result=0;
		
		try{
			conn = getConnection();
			String sql="delete from board where num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getNum());
			result=pstmt.executeUpdate();
	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		return result;
	}

}
