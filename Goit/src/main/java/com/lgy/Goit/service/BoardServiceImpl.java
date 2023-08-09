package com.lgy.Goit.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.Goit.dao.BoardDao;
import com.lgy.Goit.dao.MemberDao;
import com.lgy.Goit.dto.BoardDto;
import com.lgy.Goit.dto.Criteria;
import com.lgy.Goit.dto.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Service("BoardService")
@Slf4j
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private SqlSession sqlSession;
	
//	아이디 없으면 return loginPage
	@Override
	public ArrayList<BoardDto> logincheck(String id) {
		log.info("@# BoardServiceImpl.logincheck() start");
		log.info("@@@@@ id ===>" + id);
	      
	    BoardDao dao = sqlSession.getMapper(BoardDao.class);
	    ArrayList<BoardDto> list = dao.logincheck(id);
	      
	    log.info("@@@@@ daolist ===>" + list);

	    log.info("@# BoardServiceImpl.revLoginyn() end");
	    return list;
	}

//	게시글 작성
	@Override
	public void boardWrite(BoardDto dto) {
		log.info("@# BoardServiceImpl.boardWrite() start");
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.boardWrite(dto);
		
		log.info("@# BoardServiceImpl.boardWrite() end");
		
	}

//	총 갯수
	@Override
	public int getTotalCount() {
		log.info("@# BoardServiceImpl.getTotalCount() start");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		return dao.getTotalCount();
	}
	
//	게시글 전체보기 페이징
	@Override
	public ArrayList<BoardDto> boardList(Criteria cri) {
		log.info("@# BoardServiceImpl.boardListPaging() start");
		log.info("@# cri ===>" + cri);

		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		log.info("@# 페이징Impl dao ==>"+dao);

		log.info("@# 리턴 안됨?dao.boardListPaging(cri)"+dao.boardListPaging(cri));
		log.info("@# BoardServiceImpl.boardListPaging() end");

		return dao.boardListPaging(cri);
	}

//	검색
	@Override
	public ArrayList<BoardDto> searchList(Criteria cri) {
		log.info("@# BoardServiceImpl.searchList() start");

		BoardDao dao = sqlSession.getMapper(BoardDao.class);
	    ArrayList<BoardDto> searchList = dao.searchList(cri);
	    log.info("@@@@@ 검색리스트 ==> "+searchList);
	    
	    log.info("@# BoardServiceImpl.searchList() end");
	      
	    return searchList;
	}

//	조회수 증가
	@Override
	public int boardUpHit(HashMap<String, String> param) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		return dao.boardUpHit(param);
	}

//	게시글 보기
	@Override
	public BoardDto boardContentView(HashMap<String, String> param) {
		log.info("@# BoardServiceImpl.boardContentView() start");

		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		BoardDto dto = dao.boardContentView(param);

	    log.info("@# BoardServiceImpl.boardContentView() end");

	    return dto;
	}

//	게시글 수정
	@Override
//	public void boardEdit(HashMap<String, String> param) {
	public void boardEdit(BoardDto dto) {
		log.info("@# BoardServiceImpl.boardEdit()리뷰수정 start");

		BoardDao dao = sqlSession.getMapper(BoardDao.class);
	    dao.boardEdit(dto);

	    log.info("@# BoardServiceImpl.boardEdit()리뷰수정 end");
		
	}

//	게시글 삭제
	@Override
	public void boardDelete(HashMap<String, String> param) {
		log.info("@# BoardServiceImpl.boardDelete() start");

		BoardDao dao = sqlSession.getMapper(BoardDao.class);
	    dao.boardDelete(param);

	    log.info("@# BoardServiceImpl.boardDelete() end");
	}
}
