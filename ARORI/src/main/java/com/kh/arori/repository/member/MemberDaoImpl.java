package com.kh.arori.repository.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.AroriMemberDto;
import com.kh.arori.entity.MemberDto;
import com.kh.arori.entity.PasswordQDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	PasswordEncoder encoder;

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

	// 아로리) 회원 가입
	@Override
	public void joinArori(AroriMemberDto aroriMemberDto) {
		sqlSession.insert("member.joinArori", aroriMemberDto);
	}

	// 아로리) 회원 상세 정보 조회
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

	// 아로리) 아이디 찾기
	@Override
	public MemberDto findId(AroriMemberDto aroriMemberDto) {
		return sqlSession.selectOne("member.findId", aroriMemberDto);
	}

	// 아로리) 회원 비밀번호 찾기 > 반환 : member_email
	@Override
	public String findPw(Map<String, String> findPw) {
		return sqlSession.selectOne("member.findPw", findPw);
	}

	// 아로리) 회원 비밀번호 > 임시 비밀번호로 변경
	@Override
	public int changeTempPw(AroriMemberDto aroriMemberDto) {
		return sqlSession.update("member.changeTempPw", aroriMemberDto);
	}

	// 아로리 ) 회원정보 수정 (윤아)
	@Override
	public void updateArori(AroriMemberDto aroriMemberDto) {
		// db에서 email을 통해서 회원을 불러온다.
		sqlSession.update("member.updateArori", aroriMemberDto);

	}

	// 아로리) 마이페이지
	@Override
	public AroriMemberDto myInfo(int member_no) {

		AroriMemberDto myInfo = sqlSession.selectOne("member.getmyInfo", member_no);
		return myInfo;

	}

	// 소셜회원 마이페이지
	@Override
	public MemberDto SocialInfo(int member_no) {
		MemberDto socialInfo = sqlSession.selectOne("member.socialMyInfo", member_no);
		return socialInfo;
	}

	// 아로리 멤버조회
	@Override
	public List<AroriMemberDto> getAroriList() {
		List<AroriMemberDto> aroriList = sqlSession.selectList("member.getAroriList");

		return aroriList;
	}

	// 소셜 멤버조회
	@Override
	public void updateSocial(MemberDto memberDto) {

		sqlSession.update("member.updateSocial", memberDto);

	}

	// 비밀번호 체크 여부
	@Override
	public boolean checkPw(String member_pw) {
		boolean result = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_pw", member_pw);

		int count = sqlSession.selectOne("member.checkPw", map);
		if (count == 1)
			result = true;
		return result;
	}

	// 소셜+아로리 목록조회
	@Override
	public List<MemberDto> resultMap() {
		List<MemberDto> result = sqlSession.selectList("member.resultMap");
		return result;
	}

	// 소셜+아로리 목록조회
	@Override
	public List<MemberDto> resultMap2() {
		List<MemberDto> result2 = sqlSession.selectList("member.resultMap2");
		return result2;
	}

	// 회원 가입시 중복닉네임을 검사
	// 재정의하셨는데 모양이 다르네요
	@Override
	public MemberDto checkOverlap(String member_id) {
		return sqlSession.selectOne("member.getCheck", member_id);

	}

	// 회원 가입시 중복이메일을 검사
	@Override
	public MemberDto checkOverlapMail(String member_email) {

		return sqlSession.selectOne("member.getCheckEmail", member_email);
	}

	// 회원 가입시 중복닉네임을 검사
	@Override
	public MemberDto checkOverlapNick(String member_nick) {

		return sqlSession.selectOne("member.getCheckNick", member_nick);
	}

	// 회원 가입시 중복핸드폰을 검사
	@Override
	public MemberDto checkOverlapPhone(String member_Phone) {

		return sqlSession.selectOne("member.getCheckPhone", member_Phone);
	}

	// 회원 탈퇴 아로리멤버의 경우member테이블과 arori_membertable 2군데서 삭제// 소셜멤버는 membertable만 삭제
	// 재정의하셨는데 모양이 다르네요
	@Override
	public void deleteMember(MemberDto memberDto) {
		if (memberDto.getMember_state() == "arori") {
			sqlSession.delete("deleteMember", memberDto);
			sqlSession.update("deleteAroriMember", memberDto);
		} else {
			sqlSession.update("deleteMember", memberDto);

		}
	}

	// 패스워드 조회
	@Override
	public List<PasswordQDto> pwList() {
		List<PasswordQDto> pwList = sqlSession.selectList("member.passQ");
		return pwList;
	}
	//회원전체  단일조회(번호를 통한)
	@Override
	public MemberDto getNo(int member_no) {
		MemberDto getNo = sqlSession.selectOne("member.getNo", member_no);
		return getNo;
	}

	//회원상세정보 전체업데이트
	@Override
	public void adminUpdate(MemberDto memberDto) {

		sqlSession.update("member.adminEdit", memberDto);

	}

	//소셜+아로리 아우터조인 단일조회
	@Override
	public MemberDto memberProfile(int member_no) {
		MemberDto memberProfile = sqlSession.selectOne("member.resultMap3", member_no);
		return memberProfile;
	}

	@Override
	public AroriMemberDto memberProfile2(int member_no) {
		AroriMemberDto memberProfile2 = sqlSession.selectOne("member.resultMap4", member_no);
		return memberProfile2;
	}

}
