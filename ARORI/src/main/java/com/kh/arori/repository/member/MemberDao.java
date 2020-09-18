package com.kh.arori.repository.member;

import java.util.List;
import java.util.Map;

import com.kh.arori.entity.member.AllMemberDto;
import com.kh.arori.entity.member.AroriMemberDto;
import com.kh.arori.entity.member.MAIDto;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.member.PasswordQDto;

public interface MemberDao {

	// 회원 시퀀스 발급
	public int getSeq();

	// 비밀번호 질문 받아오기
	public List<PasswordQDto> getPasswordQ();

	// 회원 단일 조회
	public MemberDto get(String member_id);

	// 전체 회원 조회
	public List<MemberDto> getList();

	// 회원 가입 > MEMBER TABLE
	public void join(MemberDto memberDto);

	// 아로리) 회원 가입
	public void joinArori(AroriMemberDto aroriMemberDto);

	// 아로리) 회원 상세 정보 가지고 오기
	public AroriMemberDto getArori(String member_id);

	// 로그인 시 로그인 시간 갱신
	public int loginSuccess(String member_id);

	// 아로리) 회원 아이디 찾기
	public MemberDto findId(AroriMemberDto aroriMemberDto);

	// 아로리) 회원 비밀번호 찾기 > 반환 : member_email
	public String findPw(Map<String, String> findPw);

	// 아로리) 회원 비밀번호 > 임시 비밀번호로 변경
	public int changeTempPw(AroriMemberDto aroriMemberDto);

	// 아로리) 회원정보 수정 (윤아)
	public void updateArori(AroriMemberDto aroriMemberDto);

	// 아로리) 마이페이지
	public AroriMemberDto myInfo(int member_no);

	// 아로리) 회원 조회 (윤아)
	public List<AroriMemberDto> getAroriList();

	// 아로리) 비밀번호체크
	public boolean checkPw(String member_pw);

	// 소셜회원) 정보수정
	public void updateSocial(MemberDto memberDto);

	// 소셜회원)마이페이지
	public MemberDto SocialInfo(int member_no);

	// 중복 아이디 검사
	public MemberDto checkOverlap(String member_id);

	// 중복메일 검사
	public MemberDto checkOverlapMail(String member_email);

	// 중복 닉네임 검사
	public MemberDto checkOverlapNick(String member_nick);

	// 중복 폰번호 검사
	public MemberDto checkOverlapPhone(String member_phone);

	// 회원탈퇴
	public void deleteMember(MemberDto memberDto);

	// 아오리 회원 비번변경
	public void changeAroriPW(AroriMemberDto aroriMemberDto);

	// 비번 변경전에 확인사항
	public boolean checkChangePw(String member_id, String member_pw);
	
	//소셜+아로리) 단일조회 = 번호
	public MemberDto getNo(int member_no);
	
	//소셜+아로리 업데이트 (관리자가)
	public void adminUpdate(AllMemberDto allMemberDto);
	
	//소셜+아로리)아우터조인 단일조회(중요)
	public AllMemberDto memberProfile(int member_no);
	
	//전체조회
	public AllMemberDto allGet(String member_id);
	
	//  Member + Member_IMG 같이 (멤버 정보와 프로필 이미지 번호)
	public MAIDto getMAI(int member_no);

	//회원 권한 조회 
	public MemberDto getAuth(String member_auth);
	
	
}