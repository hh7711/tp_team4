package com.lgy.Goit.service;

import java.util.HashMap;

import com.lgy.Goit.dto.FavoriteDto;

public interface FavoriteService {	
//	해당 게시글 북마크 여부 조회
	public FavoriteDto bookMarkCheck(int b_no, String id);

//	북마크
	public void bookMark(HashMap<String, String> param);
	
//	북마크 삭제
	public void bookMarkDelete(HashMap<String, String> param);

//	글삭제시 글에 속한 북마크도 삭제
	public void bookMarkDelete2(HashMap<String, String> param);
}
