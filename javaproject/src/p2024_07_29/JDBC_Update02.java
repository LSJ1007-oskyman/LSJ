package p2024_07_29;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class JDBC_Update02 {
	public static void main(String[] args) {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jsptest";//xe - >전역 데이터베이스
		
		Connection con = null; //데이터베이스 접속에 관련된 객체
		PreparedStatement pstmt = null; // sql문을 실행시켜주는 역할
		
		try { 
			Class.forName(driver);
			con = DriverManager.getConnection(url, "jspid", "jsppass");
			
			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
			
			System.out.println("수정할 회원번호를 입력 하세요");
			int no = Integer.parseInt(br.readLine());
			System.out.println("수정할 이름을 입력 하세요");
			String name = br.readLine();
			System.out.println("수정할 이메일을 입력 하세요");
			String email = br.readLine();
			System.out.println("수정할 전화번호를 입력 하세요");
			String tel = br.readLine();
			System.out.println("수정할 주소를 입력 하세요");
			String address = br.readLine();
			
			String sql = "update customer set name = ? , email = ?, tel =?, address= ?, reg_date = SYSDATE() where no = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,email);
			pstmt.setString(3,tel);
			pstmt.setString(4,address);
			pstmt.setInt(5,no);			
			
			int result = pstmt.executeUpdate();
				   
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
