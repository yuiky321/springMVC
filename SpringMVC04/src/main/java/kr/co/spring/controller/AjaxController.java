package kr.co.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.spring.mapper.BoardMapper;
import kr.co.spring.model.BoardModyVO;
import kr.co.spring.model.BoardVO;
import kr.co.spring.service.AjaxService;
import kr.co.spring.service.BoardService;

@Controller
public class AjaxController {

	@Autowired
	private BoardService service;
	@Autowired
	private BoardMapper boardMapper;
	
	@RequestMapping(value="/boradInsert.do")
	public @ResponseBody void boradInsert(BoardVO vo) {
		System.out.println("boradInsert");
		service.registerBoard(vo);
		
	}
	
	@RequestMapping("/boardRemove.do")
	public @ResponseBody void boardRemove(int idx) {
		System.out.println("boardRemove");
		service.removeBoard(idx);
	}
	
	
	@RequestMapping("/boardModify.do")
	public @ResponseBody void boardModify(BoardModyVO vo) {
		System.out.println("boardModify");
		service.modifyBoard(vo);
		
	}
	
	@RequestMapping("/countUpdate.do")
	public @ResponseBody void countUpdate(int idx) {
		System.out.println("countUpdate");
		boardMapper.boardUpdatpageCount(idx);
		
	}
	
}
