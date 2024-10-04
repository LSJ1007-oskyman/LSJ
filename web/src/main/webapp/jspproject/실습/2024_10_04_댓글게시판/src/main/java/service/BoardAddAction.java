package service;

import java.io.PrintWriter;

import dao.BoardDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BoardBean;

public class BoardAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardAddAction");
		
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out=response.getWriter();
		BoardBean board =  new BoardBean();
		
		board.setBoard_name(request.getParameter("board_name"));
		board.setBoard_pass(request.getParameter("board_pass"));
		board.setBoard_subject(request.getParameter("board_subject"));
		board.setBoard_content(request.getParameter("board_content"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		int result= dao.insert(board);
		
		if(result==1) {
			System.out.println("글작성 성공");
		}else {
			out.println("<script>");
			out.println("alert('글작성 실패');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}
		
		ActionForward forward =new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./BoardListAction.do");
		
		return forward;
	}

}
