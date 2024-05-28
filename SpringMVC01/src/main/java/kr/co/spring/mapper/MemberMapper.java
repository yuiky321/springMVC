package kr.co.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.spring.model.MemberVO;

//인터페이스에 정의만
@Mapper
public interface MemberMapper {
	//사용 메서드 명과 sql id명이 같아야 함
	//리스트가져오기
	public List<MemberVO> memberList();
	//회원상세정보가져오기
	public MemberVO memberContent(int num);
	//회원삭제하기
	public int memberDelete(int num);
	//회원가입하기
	public int memberInsert(MemberVO vo);
	//회원정보수정하기
	public int memberUpdate(MemberVO vo);
	
}
