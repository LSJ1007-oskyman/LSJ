package p2024_07_26;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

public class JDBC_insert02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";//xe - >전역 데이터베이스
		
		Connection con = null; //데이터베이스 접속에 관련된 객체
		PreparedStatement pstmt = null; // sql문을 실행시켜주는 역할
		
		try { 
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");
			
			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
			
			System.out.print("이름 입력?");
			String name = br.readLine();
			System.out.print("이메일 입력?");
			String email = br.readLine();
			System.out.print("전화번호 입력?");
			String tel = br.readLine();
			System.out.print("주소 입력?");
			String address = br.readLine();
			
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			
			String sql = "insert into customer(no,name,email,tel,address,reg_data) values(customer_no_seq.nextval,?,?,?,?,SYSDATE)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, tel);
			pstmt.setString(4, address);
			
			int result = pstmt.executeUpdate(); //insert SQL문 실행
			
			if(result == 1) {
				System.out.println("성공");
			}else {
				System.out.println("실패");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

	}

}