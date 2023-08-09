package com.lgy.Goit.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.lgy.Goit.dto.FavoriteDto;

public interface FavoriteDao {
//	해당 게시글 북마크 여부 조회
	public FavoriteDto bookMarkCheck(@Param("b_no") int b_no, @Param("id") String id);

//	북마크
	public void bookMark(HashMap<String, String> param);
	
//	북마크 삭제
	public void bookMarkDelete(HashMap<String, String> param);

//	글삭제시 글에 속한 북마크도 삭제
	public void bookMarkDelete2(HashMap<String, String> param);
}
