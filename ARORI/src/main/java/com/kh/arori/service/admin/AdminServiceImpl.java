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

	// 상세정보변경
	@Override
	public void adminUpdate(AllMemberDto allMemberDto) {
		memberDao.adminUpdate(allMemberDto);
	}

	// 관리자 -> 변경후 단일조회를 통한 상세정보 조회1
	@Override
	public AllMemberDto memberProfile(int member_no) {
		AllMemberDto memberProfile = memberDao.memberProfile(member_no);
		return memberProfile;
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


	// 아로리 총 멤버 리스트
	@Override
	public List<AllMemberDto> allList() {
		return adminDao.allList();
	}

	//아로리 멤버 총 카운트
	@Override
	public int aroriCount(AroriMemberDto aroriMemberDto) {
	
		return adminDao.aroriCount(aroriMemberDto);
	}

	//전체회원 멤버카운트
	@Override
	public int memberCount(MemberDto memberDto) {
		
		return adminDao.memberCount(memberDto);
	}


}
