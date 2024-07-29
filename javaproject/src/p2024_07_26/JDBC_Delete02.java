package p2024_07_26;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class JDBC_Delete02 {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";//xe - >전역 데이터베이스
		
		Connection con = null; //데이터베이스 접속에 관련된 객체
		PreparedStatement pstmt = null; // sql문을 실행시켜주는 역할
		
		try { 
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");
			
			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
			
			System.out.println("삭제할 회원변호를 입력하세요?");
			int no = Integer.parseInt(br.readLine());
			
			String sql = "delete from customer where no = ?";//values다음에 한칸 띄어쓰기 해야 인식에 오류가 없다.
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1, no);
				   
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