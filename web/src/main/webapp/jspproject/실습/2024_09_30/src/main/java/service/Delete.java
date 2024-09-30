package service;

import java.io.PrintWriter;

import dao.MemberDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.MemberDTO;

public class Delete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("delete");
		
		response.setContentType("text/html charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out =response.getWriter();
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO db = dao.getMember(id);
		
		if(db.getPasswd().equals(passwd)){
			int result = dao.delete(id);
			if(result==1) {
				System.out.println("탈퇴 성공");
				session.invalidate();
			}else {											
				out.println("<script>");
				out.println("alert('회원수정 실패');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				
				return null;
			}
			
		}else {
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			
			return null;
			
		}
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/loginform.jsp");
		
		return null;
	}

}
