package com.lgy.Goit.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.Goit.dao.MemberDao;
import com.lgy.Goit.dto.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Service("MemberService")
@Slf4j
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSession sqlSession;

//	회원가입
	@Override
	public void signUp(HashMap<String, String> param) {
		log.info("@@### 회원Impl signUp() start");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		dao.signUp(param);
		
		log.info("@@### 회원Impl signUp() end");
	}
//	아이디 중복체크
	@Override
	public String idCheck(String id) {
		log.info("@@### 회원Impl signIn() start");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		String result = dao.idCheck(id);
		
		log.info("@@### 회원Impl signIn() end");
		return result;
	}
	
//	로그인
	@Override
//	public MemberDto signIn(HashMap<String, String> param) {
	public MemberDto signIn(String id, String pwd) {
		log.info("@@### 회원Impl signIn() start");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		log.info("@@### MemberDao dao = sqlSession.getMapper(MemberDao.class); 실행~~~");		
		MemberDto dto = dao.signIn(id, pwd);
		
		log.info("@@### 회원Impl signIn() end");
		return dto;
	}

//	회원정보 조회
	@Override
	public MemberDto memberInfo(String id) {
		log.info("@@### 회원Impl memberInfo() start");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		MemberDto dto = dao.memberInfo(id);
		
		log.info("@@### 회원Impl memberInfo() end");
		return dto;
	}

//	회원정보 수정
	@Override
	public void memberUpdate(HashMap<String, String> param) {
		log.info("@@### 회원Impl memberUpdate() start");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		dao.memberUpdate(param);
		
		log.info("@@### 회원Impl memberUpdate() end");
	}
//	비밀번호 체크
	@Override
	public MemberDto pwdCheck(String id, String pwd) {
		log.info("@@### 회원Impl pwdCheck() start");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		log.info("@@### MemberDao dao = sqlSession.getMapper(MemberDao.class); 실행~~~");		
		MemberDto dto = dao.pwdCheck(id, pwd);
		
		log.info("@@### 회원Impl pwdCheck() end");
		return dto;
	}
//	회원 탈퇴
	@Override
	public void memberDelete(HashMap<String, String> param) {
		log.info("@@### 회원Impl memberDelete() start");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		dao.memberDelete(param);
		
		log.info("@@### 회원Impl memberDelete() end");
	}

}
