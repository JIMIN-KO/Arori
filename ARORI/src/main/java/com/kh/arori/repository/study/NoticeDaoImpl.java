package com.kh.arori.repository.study;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.study.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSession sqlSession;

	// 공지 게시글 고유 번호 발급
	@Override
	public int getSeq() {

		return sqlSession.selectOne("notice.getSeq");
	}

	// 공지 게시글 작성
	@Override
	public int create(NoticeDto noticeDto) {

		return sqlSession.insert("notice.create", noticeDto);
	}

	// 공지 게시글 고유 번호로 단일 조회
	@Override
	public NoticeDto get(int n_no) {

		return sqlSession.selectOne("notice.get", n_no);
	}

	// 해당 클래스 번호로 공지 게시글 전체 조회
	@Override
	public List<NoticeDto> getC(int c_no) {

		return sqlSession.selectList("notice.getC", c_no);
	}

	// 공지 게시글 페이지 네이션 기능
	@Override
	public List<NoticeDto> getP(Map<String, String> pagination) {

		return sqlSession.selectList("notice.getP", pagination);
	}

	// 해당 클래스 공지 게시글 개수 조회
	@Override
	public int count(int c_no) {

		return sqlSession.selectOne("notice.count", c_no);
	}

	// 공지 게시글 c_no + n_no 단일 조회
	@Override
	public NoticeDto getCN(NoticeDto noticeDto) {

		return sqlSession.selectOne("notice.getCN", noticeDto);
	}

	// 공지 게시글 수정
	@Override
	public int edit(NoticeDto noticeDto) {

		return sqlSession.update("notice.edit", noticeDto);
	}

	// 공지 게시글 삭제 
	@Override
	public int delete(NoticeDto noticeDto) {

		return sqlSession.delete("notice.delete", noticeDto);
	}

	// 공지 게시글 임시 데이터 저장 
	@Override
	public int createTemp(NoticeDto noticeDto) {

		return sqlSession.insert("notice.createTemp", noticeDto);
	}
	
	// 공지 게시글 임시 데이터 조회 
	@Override
	public NoticeDto getTemp(NoticeDto noticeDto) {

		return sqlSession.selectOne("notice.getTemp", noticeDto);
	}

	// 공지 게시글 임시 데이터 삭제 
	@Override
	public int deleteTemp(NoticeDto noticeDto) {

		return sqlSession.delete("notice.deleteTemp", noticeDto);
	}

}
