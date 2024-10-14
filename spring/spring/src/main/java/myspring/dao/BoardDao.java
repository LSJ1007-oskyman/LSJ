package myspring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import myspring.model.Board;

//@Mapper
public interface BoardDao {

	int insert(Board board);

	int getCount();

	List<Board> getBoardList(int page);

	void updatecount(int no);

	Board getBoard(int no);

	int update(Board board);

	int delete(int no);

}
