package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Notice;

public interface NoticeService {

// ---------------------------공통-------------------------------------

	//
	Notice selectGetNotice(HashMap<String, Object> map);

	// 상세 select
	Notice selectBoard(HashMap<String, Object> map);

	// 삽입
	void insertBoard(HashMap<String, Object> map);

	// 삭제
	void deleteBoard(HashMap<String, Object> map);

	// 수정
	void updateBoard(HashMap<String, Object> map);

// ---------------------------공지사항-----------------------------------

	// 전체 select
	List<Notice> selectNoticeList() throws Exception;

// ---------------------------익명게시판---------------------------------

	// 전체 select
	List<Notice> selectAnoymousList() throws Exception;

// ---------------------------자유게시판---------------------------------

	// 전체 select
	List<Notice> selectBoardList() throws Exception;

}
