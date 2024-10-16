package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.BoardBean;
import com.example.demo.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	
	//글작성 폼으로
	@RequestMapping("board_write.do")
	public String board_write() {
		return "board/board_write";
	}
	
	//원문 글작성
	@RequestMapping("board_write_ok.do")
	public String board_write_ok(@ModelAttribute BoardBean board) {
		int result = service.insert(board);
		if(result==1) System.out.println("글작성 성공");
		
		return "redirect:/board_list.do";
	}
	
	//글 목록
	@RequestMapping("board_list.do")
	public String board_list(@RequestParam(value="page",defaultValue="1") int page,Model model) {
		int limit =10;
		int listcount = service.getCount();
		
		System.out.println("listcount: "+listcount);
		
		List<BoardBean> boardlist=service.getList(page);
		
		int pageCount = listcount/limit + ((listcount%limit==0) ? 0:1);
		int startPage = ((page)-1)/10 * limit+1;
		int endPage = startPage+10-1;
		if(endPage>pageCount) endPage = pageCount;
		
		model.addAttribute("page",page);
		model.addAttribute("listcount",listcount);
		model.addAttribute("boardlist",boardlist);
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		
		return "board/board_list";
	}
	//상세페이지,댓글폼,수정폼,삭제폼
	@RequestMapping("board_cont.do")
	public String board_cont(@RequestParam("board_num") int board_num ,
							 @RequestParam("page") String page,
							 @RequestParam("state") String state,
							 Model model) {
		BoardBean board = service.board_cont(board_num);
		
		model.addAttribute("board",board);
		model.addAttribute("page",page);
		
		if(state.equals("cont")) {
			service.hit(board_num);
			String board_content = board.getBoard_content().replace("\n", "<br>");
			model.addAttribute("board_content",board_content);
			
			return "board/board_cont";
		}else if(state.equals("reply")) {
			
			return "board/board_reply";
		}else if(state.equals("update")) {
			
			return "board/board_update";
		}else if(state.equals("delete")) {
			
			return "board/board_delete";
		}
		
		return null;
	}
	
	//댓글 작성
	@RequestMapping("/board_reply_ok.do")
	public String board_reply_ok(@ModelAttribute BoardBean board,@RequestParam("page") String page) {
		service.reply(board);
		return "redirect:/board_list.do?page="+page;
	}
	
	//글 수정 
	@RequestMapping("/board_update_ok.do")
	public String board_update_ok(@ModelAttribute BoardBean board,@RequestParam("page") String page,Model model) {
		BoardBean db = service.board_cont(board.getBoard_num());
		
		int result=0;
		if(db.getBoard_pass().equals(board.getBoard_pass())) {
			result=service.update(board);
		}else {
			result=-1;
		}
		
		model.addAttribute("result",result);
		model.addAttribute("page",page);

		return "board/updateresult";
	}
	
	//글 수정 
	@RequestMapping("/board_delete_ok.do")
	public String board_delete_ok(@ModelAttribute BoardBean board,@RequestParam("page") String page,Model model) {
		BoardBean db = service.board_cont(board.getBoard_num());
			
		int result=0;
		if(db.getBoard_pass().equals(board.getBoard_pass())) {
			result=service.delete(board);
		}else {
			result=-1;
		}
		
		model.addAttribute("result",result);
		model.addAttribute("page",page);
		return "board/deleteresult";		
	}
}
