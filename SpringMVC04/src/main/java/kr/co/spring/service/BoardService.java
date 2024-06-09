package kr.co.spring.service;

import java.util.List;

import kr.co.spring.model.BoardModyVO;
import kr.co.spring.model.BoardVO;

public interface BoardService {
	public List<BoardVO> getBoardList();//게시물 리스트 가져오기
	public BoardVO getContent(int idx);//게시물 상세보기
	public int registerBoard(BoardVO vo);//게시물 등록
	public int modifyBoard(BoardModyVO vo);//게시물 수정
	public int removeBoard(int idx);//게시물 삭제
	
}
