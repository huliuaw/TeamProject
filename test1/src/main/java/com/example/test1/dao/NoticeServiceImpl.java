package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.NoticeMapper;
import com.example.test1.model.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Override
	public Notice selectGetNotice(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Autowired // Mapper와 연결
	private NoticeMapper noticeMapper;

// ---------------------------공통-------------------------------------

	// 상세 select
	@Override
	public Notice selectBoard(HashMap<String, Object> map) {
		noticeMapper.updateCnt(map);
		return noticeMapper.selectBoard(map);
	}

	// 삽입
	@Override
	public void insertBoard(HashMap<String, Object> map) {
		noticeMapper.insertBoard(map);
	}

	// 삭제
	@Override
	public void deleteBoard(HashMap<String, Object> map) {
		noticeMapper.deleteBoard(map);
	}

	// 수정
	@Override
	public void updateBoard(HashMap<String, Object> map) {
		noticeMapper.updateBoard(map);
	}

// ---------------------------공지사항-----------------------------------

	// 전체 select
	@Override
	public List<Notice> selectNoticeList() throws Exception {
		return noticeMapper.selectNoticeList();
	}

// ---------------------------익명게시판----------------------------------

	// 전체 select
	@Override
	public List<Notice> selectAnoymousList() throws Exception {
		return noticeMapper.selectAnoymousList();
	}

// ---------------------------자유게시판----------------------------------

	// 전체 select
	@Override
	public List<Notice> selectBoardList() throws Exception {
		return noticeMapper.selectBoardList();
	}



}