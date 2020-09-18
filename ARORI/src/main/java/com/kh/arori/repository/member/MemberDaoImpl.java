package com.kh.arori.repository.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.member.AllMemberDto;
import com.kh.arori.entity.member.AroriMemberDto;
import com.kh.arori.entity.member.MAIDto;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.member.PasswordQDto;

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

	// 회원 탈퇴 아로리멤버의 경우member테이블과 arori_membertable 2군데서 삭제// 소셜멤버는 membertable만 삭제
	@Override
	public void deleteMember(MemberDto memberDto) {
		if (memberDto.getMember_state() == "arori") {
			sqlSession.delete("deleteMember", memberDto);
			sqlSession.update("deleteAroriMember", memberDto);
		} else {
			sqlSession.update("deleteMember", memberDto);

		}
	}

	// 회원 가입시 중복닉네임을 검사
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

	// 아로리 ) 회원정보 수정 (윤아)
	@Override
	public void updateArori(AroriMemberDto aroriMemberDto) {
		// 아로리테이블 업데이트
		sqlSession.update("member.updateArori", aroriMemberDto);

	}

	// 소셜 )회원정보 수정
	@Override
	public void updateSocial(MemberDto memberDto) {
		// 소셜 테이블 업데이트
		sqlSession.update("member.updateSocial", memberDto);

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

	// 비밀번호 체크 여부
	@Override
	public boolean checkPw(String member_pw) {
		boolean result = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_pw", member_pw);
		map.put("member_pw", member_pw);

		int count = sqlSession.selectOne("member.checkPw", map);
		if (count == 1)
			result = true;
		return result;
	}

	// 아로리 회원 비밀번호 변경
	@Override
	public void changeAroriPW(AroriMemberDto aroriMemberDto) {

		aroriMemberDto.setMember_pw(encoder.encode(aroriMemberDto.getMember_pw()));
		sqlSession.update("changeAroriPW", aroriMemberDto);

	}

	// 아로리 비번 변경전에 체크하기
	@Override
	public boolean checkChangePw(String member_id, String member_pw) {
		AroriMemberDto aroriMember = this.getArori(member_id);
		boolean vaild = encoder.matches(member_pw, aroriMember.getMember_pw());
		if (vaild) {
			return true;
		} else {
			return false;
		}

	}

	// 회원전체 단일조회(번호를 통한)
	@Override
	public MemberDto getNo(int member_no) {
		MemberDto getNo = sqlSession.selectOne("member.getNo", member_no);
		return getNo;
	}

	// 회원상세정보 전체업데이트
	@Override
	public void adminUpdate(AllMemberDto allMemberDto) {

		sqlSession.update("member.adminEdit", allMemberDto);

	}

	// 소셜+아로리 아우터조인 단일조회
	@Override
	public AllMemberDto memberProfile(int member_no) {
		AllMemberDto memberProfile = sqlSession.selectOne("member.allMemberList", member_no);
		return memberProfile;
	}

	@Override
	public AllMemberDto allGet(String member_id) {
		AllMemberDto allmember = sqlSession.selectOne("member.allGet", member_id);
		return allmember;
	}

	@Override
	   public MAIDto getMAI(int member_no) {

	      return sqlSession.selectOne("member.getMAI",member_no);
	   }

	   //회원의 권한 조회 
	   @Override
	   public MemberDto getAuth(String member_auth) {
	      // TODO Auto-generated method stub
	      return null;

	   }
}