//DAO(Data Access Object)

package register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LogonDBBean {
	// 싱글톤 : 객체 생성을 한번만 수행하는 것.
	private static LogonDBBean instance = new LogonDBBean();
	
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";

	public static LogonDBBean getInstance() {
		return instance;
	}

	// 회원가입
	public int insertMember(LogonDataBean member) {

		int result = 0;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");

			String sql = "insert into member2 values(?,?,?,?,?,?,?,sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getJumin1());
			pstmt.setString(5, member.getJumin2());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getBlog());

			result = pstmt.executeUpdate();

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

		return result;
	}

	// 전체회원 목록 구하기 메소드
	public List<LogonDataBean> selectMember(){
		
		List<LogonDataBean> list =  new ArrayList<LogonDataBean>();
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,"scott","tiger");
			
			String sql="select * from member2";
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				LogonDataBean	regBean = new LogonDataBean();
				regBean.setId(rs.getString(1));
				regBean.setPasswd(rs.getString(2));
				regBean.setName(rs.getString(3));
				regBean.setJumin1(rs.getString(4));
				regBean.setJumin2(rs.getString(5));
				regBean.setEmail(rs.getString(6));
				regBean.setBlog(rs.getString(7));
				regBean.setReg_date(rs.getDate(8));
				
				list.add(regBean);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		return list;
	}
	
	
	//회원수정폼 : 회원 1명 정보 구하기
	public LogonDataBean updateForm(String id) {
			
		LogonDataBean member = new LogonDataBean();
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");

			String sql = "select * from member2 where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				member.setId(rs.getString(1));
				member.setPasswd(rs.getString(2));
				member.setName(rs.getString(3));
				member.setJumin1(rs.getString(4));
				member.setJumin2(rs.getString(5));
				member.setEmail(rs.getString(6));
				member.setBlog(rs.getString(7));
				member.setReg_date(rs.getDate(8));
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return member;
	}
	
	
	//회원정보 수정

	public int update(LogonDataBean member) {
			
		int result =0;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");

			String sql = "update member2 set name=?,jumin1=?,jumin2=?,email=?,blog=?,reg_date=sysdate where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getJumin1());
			pstmt.setString(3, member.getJumin2());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getBlog());
			pstmt.setString(6, member.getId());
			
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return result;
	}
	
	public int delete(LogonDataBean member) {
		
		int result =0;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");

			String sql = "delete from member2 where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return result;
	}
}
