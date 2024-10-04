package service;

import java.io.PrintWriter;
import java.util.List;

import dao.BoardDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BoardBean;

public class BoardListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardListAction");
		
		PrintWriter out= response.getWriter();
		
		int page =1;
		int limit =10;
		
		if(request.getParameter("page")!=null) {
			page= Integer.parseInt(request.getParameter("page"));
		}
		

		BoardDAO dao = BoardDAO.getInstance();
		
		//총데이터 갯수
		int listcount = dao.getCount();
		//System.out.println("listcount: "+listcount);
		
		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;

		List<BoardBean> boardlist = null;

		if (listcount > 0) {
			boardlist = dao.getList(startRow, endRow);
		}

		//총페이지수
		int pageCount = listcount/limit +((listcount%limit==0) ? 0:1);
		int startPage = ((page-1)/limit)*limit+1;
		int endPage = startPage+10-1;
		
		if(endPage>pageCount) endPage = pageCount;
		
		//공유 설정
		request.setAttribute("page", page);
		request.setAttribute("listcount", listcount);
		request.setAttribute("boardlist", boardlist);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		//request객채로 공유한 경우에는 반드시 dispatcher방식으로 포워딩 되어야 view페이지에서 공유한 값에 접근이 가능하다.
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./board/board_list.jsp");
		
		return forward;
	}

}
