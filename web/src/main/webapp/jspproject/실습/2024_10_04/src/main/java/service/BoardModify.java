package service;

import java.io.PrintWriter;

import dao.BoardDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BoardBean;

public class BoardModify implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardModify");
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		String board_pass = request.getParameter("board_pass");
		
		BoardBean board = new BoardBean();
		
		board.setBoard_num(board_num);
		board.setBoard_name(request.getParameter("board_name"));
		board.setBoard_subject(request.getParameter("board_subject"));
		board.setBoard_content(request.getParameter("board_content"));
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardBean db= dao.getDetail(board_num);
		
		if(db.getBoard_pass().equals(board_pass)) {
			int result = dao.update(board);
			if(result == 1) System.out.println("글 수정 성공");
			out.println("<script>");
			out.println("location.href='./board/update.jsp?page="+page+"'");
			out.println("</script>");
			out.close();
			return null;
		}else {
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}
		
		/*
		 * ActionForward forward = new ActionForward(); forward.setRedirect(true);
		 * forward.setPath("./BoardListAction.do?page="+page);
		 * 
		 * return forward;
		 */
	}
}
