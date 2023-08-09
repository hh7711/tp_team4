package com.lgy.Goit.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.Goit.dao.FavoriteDao;
import com.lgy.Goit.dto.FavoriteDto;

import lombok.extern.slf4j.Slf4j;

@Service("FavoriteService")
@Slf4j
public class FavoriteServiceImpl implements FavoriteService{
	
	@Autowired
	private SqlSession sqlSession;

//	해당 게시글 북마크 여부 조회
	@Override
	public FavoriteDto bookMarkCheck(int b_no, String id) {
		log.info("@# FavoriteServiceImpl.bookMarkCheck() start");

		FavoriteDao dao = sqlSession.getMapper(FavoriteDao.class);
		FavoriteDto dto = dao.bookMarkCheck(b_no, id);

	    log.info("@# FavoriteServiceImpl.bookMarkCheck() end");

	    return dto;
	}
	
//	북마크
	@Override
	public void bookMark(HashMap<String, String> param) {
		log.info("@# FavoriteServiceImpl.북마크 start");

		FavoriteDao dao = sqlSession.getMapper(FavoriteDao.class);
		dao.bookMark(param);

		log.info("@# FavoriteServiceImpl.북마크 end");
	}

//	북마크 삭제
	@Override
	public void bookMarkDelete(HashMap<String, String> param) {
		log.info("@# FavoriteServiceImpl.북마크삭제() start");
		
		FavoriteDao dao = sqlSession.getMapper(FavoriteDao.class);
		dao.bookMarkDelete(param);
		
		log.info("@# FavoriteServiceImpl.북마크삭제() end");
	}
	
//	글삭제시 글에 속한 북마크도 삭제
	@Override
	public void bookMarkDelete2(HashMap<String, String> param) {
		log.info("@# FavoriteServiceImpl.글북마크삭제() start");
		
		FavoriteDao dao = sqlSession.getMapper(FavoriteDao.class);
		dao.bookMarkDelete2(param);
		
		log.info("@# FavoriteServiceImpl.글북마크삭제() end");
	}
}
