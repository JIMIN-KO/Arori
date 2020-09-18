package com.kh.arori.repository.study;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.study.QnaDto;

@Repository
public class QnaDaoImpl implements QnaDao {

	@Autowired
	private SqlSession sqlSession;

	// QNA 고유번호 발급
	@Override
	public int getSeg() {
		return sqlSession.selectOne("qna.getSeq");
	}

	// QNA 새 글작성
	@Override
	public int create(QnaDto qnaDto) {
		return sqlSession.insert("qna.create", qnaDto);
	}

	// QNA 답글 작성
	@Override
	public int createReply(QnaDto qnaDto) {
		return sqlSession.insert("qna.createReply", qnaDto);
	}

	// QNA 게시글 고유 번호로 단일 조회
	@Override
	public QnaDto get(int qna_no) {
		return sqlSession.selectOne("qna.get", qna_no);
	}

	// 해당 클래스 번호로 QNA 게시글 전체 조회
	@Override
	public List<QnaDto> getC(int c_no) {
		return sqlSession.selectList("qna.getC", c_no);
	}

	// QNA 게시글 페이지 네이션 기능
	@Override
	public List<QnaDto> getP(Map<String, Integer> pagination) {
		return sqlSession.selectList("qna.getP", pagination);
	}

	// 해당 클래스 QNA 게시글 개수 조회
	@Override
	public int count(int c_no) {
		return sqlSession.selectOne("qna.count", c_no);
	}

	// QNA 게시글 c_no + qna_no 단일 조회
	@Override
	public QnaDto getCQ(QnaDto qnaDto) {
		return sqlSession.selectOne("qna.getCQ", qnaDto);
	}

	// QNA 게시글 수정
	@Override
	public int edit(QnaDto qnaDto) {
		return sqlSession.update("qna.edit", qnaDto);
	}

	@Override
	public int editReply(QnaDto qnaDto) {
		return sqlSession.update("qna.editReply", qnaDto);
	}

	// QNA 게시글 삭제
	@Override
	public int delete(QnaDto qnaDto) {
		return sqlSession.delete("qna.delete", qnaDto);
	}

	// QNA 게시글 임시 데이터 저장
	@Override
	public int createTemp(QnaDto qnaDto) {
		return sqlSession.insert("qna.createTemp", qnaDto);
	}

	// QNA 게시글 임시 데이터 조회
	@Override
	public List<QnaDto> getTemp(QnaDto qnaDto) {
		return sqlSession.selectList("qna.getTemp", qnaDto);
	}

	// QNA 게시글 임시 데이터 삭제
	@Override
	public int deleteTemp(QnaDto qnaDto) {
		return sqlSession.delete("qna.deleteTemp", qnaDto);
	}

	// QNA 게시글 새 글 작성 중 임시 저장 전체 조회
	@Override
	public List<QnaDto> getCT(int c_no) {
		return sqlSession.selectList("qna.getCT", c_no);
	}

	// 마이페이지 > 내가 작성한 QNA 게시글
	@Override
	public List<QnaDto> getMP(Map<String, Integer> pagination) {

		return sqlSession.selectList("qna.getMP", pagination);
	}

	// 마이페이지 >  내가 작성한 전체 QNA 게시글 카운트
	@Override
	public int countMyQna(int member_no) {

		return sqlSession.selectOne("qna.countMyQna", member_no);
	}

}
