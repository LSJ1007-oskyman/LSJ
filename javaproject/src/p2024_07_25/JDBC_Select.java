package p2024_07_25;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBC_Select {

	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";//xe - >전역 데이터베이스
		
		Connection con = null; //데이터베이스 접속에 관련된 객체
		Statement stmt = null; // sql문을 실행시켜주는 역할
		ResultSet rs = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");
			
			stmt = con.createStatement();
			
//			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
			
			String sql = "select * from customer";
			
			System.out.println("번호\t이름\t이메일\t번호");
			System.out.println("-----------------------------------");
			
			rs = stmt.executeQuery(sql); //select sql문 실행
			
			while(rs.next()) {//next():검색한 데이터를 1개씩 가져오는 역할->boolean형을 리턴하며 가져올게 없으면 false를 리턴함
				int no=rs.getInt("no");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String tel = rs.getString("tel");
				System.out.println(no+"\t"+name+"\t"+email+"\t"+tel);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

	}

}
