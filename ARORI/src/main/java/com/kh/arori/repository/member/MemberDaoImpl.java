package com.kh.arori.repository.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.AroriMemberDto;
import com.kh.arori.entity.MemberDto;
import com.kh.arori.entity.PasswordQDto;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSession sqlSession;

	// 시퀀스 번호 발급 
	@Override
	public int getSeq() {
		
		return sqlSession.selectOne("member.seq");
	}

	// 비밀번호 질문 전체 조회 
	@Override
	public List<PasswordQDto> getPasswordQ() {
		List<PasswordQDto> list = sqlSession.selectList("member.getPasswordQ");
		return list;
	}

	// 회원 단일 조회 > MEMBER TABLE
	@Override
	public MemberDto get(String member_id) {
		MemberDto member = sqlSession.selectOne("member.get", member_id);
		return member;
	}

	// 전체 회원 조회 > MEMBER TABLE
	@Override
	public List<MemberDto> getList() {
		List<MemberDto> list = sqlSession.selectList("member.getList");
		return list;
	}

	// 회원 가입 
	@Override
	public void join(MemberDto memberDto) {
		sqlSession.insert("member.join", memberDto);
	}

	// 아로리 회원 가입 
	@Override
	public void joinArori(AroriMemberDto aroriMemberDto) {
		sqlSession.insert("member.joinArori", aroriMemberDto);
	}

	// 아로리 회원 상세 정보 조회 
	@Override
	public AroriMemberDto getArori(String member_id) {
		AroriMemberDto aroriMember = sqlSession.selectOne("member.getArori", member_id);
		return aroriMember;
	}

	// 로그인 시 로그인 시간 갱신 
	@Override
	public int loginSuccess(String member_id) {
		return sqlSession.update("member.loginUpdate", member_id);
	}

	
}
