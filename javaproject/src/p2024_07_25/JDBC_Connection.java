package p2024_07_25;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBC_Connection {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String driver = "oracle.jdbc.driver.OracleDriver";
		// 본래 @local.host는 데이터베이스 서버의 IP주소를 입력해야하는데 우리는 서버와 지금 컴퓨터의 IP가 같으므로 @localhost로 한다.
		String url = "jdbc:oracle:thin:@localhost:1521:xe";//xe - >전역 데이터베이스
		Connection con = null;
		
		try { 
			Class.forName(driver);//jdbc driver loading
			con = DriverManager.getConnection(url, "scott", "tiger");
			System.out.println("데이터베이스 연결 성공~!!");
			
		} catch (Exception e) {
			System.out.println("데이터베이스 연결 실패~!!");
			e.printStackTrace();
		} finally {
			try {
				if (con != null) con.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}

	}

}
