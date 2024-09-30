package service;

import java.io.PrintWriter;

import dao.MemberDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Login implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Login");
		
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		//System.out.println("id: "+id);
		String passwd = request.getParameter("passwd");
		//System.out.println("passwd: "+passwd);
		
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.memberAuth(id,passwd);
		//System.out.println("result: "+result);
		
		if(result ==1) {		//회원인증 성공
			session.setAttribute("id", id);
		}else {					//회원인증 실패
			out.println("<script>");
			out.println("alert('로그인 실패');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			
			return null;
		}
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("./member/main.jsp");
		
		
		return forward;
	}

}
