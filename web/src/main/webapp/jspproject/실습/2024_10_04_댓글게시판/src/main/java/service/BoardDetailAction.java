package service;

import dao.BoardDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BoardBean;

public class BoardDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardDetailAction");
		
		String page = request.getParameter("page");
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.readcountUpdate(board_num);
		BoardBean board = dao.getDetail(board_num);
		
		String content = board.getBoard_content().replace("\n","<br>");
		
		request.setAttribute("board", board);
		request.setAttribute("page", page);
		request.setAttribute("content", content);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./board/board_view.jsp");
		
		return forward;
	}

}
