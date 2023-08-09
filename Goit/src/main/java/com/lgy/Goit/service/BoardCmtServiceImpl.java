package com.lgy.Goit.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.Goit.dao.BoardCmtDao;
import com.lgy.Goit.dao.BoardDao;
import com.lgy.Goit.dao.MemberDao;
import com.lgy.Goit.dto.BoardCmtDto;
import com.lgy.Goit.dto.BoardDto;
import com.lgy.Goit.dto.Criteria;
import com.lgy.Goit.dto.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Service("BoardCmtService")
@Slf4j
public class BoardCmtServiceImpl implements BoardCmtService{
	
	@Autowired
	private SqlSession sqlSession;

//	해당 게시글 댓글 목록 조회
	@Override
//	public ArrayList<BoardCmtDto> boardCmtList(HashMap<String, String> param) {
	public ArrayList<BoardCmtDto> boardCmtList(int b_no) {
		log.info("@# CmtServiceImpl.게시글댓글조회 start");

		BoardCmtDao dao = sqlSession.getMapper(BoardCmtDao.class);
	    ArrayList<BoardCmtDto> dto = dao.boardCmtList(b_no);

	    log.info("@# CmtServiceImpl.게시글댓글조회 end");

	    return dto;
	}

//	게시글 댓글 작성
	@Override
	public void boardCmtWrite(HashMap<String, String> param) {
		log.info("@# CmtServiceImpl.댓글작성 start");

		BoardCmtDao dao = sqlSession.getMapper(BoardCmtDao.class);
		dao.boardCmtWrite(param);

		log.info("@# CmtServiceImpl.댓글작성 end");
	}

//	댓글 수정
	@Override
	public void boardCmtEdit(HashMap<String, String> param) {
		log.info("@# CmtServiceImpl.댓글수정 start");

		BoardCmtDao dao = sqlSession.getMapper(BoardCmtDao.class);
		dao.boardCmtEdit(param);

		log.info("@# CmtServiceImpl.댓글수정 end");
		
	}

//	댓글 삭제
	@Override
	public void boardCmtDelete(HashMap<String, String> param) {
		log.info("@# CmtServiceImpl.댓삭제() start");

		BoardCmtDao dao = sqlSession.getMapper(BoardCmtDao.class);
		dao.boardCmtDelete(param);

		log.info("@# CmtServiceImpl.댓삭제() end");
	}

//	글삭제시 글에 속한 댓글도 삭제
	@Override
	public void boardCmtDelete2(HashMap<String, String> param) {
		log.info("@# CmtServiceImpl.글댓삭제() start");
		
		BoardCmtDao dao = sqlSession.getMapper(BoardCmtDao.class);
		dao.boardCmtDelete2(param);
		
		log.info("@# CmtServiceImpl.글댓삭제() end");
	}
}
