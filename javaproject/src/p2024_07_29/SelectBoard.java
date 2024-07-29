package p2024_07_29;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class SelectBoard {
	public static void main(String[] args) {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jsptest";//xe - >전역 데이터베이스
		
		Connection con = null; //데이터베이스 접속에 관련된 객체
		PreparedStatement pstmt = null; // sql문을 실행시켜주는 역할
		ResultSet rs = null;
		
		int cnt=0;//회원수
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, "jspid", "jsppass");
			
			String sql="select no,writer,subject,content,reg_date from board order by no asc";
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery(); //select sql문 실행
			
			
			while(rs.next()) {//next():검색한 데이터를 1개씩 가져오는 역할->boolean형을 리턴하며 가져올게 없으면 false를 리턴함
				int no=rs.getInt("no");
				String writer = rs.getString("writer");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				Timestamp ts = rs.getTimestamp("reg_date");
				SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss EEE요일");
				
				System.out.println("---------------------------------------------------------------------");
				System.out.println("등록번호 : "+no+"\t"+"작성자: "+writer+"\t"+"작성일: "+sd.format(ts));
				System.out.println("제목 : "+subject);
				System.out.println("-------------내용------------------------------------------------------");
				System.out.println(content);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

	}

}
