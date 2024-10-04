package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.BoardBean;

public class BoardDAO {
	private static BoardDAO instance = new BoardDAO();
	private static Connection conn= null;
	private static PreparedStatement pstmt= null;
	private static ResultSet rs = null;
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
		
		return ds.getConnection();
	}
	
	public int insert(BoardBean board) {
		int result=0;
		
		try {
			conn = getConnection();
			String sql = "insert into model2board values(model2board_seq.nextval,?,?,?,?,model2board_seq.nextval,?,?,0,sysdate)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, board.getBoard_name());
			pstmt.setString(2, board.getBoard_pass());
			pstmt.setString(3, board.getBoard_subject());
			pstmt.setString(4, board.getBoard_content());
			pstmt.setInt(5, board.getBoard_re_lev());
			pstmt.setInt(6, board.getBoard_re_seq());
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null ) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public int getCount() {
		int result=0;
		
		try {
			conn = getConnection();
			String sql = "select count(*) from model2board";
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null ) rs.close();
				if(pstmt!=null ) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	
	//글목록 : 데이터 10개 구하기
	public List<BoardBean> getList(int startRow, int endRow) {
		List<BoardBean> list=new ArrayList<BoardBean>();
		
		try {
			conn = getConnection();
			String sql = "select * from (select rownum as rnum, board.* from (select * from model2board order by board_re_ref desc, board_re_seq asc) board) where rnum between ? and ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean board = new BoardBean();
				board.setBoard_num(rs.getInt("board_num"));
				board.setBoard_name(rs.getString("board_name"));
				board.setBoard_pass(rs.getString("board_pass"));
				board.setBoard_subject(rs.getString("board_subject"));
				board.setBoard_content(rs.getString("board_content"));
				board.setBoard_re_ref(rs.getInt("board_re_ref"));
				board.setBoard_re_lev(rs.getInt("board_re_lev"));
				board.setBoard_re_seq(rs.getInt("board_re_seq"));
				board.setBoard_readcount(rs.getInt("board_readcount"));
				board.setBoard_date(rs.getTimestamp("board_date"));
				
				list.add(board);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null ) rs.close();
				if(pstmt!=null ) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	public void readcountUpdate(int num) {		
		try {
			conn = getConnection();
			String sql = "update model2board set board_readcount=board_readcount+1 where board_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null ) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
	}
	
	public BoardBean getDetail(int num) {
		BoardBean board = new BoardBean();
		
		try {
			conn = getConnection();
			String sql = "select * from model2board where board_num= ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				board.setBoard_num(rs.getInt("board_num"));
				board.setBoard_name(rs.getString("board_name"));
				board.setBoard_pass(rs.getString("board_pass"));
				board.setBoard_subject(rs.getString("board_subject"));
				board.setBoard_content(rs.getString("board_content"));
				board.setBoard_re_ref(rs.getInt("board_re_ref"));
				board.setBoard_re_lev(rs.getInt("board_re_lev"));
				board.setBoard_re_seq(rs.getInt("board_re_seq"));
				board.setBoard_readcount(rs.getInt("board_readcount"));
				board.setBoard_date(rs.getTimestamp("board_date"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null ) rs.close();
				if(pstmt!=null ) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return board;
	}
	
	
	public int boardReply(BoardBean board) {
		int result=0;
		
		int re_ref = board.getBoard_re_ref();
		int re_lev = board.getBoard_re_lev();
		int re_seq = board.getBoard_re_seq();
		
		try {
			conn = getConnection();
			String sql = "update  model2board set board_re_seq = board_re_seq+1 where board_re_ref = ? and board_re_seq > ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq);
			
			pstmt.executeUpdate();
			
			sql = "insert into model2board values(model2board_seq.nextval,?,?,?,?,?,?,?,?,sysdate)";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, board.getBoard_name());
			pstmt.setString(2, board.getBoard_pass());
			pstmt.setString(3, board.getBoard_subject());
			pstmt.setString(4, board.getBoard_content());
			pstmt.setInt(5, re_ref);
			pstmt.setInt(6, re_lev+1);
			pstmt.setInt(7, re_seq+1);
			pstmt.setInt(8, 0);
			
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null ) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public int update(BoardBean board) {		
		int result=0;
		
		try {
			conn = getConnection();
			String sql = "update model2board set board_name=?,board_subject=?,board_content=? where board_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,board.getBoard_name());
			pstmt.setString(2,board.getBoard_subject());
			pstmt.setString(3,board.getBoard_content());
			pstmt.setInt(4,board.getBoard_num());
			
			result=pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null ) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return result;
		
	}
	
	public int delete(int num) {		
		int result=0;
		
		try {
			conn = getConnection();
			String sql = "delete from model2board where board_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			
			result=pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null ) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return result;
		
	}
}
