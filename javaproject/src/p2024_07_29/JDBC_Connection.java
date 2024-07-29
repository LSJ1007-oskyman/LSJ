package p2024_07_29;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBC_Connection {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String driver = "com.mysql.cj.jdbc.Driver";
		// 본래 @local.host는 데이터베이스 서버의 IP주소를 입력해야하는데 우리는 서버와 지금 컴퓨터의 IP가 같으므로 @localhost로 한다.
		String url = "jdbc:mysql://localhost:3306/jsptest";//xe - >전역 데이터베이스
		Connection con = null;
		
		try { 
			Class.forName(driver);//jdbc driver loading
			con = DriverManager.getConnection(url, "jspid", "jsppass");
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
