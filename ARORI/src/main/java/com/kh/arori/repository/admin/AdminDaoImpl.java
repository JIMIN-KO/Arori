package com.kh.arori.repository.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.img.This_imgDto;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.ClassesDto;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSession sqlSession;

	// 회원삭제

	@Override
	public void Delete(MemberDto memberDto) {
		sqlSession.delete("admin.delete", memberDto);

	}

	@Override
	public int classCount(int member_no) {
		int count = 0;
		count = sqlSession.selectOne("admin.countclass", member_no);
		return count;
	}

	@Override
	public int totalCnt() {
		return sqlSession.selectOne("admin.count");
	}

	@Override
	public List<ClassesDto> getIncome() {
		return sqlSession.selectList("admin.classList");
	}

	@Override
	public This_imgDto getImage(int member_no) {
		return sqlSession.selectOne("admin.memberImage", member_no);
	}

}
