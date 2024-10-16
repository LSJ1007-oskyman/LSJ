package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.BoardDao;
import com.example.demo.model.BoardBean;

@Service
public class BoardService {
	@Autowired
	private BoardDao dao;

	public int insert(BoardBean board) {
		return dao.insert(board);
	}

	public int getCount() {
		return dao.getCount();
	}

	public List<BoardBean> getList(int page) {
		return dao.getList(page);
	}

	public void hit(int board_num) {
		dao.hit(board_num);
	}

	public BoardBean board_cont(int board_num) {
		return dao.board_cont(board_num);
	}

	public void reply(BoardBean board) {
		dao.refUpdate(board);
		
		//부모글보다 1증가된 값을 저장
		board.setBoard_re_lev(board.getBoard_re_lev()+1);
		board.setBoard_re_seq(board.getBoard_re_seq()+1);
		
		int result = dao.reply(board);
	}

	public int update(BoardBean board) {
		return dao.update(board);
	}

	public int delete(BoardBean board) {
		return dao.delete(board);
	}
	
}
