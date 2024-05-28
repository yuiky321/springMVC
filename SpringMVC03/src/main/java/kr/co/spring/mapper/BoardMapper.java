package kr.co.spring.mapper;

import java.util.List;

import kr.co.spring.model.BoardVO;

public interface BoardMapper {
	public List<BoardVO> getBoardList();//게시물 리스트 가져오기
	public BoardVO read(int idx);//게시물 상세보기
	public int insertBoard(BoardVO vo);//게시물 등록
	public int updateBoard(BoardVO vo);//게시물 수정
	public int deleteBoard(int idx);//게시물 삭제
	
}
