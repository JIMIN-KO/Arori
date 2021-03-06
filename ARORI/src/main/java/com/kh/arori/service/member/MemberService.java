package com.kh.arori.service.member;

import java.util.List;

import com.kh.arori.entity.member.AroriMemberDto;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.QnaDto;
import com.kh.arori.vo.MQIScoreVo;

public interface MemberService {

	// 시퀀스 발급 메소드
	public int getSeq();

	// 회원 가입
	public void join(String emailPath, MemberDto memberDto);

	// 아로리 회원 가입
	public void join(MemberDto memberDto, AroriMemberDto aroriMemberDto);

	// 아로리 회원 로그인
	public MemberDto aroriLogin(String member_id, String member_pw);

	// 로그인 갱신
	public MemberDto loginSuccess(String member_id);

	// 아로리) 비밀번호 찾기 > 이메일 보내기
	public String findPw(String member_id, String member_q, String member_a) throws Exception;

	// 아로리) 임시 비밀번호 발급
	public String temporaryPw();

	// 아로리) 정보수정
	public void updateArori(AroriMemberDto aroriMemberDto);

	// 소셜회원) 정보수정
	public void updateSocial(MemberDto memberDto);

	// 아로리)비밀번호조회
	public boolean checkPw(String member_pw);

	// 회원탈퇴
	public void deleteMember(MemberDto memberDto);

	// 아로리 회원정보수정
	public void updateinfo(MemberDto memberDto, AroriMemberDto aroriMemberDto);

	// 아로리 회원 비번변경
	public void changeAroriPW(AroriMemberDto aroriMemberDto);

	// 마이페이지 > 점수 계산
	public List<Integer> quizAvg(int member_no);

	// 마이페이지 > 퀴즈 섹션 > 퀴즈 별 정보 및 정답 계산 -> 한 페이지에 나오는 게시물
	public List<MQIScoreVo> respectQuizAvg(int member_no, int pageNo);

	// 마이페이지 > 퀴즈 섹션 > 페이지 네이션 블럭
	public List<Integer> respectQPBlock(int member_no, int pageNo);

	// 마이페이지 > 나의 큐앤에이 섹션 > 큐엔에이 페이지 네이션
	public List<QnaDto> getMyQna(int member_no, int pageNo);

	// 마이페이지 > 나의 큐앤에이 섹션 > 큐엔에이 페이지 블럭
	public List<Integer> getQnaBlock(int member_no, int pageNo);
}
