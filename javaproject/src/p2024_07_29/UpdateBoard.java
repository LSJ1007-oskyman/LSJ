package p2024_07_29;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UpdateBoard {
	public static void main(String[] args) {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jsptest";// xe - >전역 데이터베이스

		Connection con = null; // 데이터베이스 접속에 관련된 객체
		PreparedStatement pstmt = null; // sql문을 실행시켜주는 역할
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, "jspid", "jsppass");

			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

			System.out.println("이름을 입력하세요");
			String writer = br.readLine();
			System.out.println("비밀번호를 입력하세요");
			String passwd = br.readLine();
			String temp = "";
			int no = 0;

			String sql = "select no,passwd from board where writer = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, writer);
			rs = pstmt.executeQuery(); // select sql문 실행

			if (rs.next() == false) {
				System.out.println("그러한 이름이 없습니다.");
			} else {
				no = rs.getInt("no");
				temp = rs.getString("passwd");

				if (temp.equals(passwd)) {

					System.out.println("수정할 제목을 입력 하세요");
					String subject = br.readLine();
					System.out.println("수정할 내용을 입력 하세요");
					String content = br.readLine();

					sql = "update board set subject = ? , content = ?, reg_date = SYSDATE() where no = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, subject);
					pstmt.setString(2, content);
					pstmt.setInt(3, no);

					int result = pstmt.executeUpdate();

					if (result == 1) {
						System.out.println("성공");
					} else {
						System.out.println("실패");
					}
				} else {
					System.out.println("비밀번호가 다릅니다.");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
