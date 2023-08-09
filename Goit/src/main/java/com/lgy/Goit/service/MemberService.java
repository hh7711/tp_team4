package com.lgy.Goit.service;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.lgy.Goit.dto.MemberDto;

public interface MemberService {
//	회원가입
	public void signUp(HashMap<String, String> param);
//	아이디 중복체크
	public String idCheck(String id);
//	로그인
//	public MemberDto signIn(HashMap<String, String> param);
	public MemberDto signIn(String id, String pwd);
//	회원정보 조회
//	public MemberDto memberInfo(HashMap<String, String> param);
	public MemberDto memberInfo(String id);
//	회원정보 수정
	public void memberUpdate(HashMap<String, String> param);
//	비밀번호 체크
	public MemberDto pwdCheck(String id, String pwd);
//	회원 탈퇴
	public void memberDelete(HashMap<String, String> param);
}
