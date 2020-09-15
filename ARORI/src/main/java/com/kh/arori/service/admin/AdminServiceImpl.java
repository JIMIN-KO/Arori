package com.kh.arori.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.entity.img.This_imgDto;
import com.kh.arori.entity.member.AllMemberDto;
import com.kh.arori.entity.member.AroriMemberDto;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.repository.admin.AdminDao;
import com.kh.arori.repository.member.MemberDao;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	MemberDao memberDao;

	@Autowired
	AdminDao adminDao;

	@Override
	public void adminUpdate(MemberDto memberDto) {
		memberDao.adminUpdate(memberDto);
	}

	// 관리자 -> 변경후 단일조회를 통한 상세정보 조회1
	@Override
	public MemberDto memberProfile(int member_no) {
		MemberDto memberProfile = memberDao.memberProfile(member_no);
		return memberProfile;
	}

	// 관리자 -> 변경후 단일조회를 통한 상세정보 조회2
	@Override
	public AroriMemberDto memberProfile2(int member_no) {
		AroriMemberDto memberProfile2 = memberDao.memberProfile2(member_no);
		return memberProfile2;
	}

	// 회원탈퇴
	@Override
	public void delete(MemberDto memberDto) {
		memberDao.deleteMember(memberDto);

	}

	// 차트생성 클래스
	@Override
	public List<ClassesDto> getIncome() {
		return adminDao.getIncome();
	}

	// 멤버+멤버이미지 불러오기
	@Override
	public This_imgDto getImage(int member_no) {
		This_imgDto getImage = adminDao.getImage(member_no);
		return getImage;
	}

	// 비밀번호체크
	@Override
	public int checkPw(AroriMemberDto aroriMemberDto) {
		int result = adminDao.checkPw(aroriMemberDto);
		return result;
	}

	// 아로리 총 멤버 리스트
	@Override
	public List<AllMemberDto> allList() {
		return adminDao.allList();
	}

}
