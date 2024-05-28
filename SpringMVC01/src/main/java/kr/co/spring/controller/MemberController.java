package kr.co.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.spring.mapper.MemberMapper;
import kr.co.spring.model.MemberVO;

@Controller

public class MemberController {
	@Autowired
	//private MemberDAO dao;
	private MemberMapper memberMapper;//dao대신 mapper인터페이스
	
	
	
	@RequestMapping("/memberList.do")
	public String memberList(Model model) {
		List<MemberVO> list=memberMapper.memberList();
		model.addAttribute("list",list);
		return "memberList";
		
	}
	
	@RequestMapping("/memberAjaxList.do")
	public @ResponseBody List<MemberVO> memberAjaxList() {
		List<MemberVO> list=memberMapper.memberList();
		//model.addAttribute("list",list);XX
		//Ajax는 콜백함수로 응답==>@ResponseBody
		// object->json ==> jackson-databind(데이터바인딩) & jackson-mapper-asl(json으로 파싱) api가 필요
		return list;//
		
	}
	
	
	
	@RequestMapping("/memberContent.do")
	public String memberContent(int num, Model model) {
		MemberVO vo=memberMapper.memberContent(num);
		model.addAttribute("vo",vo);
		return "memberContent";
		
	}
	
	@RequestMapping("/memberInsert.do")
	public String memberInsert(MemberVO vo) {
		memberMapper.memberInsert(vo);
		return "redirect:/memberList.do";
		
	}
	
	
	
	@RequestMapping("/memberUpdate.do")
	public String memberUpdate(MemberVO vo) {
		memberMapper.memberUpdate(vo);
		return "redirect:/memberList.do";
		
	}
	
	@RequestMapping("/form.do")
	public String form() {
		
		
		return"uploadForm";
	}
	
	

}
