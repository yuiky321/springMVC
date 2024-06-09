package kr.co.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.spring.model.BoardModyVO;
import kr.co.spring.model.BoardVO;
import kr.co.spring.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	
/*
 *  /list.do  -----> get ---> list()  ---> getBaordList-->>list
 *  /register.do --> post --> register()-> insertBoard ->>list(redirect)
 *  /modify.do ----> post --> modify() --> updateBoard -->>list(redirect)
 *  /getContent.do-> get ---> getContent()  ---> read()-->>content
 *  /remove.do ----> get ---> remove() --> deleteBaord()->> list(redirect)
 *  
 * */	

	
	@RequestMapping(value="/register.do", method=RequestMethod.GET)
	public String boardRegisterGET() {
		 
		return "boardRegisterForm";
	}
	
	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public String boardRegisterPOST(BoardVO vo) {
		System.out.println("boardRegisterPOST");
		service.registerBoard(vo);
		return "redirect:/list.do";
	}
	
	@RequestMapping("/getContents.do")
	public String getContent(@RequestParam("idx") int idx, Model model) {
	
		BoardVO vo=service.getContent(idx);
		model.addAttribute("vo", vo);
		return "contents";
	}
	
	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public String boardModify(BoardModyVO vo) {
		System.out.println("boardModify");
		service.modifyBoard(vo);
		return "redirect:/list.do";
	}
	
	
	@RequestMapping("/remove.do")
	public String remove(@RequestParam("idx") int idx) {
		System.out.println("remove");
		service.removeBoard(idx);
		
		return "redirect:/list.do";
	}
}
