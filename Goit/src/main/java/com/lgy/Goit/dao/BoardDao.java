package com.lgy.Goit.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.lgy.Goit.dto.BoardCmtDto;
import com.lgy.Goit.dto.BoardDto;
import com.lgy.Goit.dto.Criteria;

public interface BoardDao {
//	아이디 없으면 return loginPage
	public ArrayList<BoardDto> logincheck(String id);
	
//	게시글 작성
	public void boardWrite(BoardDto dto);
	
//	게시글 전체보기 페이징, 검색 리스트
	public int getTotalCount();
	public ArrayList<BoardDto> boardListPaging(Criteria cri);
	public ArrayList<BoardDto> searchList(Criteria cri);
	
//	조회수 증가
	public int boardUpHit(HashMap<String, String> param);
	
//	게시글 보기
	public BoardDto boardContentView(HashMap<String, String> param);
	
//	게시글 수정
//	public void boardEdit(HashMap<String, String> param);
	public void boardEdit(BoardDto dto);

//	게시글 삭제
	public void boardDelete(HashMap<String, String> param);
}
