package kr.co.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.spring.mapper.BoardMapper;
import kr.co.spring.model.BoardModyVO;
import kr.co.spring.model.BoardVO;
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper mapper;

	@Override
	public List<BoardVO> getBoardList() {
		
		return mapper.getBoardList();
	}

	@Override
	public BoardVO getContent(int idx) {
		mapper.boardUpdatpageCount(idx);
		return mapper.read(idx);
	}

	@Override
	public int registerBoard(BoardVO vo) {
		mapper.insertBoard(vo);
		return 0;
	}

	@Override
	public int modifyBoard(BoardModyVO vo) {
		mapper.updateBoard(vo);
		return 0;
	}

	@Override
	public int removeBoard(int idx) {
		mapper.deleteBoard(idx);
		return 0;
	}

}
