package p2024_07_25;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class JDBC_Update {

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
			
			System.out.println("수정할 회원번호를 입력 하세요");
			int no = Integer.parseInt(br.readLine());
			System.out.println("수정할 이름을 입력 하세요");
			String name = br.readLine();
			System.out.println("수정할 이메일을 입력 하세요");
			String email = br.readLine();
			System.out.println("수정할 전화번호를 입력 하세요");
			String tel = br.readLine();
			
			String sql = "update customer set email = '"+email;
				   sql+="', tel='"+tel+"', name='"+name+"' where no="+no;
			
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
