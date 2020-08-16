package com.kh.arori.service.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.arori.entity.AroriMemberDto;
import com.kh.arori.entity.MemberDto;
import com.kh.arori.repository.member.MemberDao;

@Service
public class MemberServiceImple implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private PasswordEncoder encoder;

	// 시퀀스 발급
	@Override
	public int getSeq() {
		int member_no = memberDao.getSeq();
		return member_no;
	}

	// (공통) 회원 가입
	@Override
	@Transactional
	public void join(String emailPath, MemberDto memberDto) {

		// 1. 시퀀스 발급
		int member_no = this.getSeq();

		memberDto.setMember_no(member_no);

		// 2. 소셜 회원 > Google ? Github
		if (emailPath.equals("google.com")) {
			// 구글
			memberDto.setMember_state("GOOGLE");
		} else {
			// 구글 외 이메일 (Github)
			memberDto.setMember_state("GITHUB");
		}

		// 3. 회원 가입
		memberDao.join(memberDto);

	}

	// (아로리) 회원 가입
	@Override
	@Transactional
	public void join(MemberDto memberDto, AroriMemberDto aroriMemberDto) {

		// 1. 시퀀스 발급
		int member_no = this.getSeq();

		// 2. 비밀번호 암호화
		aroriMemberDto.setMember_pw(encoder.encode(aroriMemberDto.getMember_pw()));

		// 3. memberDto / aroriMemberDto 에 시퀀스 번호 및 emailPath(ARORI) 삽입
		memberDto.setMember_no(member_no);
		memberDto.setMember_state("ARORI");
		aroriMemberDto.setMember_no(member_no);

		// 4. 해당 정보 MEMBER 테이블에 삽입
		memberDao.join(memberDto);

		// 5. 아로리 회원 정보 ARORI_MEMBER 테이블에 삽입
		memberDao.joinArori(aroriMemberDto);
	}

	// 아로리 회원 로그인
	@Override
	public MemberDto aroriLogin(String member_id, String member_pw) {
		
		AroriMemberDto aroriMember = memberDao.getArori(member_id);
		
		boolean pass = encoder.matches(member_pw, aroriMember.getMember_pw());
		
		MemberDto member;
		
		if(pass) {
			member = this.loginSuccess(member_id);
			return member;
		}
		
		
		return member = null;
	}

	// (공통) 로그인 갱신
	@Override
	public MemberDto loginSuccess(String member_id) {

		int updateResult = memberDao.loginSuccess(member_id);

		MemberDto member;

		if (updateResult == 1) {
			member = memberDao.get(member_id);
			return member;
		}

		return member = null;
	}

}
