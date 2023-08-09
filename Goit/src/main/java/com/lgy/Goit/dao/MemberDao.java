package com.lgy.Goit.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.lgy.Goit.dto.MemberDto;

public interface MemberDao {
//	회원가입
	public void signUp(HashMap<String, String> param);
//	아이디 중복체크
	public String idCheck(String id);
//	로그인
	public MemberDto signIn(@Param("id") String id, @Param("pwd") String pwd);
//	회원정보 조회
//	public MemberDto memberInfo(HashMap<String, String> param);
	public MemberDto memberInfo(@Param("id")String id);
//	회원정보 수정
	public void memberUpdate(HashMap<String, String> param);
//	비밀번호 체크
	public MemberDto pwdCheck(@Param("id") String id, @Param("pwd") String pwd);
//	회원 탈퇴
	public void memberDelete(HashMap<String, String> param);
}
