package p2024_07_25;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBC_Select01 {

		public static void main(String[] args) {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";//xe - >전역 데이터베이스
			
			Connection con = null; //데이터베이스 접속에 관련된 객체
			PreparedStatement pstmt = null; // sql문을 실행시켜주는 역할
			ResultSet rs01 = null;			
			ResultSet rs02 = null;
			
			int cnt=0;//회원수
			
			try {
				
				Class.forName(driver);
				con = DriverManager.getConnection(url, "scott", "tiger");
				
				String sql = "select count(*) from customer";
				
				
				pstmt=con.prepareStatement(sql);
				rs01 = pstmt.executeQuery(); //select sql문 실행
				if(rs01.next()) {
					cnt = rs01.getInt(1);
//					cnt = rs01.getInt("count(*));
					
				}
				
				System.out.println("총회원수: "+cnt);
				
				sql="select * from customer";
				pstmt=con.prepareStatement(sql);
				rs02 = pstmt.executeQuery(); //select sql문 실행
				
				System.out.println("번호\t이름\t이메일\t번호");
				System.out.println("-----------------------------------");
				
				while(rs02.next()) {//next():검색한 데이터를 1개씩 가져오는 역할->boolean형을 리턴하며 가져올게 없으면 false를 리턴함
					int no=rs02.getInt("no");
					String name = rs02.getString("name");
					String email = rs02.getString("email");
					String tel = rs02.getString("tel");
					System.out.println(no+"\t"+name+"\t"+email+"\t"+tel);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs02 !=null) rs02.close();
					if(rs01 !=null) rs01.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}

		}
}

