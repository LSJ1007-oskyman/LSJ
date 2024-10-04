package service;

import java.io.PrintWriter;

import dao.BoardDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BoardBean;

public class BoardDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardDelete");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;  charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		String page = request.getParameter("page");
		String board_pass = request.getParameter("board_pass");
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardBean db =  dao.getDetail(board_num);
		
		if(db.getBoard_pass().equals(board_pass)) {
			int result = dao.delete(board_num);
			
			if(result == 1) System.out.println("글 삭제 성공");
			response.sendRedirect("./board/delete.jsp?page="+page);
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
		 * forward.setPath("./BoardListAction?page="+page);
		 * 
		 * return null;
		 */
	}
	
}
