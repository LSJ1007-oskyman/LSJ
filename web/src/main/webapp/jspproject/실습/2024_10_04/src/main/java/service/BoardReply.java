package service;

import java.io.PrintWriter;

import dao.BoardDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BoardBean;

public class BoardReply implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardReply");
		
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int board_re_ref = Integer.parseInt(request.getParameter("board_re_ref"));
		int board_re_lev = Integer.parseInt(request.getParameter("board_re_lev"));
		int board_re_seq = Integer.parseInt(request.getParameter("board_re_seq"));
		String page =request.getParameter("page");
		
		BoardBean board = new BoardBean();
		board.setBoard_num(board_num);
		board.setBoard_re_ref(board_re_ref);
		board.setBoard_re_lev(board_re_lev);
		board.setBoard_re_seq(board_re_seq);
		board.setBoard_name(request.getParameter("board_name"));
		board.setBoard_pass(request.getParameter("board_pass"));
		board.setBoard_subject(request.getParameter("board_subject"));
		board.setBoard_content(request.getParameter("board_content"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		int result = dao.boardReply(board);
		if(result == 1) {
			System.out.println("댓글작성 성공");
		}else {
			out.println("<script>");
			out.println("alert('댓글작성 실패');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./BoardListAction.do?page="+page);
		
		return forward;
	}

}
