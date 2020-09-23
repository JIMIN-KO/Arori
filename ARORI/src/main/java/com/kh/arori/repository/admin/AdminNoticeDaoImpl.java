package com.kh.arori.repository.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.study.NoticeDto;

@Repository
public class AdminNoticeDaoImpl implements AdminNoticeDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	//Notice 관리자 리스트
	@Override
	public List<NoticeDto> adminNoticeList() {
		return sqlSession.selectList("adminNotice.adminNoticeList");
	}
	
	// Notice 페이지 네이션
	@Override
	public List<NoticeDto> getP(Map<String, String> pagination) {
		return sqlSession.selectList("adminNotice.getP", pagination);
	}
	
	// Notice  게시글 c_no + n_no 단일 조회
	@Override
	public NoticeDto getCN(NoticeDto noticeDto) {
		return sqlSession.selectOne("adminNotice.getCN", noticeDto);
	}

	
	// Notice  게시글 관리자 수정
	@Override
	public int editNoticeAdmin(NoticeDto noticeDto) {
		return sqlSession.update("adminNotice.editNoticeAdmin", noticeDto);
	}
	

	
	// QNA  게시글 관리자 삭제 
	@Override
	public int deleteAdmin(NoticeDto noticeDto) {
		return sqlSession.delete("adminNotice.deleteAdmin", noticeDto);
	}



}
