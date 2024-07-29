package p2024_07_25;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class JDBC_Insert {

	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";//xe - >전역 데이터베이스
		
		Connection con = null; //데이터베이스 접속에 관련된 객체
		Statement stmt = null; // sql문을 실행시켜주는 역할
		
		try { 
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");
			
			stmt = con.createStatement();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
			
			System.out.println("회원번호 입력?");
			int no = Integer.parseInt(br.readLine());
			System.out.println("이름 입력?");
			String name = br.readLine();
			System.out.println("이메일 입력?");
			String email = br.readLine();
			System.out.println("전화번호 입력?");
			String tel = br.readLine();
			
			String sql = "insert into customer values ";//values다음에 한칸 띄어쓰기 해야 인식에 오류가 없다.
				   sql +="("+no+",'"+name+"','"+email+"','"+tel+"')";
				   
			int result = stmt.executeUpdate(sql);
			if(result == 1) {
				System.out.println("성공");
			}else {
				System.out.println("실패");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

	}

}
