package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.BoardBean;

@Mapper
public interface BoardDao {

	public int insert(BoardBean board);

	public int getCount();
	
	public List<BoardBean> getList(int page);

	public void hit(int board_num);

	public BoardBean board_cont(int board_num);

	public void refUpdate(BoardBean board);

	public int reply(BoardBean board);
	
	public int update(BoardBean board);

	public int delete(BoardBean board);
}
