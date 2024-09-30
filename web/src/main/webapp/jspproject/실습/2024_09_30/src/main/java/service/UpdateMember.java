package service;

import java.io.PrintWriter;

import dao.MemberDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.MemberDTO;

public class UpdateMember implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("UpdateMember");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		PrintWriter out = response.getWriter();
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO member = dao.getMember(id);
		
		String hobby[]=member.getHobby().split("-");
		request.setAttribute("member", member);
		request.setAttribute("hobby", hobby);
		
		
		//request객체로 공유한 경우에는 dispatcher 방식으로 포워딩 해야 
		//view페이지에서 공유한 값에 접근할 수 있다.
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/updateform.jsp");
		
		return forward;
	}

}
