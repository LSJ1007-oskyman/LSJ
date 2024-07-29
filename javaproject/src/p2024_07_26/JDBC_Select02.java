package p2024_07_26;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class JDBC_Select02 {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";//xe - >전역 데이터베이스
		
		Connection con = null; //데이터베이스 접속에 관련된 객체
		PreparedStatement pstmt = null; // sql문을 실행시켜주는 역할
		ResultSet rs02 = null;
		
		int cnt=0;//회원수
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");
			
			
			
			String sql="select * from customer order by no desc";
			pstmt=con.prepareStatement(sql);
			rs02 = pstmt.executeQuery(); //select sql문 실행
			
			System.out.println("번호\t이름\t이메일\t\t번호\t\t주소\t날짜");
			System.out.println("----------------------------------------------------------------------------");
			
			while(rs02.next()) {//next():검색한 데이터를 1개씩 가져오는 역할->boolean형을 리턴하며 가져올게 없으면 false를 리턴함
				int no=rs02.getInt("no");
				String name = rs02.getString("name");
				String email = rs02.getString("email");
				String tel = rs02.getString("tel");
				String address = rs02.getString("address");
				Timestamp ts = rs02.getTimestamp("reg_data");
				SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss EEE요일");
				
				System.out.println(no+"\t"+name+"\t"+email+"\t"+tel+"\t"+address+"\t"+sd.format(ts)+"\t");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs02 !=null) rs02.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

	}

}
