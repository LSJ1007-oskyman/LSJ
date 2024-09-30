package service;

import java.io.PrintWriter;

import dao.MemberDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class IdCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("IdCheck");
		
		//출력스트림 객체 생성
		PrintWriter out = response.getWriter();
		
		
		String id = request.getParameter("id");
		//System.out.println("id: "+id);
		
		MemberDAO dao = MemberDAO.getInstance();
		
		int result=dao.idcheck(id);
		
		//웹브라우저에 출력되는 값이 callback함수로 리턴된다.
		
		out.print(result);
		
		return null;
	}

}
