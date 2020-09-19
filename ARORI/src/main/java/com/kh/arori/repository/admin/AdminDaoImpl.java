package com.kh.arori.repository.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.img.This_imgDto;
import com.kh.arori.entity.member.AllMemberDto;
import com.kh.arori.entity.member.AroriMemberDto;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.ClassesDto;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSession sqlSession;

	// 회원삭제

	// 관리자가 보는 나의 클래수 개수
	@Override
	public int classCount(int member_no) {
		int count = 0;
		count = sqlSession.selectOne("admin.countclass", member_no);
		return count;
	}

	// 페이지네이션
	@Override
	public int totalCnt() {
		return sqlSession.selectOne("admin.memberCount");
	}

	// 관리자가 보는 클래스리스트
	@Override
	public List<ClassesDto> getIncome() {
		return sqlSession.selectList("admin.classList");
	}

	// 관리자가 보는 멤버회원이미지
	@Override
	public This_imgDto getImage(int member_no) {
		return sqlSession.selectOne("admin.memberImage", member_no);
	}

	//// 관리자가 보는 클래스카운트
	@Override
	public int classCount(ClassesDto classesDto) {
		int classCount = 0;

		classCount = sqlSession.selectOne("admin.classCount", classesDto);
		return classCount;
	}

	// 관리자가 보는 멤버카운트
	@Override
	public int memberCount() {

		return sqlSession.selectOne("admin.memberCount");

	}

	// 패스워드체크
	@Override
	public int checkPw(AroriMemberDto aroriMemberDto) {
		int result = 0;
		result = sqlSession.selectOne("admin.checkPw", aroriMemberDto);
		return result;
	}

	// 아로리 카운트
	@Override
	public int aroriCount(AroriMemberDto aroriMemberDto) {
		int aroriCount = 0;

		aroriCount = sqlSession.selectOne("admin.aroriCount", aroriMemberDto);
		return aroriCount;
	}

	// 전체회원 수정
	@Override
	public List<AllMemberDto> allList() {
		return sqlSession.selectList("admin.allList");
	}

	// 회원 삭제
	@Override
	public void delete(int member_no) {
		sqlSession.delete("admin.delete", member_no);

	}

	// 페이지 네이션
	@Override
	public List<AllMemberDto> page(Map<String, String> map) {
		return sqlSession.selectList("admin.page", map);
	}

}
