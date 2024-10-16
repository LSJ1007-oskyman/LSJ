package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.model.BoardBean;

@Repository
public class BoardDao {
	@Autowired
	private SqlSession session;

	public int insert(BoardBean board) {
		return session.insert("insert",board);
	}

	public int getCount() {
		return session.selectOne("count");
	}

	public List<BoardBean> getList(int page) {
		return session.selectList("list",page);
	}

	public void hit(int board_num) {
		session.update("hit",board_num);
	}

	public BoardBean board_cont(int board_num) {
		return session.selectOne("board_cont",board_num);
	}

	public void refUpdate(BoardBean board) {
		session.update("refupdate",board);
	}

	public int reply(BoardBean board) {
		return session.insert("reply",board);
	}

	public int update(BoardBean board) {
		return session.update("update",board);
	}

	public int delete(BoardBean board) {
		return session.delete("delete",board);
	}
}
