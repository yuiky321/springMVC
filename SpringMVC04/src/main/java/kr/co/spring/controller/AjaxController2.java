package kr.co.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.spring.mapper.BoardMapper;
import kr.co.spring.model.BoardModyVO;
import kr.co.spring.model.BoardVO;
import kr.co.spring.service.AjaxService;
import kr.co.spring.service.BoardService;
import oracle.jdbc.proxy.annotation.Post;
@RequestMapping("/board")
@RestController
public class AjaxController2 {

	@Autowired
	private BoardService service;
	@Autowired
	private BoardMapper boardMapper;
	
	@PostMapping("/new")
	public void boradInsert(BoardVO vo) {
		System.out.println("boradInsert");
		service.registerBoard(vo);
		
	}
	
	@DeleteMapping("/{idx}")
	public void boardRemove(@PathVariable("idx") int idx) {
		System.out.println("boardRemove");
		service.removeBoard(idx);
	}
	
	
	@PostMapping("/modify")
	public void boardModify(BoardModyVO vo) {
		System.out.println("boardModify");
		service.modifyBoard(vo);
		
	}
	
	@GetMapping("/count/{idx}")
	public void countUpdate(@PathVariable("idx") int idx) {
		System.out.println("countUpdate");
		boardMapper.boardUpdatpageCount(idx);
		
	}
	
}
