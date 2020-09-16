package com.kh.arori.service.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.arori.entity.member.AroriMemberDto;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.MyAnswerDto;
import com.kh.arori.entity.study.MyQuizDto;
import com.kh.arori.repository.member.MemberDao;
import com.kh.arori.repository.study.MyAnswerDao;
import com.kh.arori.repository.study.QuizDao;
import com.kh.arori.service.email.EmailService;
import com.kh.arori.vo.MQIScoreVo;

@Service
public class MemberServiceImple implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private PasswordEncoder encoder;

	@Autowired
	private EmailService emailService;

	@Autowired
	private QuizDao quizDao;

	@Autowired
	private MyAnswerDao myAnswerDao;

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

		System.out.println("Service");

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

		boolean pass = false;

		if (aroriMember != null) {
			pass = encoder.matches(member_pw, aroriMember.getMember_pw());
		}

		MemberDto member;

		if (pass) {
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

	// 아로리) 비밀번호 찾기 > 이메일 보내기
	@Override
	@Transactional
	public String findPw(String member_id, String member_q, String member_a) throws Exception {
		// 1. 파라미터 값 > Map 으로 객체 통합
		Map<String, String> findPw = new HashMap<String, String>();
		findPw.put("member_id", member_id);
		findPw.put("member_q", member_q);
		findPw.put("member_a", member_a);

		// 2. 회원 존재 여부 확인
		String email = memberDao.findPw(findPw);

		// 3. 찾을 수 없는 회원이면 null 반환
		if (email == null) {
			return null;
		}

		// 4. 임시 비밀번호 발급
		String temporaryPw = this.temporaryPw();
		AroriMemberDto member = AroriMemberDto.builder().member_email(email).member_pw(encoder.encode(temporaryPw))
				.build();

		// 5. 임시 비밀번호로 회원 비밀번호 변경
		memberDao.changeTempPw(member);

		// 6. 해당 회원의 이메일로 임시 비밀번호 전송
		Map<String, String> emailAndTempPw = new HashMap<String, String>();
		emailAndTempPw.put("email", email);
		emailAndTempPw.put("tempPw", temporaryPw);

		emailService.sendPassword(emailAndTempPw);

		return email;
	}

	// 아로리) 임시 비밀번호 발급
	@Override
	public String temporaryPw() {
		String temporaryPw = UUID.randomUUID().toString().substring(0, 8);
		return temporaryPw;
	}

	// 소셜회원) 소셜회원 수정
	@Override
	public void updateSocial(MemberDto memberDto) {
		memberDao.updateSocial(memberDto);

	}

	// 아로리) 아로리회원 수정
	@Override
	public void updateArori(AroriMemberDto aroriMemberDto) {
		memberDao.updateArori(aroriMemberDto);

	}

	// 아로리) 회원정보수정위한 패스워드 존재여부
	@Override
	public boolean checkPw(String member_pw) {
		return memberDao.checkPw(member_pw);
	}

	// 회원탈퇴
	@Override
	public void deleteMember(MemberDto memberDto) {
		memberDao.deleteMember(memberDto);
	}

	// 아로리 회원정보 수정
	@Override
	public void updateinfo(MemberDto memberDto, AroriMemberDto aroriMemberDto) {
		// MEMBER 테이블 수정
		memberDao.updateSocial(memberDto);
		// arori 테이블 수정
		memberDao.updateArori(aroriMemberDto);

	}

	// 아로리 멤버의 비밀번호수정
	@Override
	public void changeAroriPW(AroriMemberDto aroriMemberDto) {

		memberDao.changeAroriPW(aroriMemberDto);

	}

	// 마이페이지 > 회원 점수 계
	@Override
	public List<Integer> quizAvg(int member_no) {
		// 1. 푼 퀴즈 개수
		MyQuizDto myQuizDto = MyQuizDto.builder().member_no(member_no).build();
		List<MyQuizDto> list = quizDao.getAMQ(myQuizDto);

		int myQuizSize = list.size(); // @ 최종 내가 푼 퀴즈 개수 @

		// 2. 평균 점수 / 3. 정답률
		double score = 0.0;
		int curAvg = 0;

		// 나의 정답 더미 객체
		MyAnswerDto myAnswerDto = MyAnswerDto.builder().member_no(member_no).build();

		// 푼 퀴즈만큼 전체 평균 계산 및 전체 정답률 계산
		for (MyQuizDto quiz : list) {

			// 2-1. 평균 점수 계산
			score += (double) quiz.getScore();
			System.out.println(score);

			// 3-1. 정답률 계산
			myAnswerDto.setQ_no(quiz.getQ_no()); // 현재 퀴즈 번호 삽입
			List<MyAnswerDto> get = myAnswerDao.get(myAnswerDto); // 해당 퀴즈의 퀘스쳔 개수
			List<MyAnswerDto> getCur = myAnswerDao.getCur(myAnswerDto); // 맞은 퀘스쳔

			int getSize = get.size(); // 퀘스쳔 개수
			int getCurSize = getCur.size(); // 해당 퀴즈의 맞은 퀘스쳔 개수
			int getAvg = (int) (((double) getCurSize / getSize) * 100);
			curAvg += getAvg;
		}

		int avgScore = (int) (score / (double) myQuizSize); // @ 최종 평균 점수 @
		curAvg = curAvg / myQuizSize; // @ 최종 정답률 @

		System.out.println(myQuizSize);
		System.out.println(avgScore);
		System.out.println(curAvg);

		List<Integer> memberScore = new ArrayList<Integer>();
		memberScore.add(myQuizSize);
		memberScore.add(avgScore);
		memberScore.add(curAvg);

		return memberScore;
	}

	// 마이페이지 > 퀴즈 섹션 > 퀴즈 별 정보 및 정답 계산
	@Override
	public List<MQIScoreVo> respectQuizAvg(int member_no) {
		// 1. 나의 점수
		// 2. 맞은 개수
		// 3. 틀린 개수
		// 4. 해당 퀴즈에 대한 나의 정답률
		// 5. 퀴즈의 평균 정답률
		return null;
	}

}