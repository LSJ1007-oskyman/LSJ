package com.example.demo.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Member {
	private int no;
	private	String id;
	private	String pw;
	private String name;
	private Timestamp regdate;
	
	public Member(int no, String id,String pw, String name, Timestamp regdate) {
		this.no = no;
		this.id=id;
		this.pw = pw;
		this.name = name;
		this.regdate = regdate;
	}
}
