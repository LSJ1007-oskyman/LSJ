package board;

import java.sql.Timestamp;

public class BoardDataBean {
	private int num;
 	private String writer;
 	private String email;
 	private String  subject;
 	private String passwd;
 	private Timestamp reg_date;
 	private int readcount;
 	private String content;
 	private String ip;
 	
 	
	public int getNum() {
		return num;
	}
	public void setNum(int number) {
		this.num = number;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp timestamp) {
		this.reg_date = timestamp;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}

}
