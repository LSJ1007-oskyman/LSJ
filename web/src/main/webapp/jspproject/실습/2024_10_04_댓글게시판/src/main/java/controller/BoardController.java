package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.*;


@WebServlet("*.do")
public class BoardController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String requestURI =request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		System.out.println("requestURI: "+requestURI);
		System.out.println("contextPath: "+contextPath);
		System.out.println("command: "+command);
		
		Action action=null;
		ActionForward forward = null;
		
		//글작성
		if(command.equals("/BoardAddAction.do")) {
			try {
				action = new BoardAddAction();
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		//글작성 폼
		else if(command.equals("/BoardForm.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./board/board_write.jsp");
		}
		
		//글목록
		else if(command.equals("/BoardListAction.do")) {
			try {
				action = new BoardListAction();
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		//글상세 페이지
		else if(command.equals("/BoardDetailAction.do")) {
			try {
				action = new BoardDetailAction();
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		//댓글 페이지
		else if(command.equals("/BoardReplyForm.do")) {
			try {
				action = new BoardReplyForm();
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		//댓글 작성
		else if(command.equals("/BoardReply.do")) {
			try {
				action = new BoardReply();
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		//수정 폼
		else if(command.equals("/BoardModifyForm.do")) {
			try {
				action = new BoardModifyForm();
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		//글수정 
		else if(command.equals("/BoardModify.do")) {
			try {
				action = new BoardModify();
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		//삭제 폼
		else if(command.equals("/BoardDeleteForm.do")) {
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./board/board_delete.jsp");
		}
		
		//글수정 
		else if(command.equals("/BoardDelete.do")) {
			try {
				action = new BoardDelete();
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward !=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get");
		doProcess(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post");
		doProcess(request,response);
	}

}
