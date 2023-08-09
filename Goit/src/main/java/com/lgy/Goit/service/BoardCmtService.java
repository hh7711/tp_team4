package com.lgy.Goit.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.Goit.dto.BoardCmtDto;
import com.lgy.Goit.dto.BoardDto;
import com.lgy.Goit.dto.Criteria;

public interface BoardCmtService {	
//	해당 게시글 댓글 목록 조회
	public ArrayList<BoardCmtDto> boardCmtList(int b_no);

//	게시글 댓글 작성
	public void boardCmtWrite(HashMap<String, String> param);
	
//	댓글 수정
	public void boardCmtEdit(HashMap<String, String> param);
	
//	댓글 삭제
	public void boardCmtDelete(HashMap<String, String> param);
	
//	글삭제시 글에 속한 댓글도 삭제
	public void boardCmtDelete2(HashMap<String, String> param);
}
