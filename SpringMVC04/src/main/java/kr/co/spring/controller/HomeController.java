package kr.co.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.spring.model.BoardVO;
import kr.co.spring.service.BoardService;

@Controller
public class HomeController {
	@Autowired
	private BoardService service;


	@RequestMapping("/")
	public String getBoardList(Model model) {
		List<BoardVO> list = service.getBoardList();
		model.addAttribute("list", list);
		return "boardList";
	}
	
	@RequestMapping("/board2")
	public String getBoardList2(Model model) {
		List<BoardVO> list = service.getBoardList();
		model.addAttribute("list", list);
		return "boardList2";
	}
}
