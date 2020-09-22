package com.kh.arori.controller.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.arori.constant.NameConst;
import com.kh.arori.entity.member.AroriMemberDto;
import com.kh.arori.entity.member.MAIDto;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.member.PasswordQDto;
import com.kh.arori.entity.study.MyAnswerDto;
import com.kh.arori.entity.study.MyQuizDto;
import com.kh.arori.entity.study.QnaDto;
import com.kh.arori.entity.study.QuizDto;
import com.kh.arori.entity.study.ThisQuizDto;
import com.kh.arori.repository.member.MemberDao;
import com.kh.arori.repository.study.MyAnswerDao;
import com.kh.arori.repository.study.QnaDao;
import com.kh.arori.repository.study.QuestionDao;
import com.kh.arori.repository.study.QuizDao;
import com.kh.arori.service.img.ImgService;
import com.kh.arori.service.member.MemberService;
import com.kh.arori.service.pagination.PaginationService;
import com.kh.arori.vo.MQIScoreVo;
import com.kh.arori.vo.ThisQuizVo;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private QuizDao quizDao;

	@Autowired
	private QuestionDao questionDao;

	@Autowired
	private MyAnswerDao myAnswerDao;

	@Autowired
	private ImgService imgService;

	@Autowired
	private PaginationService paginationService;

	@Autowired
	private QnaDao qnadDao;

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userinfo");

		return "redirect:/";
	}

	// 회원정보수정(윤아)-김은성 고침
	@GetMapping("/updateArori")
	public String updatearori(Model model, HttpSession session) {
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo"); // 로그인한 정보를 세션 userinfo에 담는다.
		MemberDto member = memberDao.get(userinfo.getMember_id());
		model.addAttribute("memberDto", member);
		AroriMemberDto aroriMemberDto = memberDao.getArori(userinfo.getMember_id());
		model.addAttribute("aroriMemberDto", aroriMemberDto);
		List<PasswordQDto> passwordQ = memberDao.getPasswordQ();
		model.addAttribute("passwordQ", passwordQ);
		return "member/updateArori";
	}

	// 아로리) 회원정보수정(윤아)
	@PostMapping("/updateArori")
	public String updatearori(@ModelAttribute MemberDto memberDto, @ModelAttribute AroriMemberDto aroriMemberDto,
			HttpSession session) {
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");
		memberDto.setMember_no(userinfo.getMember_no());
		aroriMemberDto.setMember_no(userinfo.getMember_no());
		memberService.updateinfo(memberDto, aroriMemberDto);

		return "redirect:myPage";

	}

	// 마이페이지 이동(윤아)
	@GetMapping("/myPage")
	public String mypage(HttpSession session, Model model) {
		// 세션에서 userinfo 정보를 받아온다
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo"); // 로그인한 정보를 세션 userinfo에 담는다.

		// 프로필사진 수정및 등록을 위한 MAIDTO
		// MAIDto maiDto = memberdao.getMAI(member_no)
		MAIDto maiDto = memberDao.getMAI(userinfo.getMember_no());
		model.addAttribute("maiDto", maiDto);

		// 정보 갱신을 위한 단일 조회 > 마이 페이지에서 세션으로 정보 띄워주면 갱신 불편, 속도 느려짐 + 보안 문제
		MemberDto member = memberDao.get(userinfo.getMember_id());
		model.addAttribute("memberDto", member);

		// 점수 계산
		List<Integer> memberScore = memberService.quizAvg(member.getMember_no());
		model.addAttribute("memberScore", memberScore);

		// 만약에 userinfo 의 member_state 가 ARORI 일 경우 myPage_arori.jsp 띄우기
		if (userinfo.getMember_state().equals("ARORI")) {
			// 아로리 회원 정보 단일 조회 후 모델로 jsp 로 보내기
			AroriMemberDto aroriMemberDto = memberDao.getArori(userinfo.getMember_id());
			model.addAttribute("aroriMemberDto", aroriMemberDto);

		}
		// 아닐 경우 myPage_social.jsp 띄우기
		return "member/myPage";
	}

	// 회원 목록 리스트 (윤아)
	@GetMapping("/memberList")
	public String memberList(Model model) {
		List<MemberDto> list = memberDao.getList();
		model.addAttribute("list", list);

		List<AroriMemberDto> aroriList = memberDao.getAroriList();
		model.addAttribute("arorList", aroriList);

		return "member/memberList";

	}

	// 소셜회원 정보 수정-이동 (윤아)
	@GetMapping("/updateSocial")
	public String updateSocial(Model model, HttpSession session) {
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");
		MemberDto member = memberDao.get(userinfo.getMember_id());
		model.addAttribute("memberDto", member);

		return "member/updateSocial";
	}

	// 소셜회원 정보 수정 - 수정
	@PostMapping("/updateSocial")
	public String updateSocial(@ModelAttribute MemberDto memberDto, HttpSession session) {
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");
		memberDto.setMember_no(userinfo.getMember_no());
		memberService.updateSocial(memberDto);
		return "redirect:myPage";
	}

	// 회원탈퇴-이동
	@GetMapping("/delete")
	public String delete(HttpSession session, Model model) {
		MemberDto member = (MemberDto) session.getAttribute("userinfo"); // 로그인한 정보 userinfo를 MemberDto에 담는다.
		model.addAttribute("member", member);
		return "member/delete";
	}

	// 회원탈퇴 -탈퇴
	@PostMapping("/delete")
	public String delete(HttpSession session, @ModelAttribute MemberDto memberDto) {
		memberService.deleteMember(memberDto);
		session.removeAttribute("userinfo");
		return "redirect:/";
	}

	// 비밀번호 변경페이지
	@GetMapping("/changePW")
	public String pwChange(HttpSession session, Model model) {
		MemberDto member = (MemberDto) session.getAttribute("userinfo"); // 로그인한 정보 userinfo를 MemberDto에 담는다.
		model.addAttribute("memberDto", member);
		return "member/changePW";

	}

	// 비밀번호변경
	@PostMapping("/changePW")
	public String pwChange(@ModelAttribute AroriMemberDto aroriMemberDto, HttpSession session) {

		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");
		aroriMemberDto.setMember_no(userinfo.getMember_no());
		memberService.changeAroriPW(aroriMemberDto);
		return "redirect:myPage";

	}

	// 성헌) 나의 퀴즈 + 해당 퀴즈 정보 뿌리기
	@GetMapping("/myQuiz/{pageNo}")
	public String myQuizInfo(@PathVariable int pageNo, HttpSession session, Model model) {
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");

		List<MQIScoreVo> list = memberService.respectQuizAvg(userinfo.getMember_no(), pageNo);
		List<Integer> block = memberService.respectQPBlock(userinfo.getMember_no(), pageNo);

		MyQuizDto myQuizDto = MyQuizDto.builder().member_no(userinfo.getMember_no()).build();
		List<MyQuizDto> quizList = quizDao.getAMQ(myQuizDto);

		int count = quizList.size();
		int no = paginationService.no(pageNo, count);

		model.addAttribute("quizDto", list);
		model.addAttribute("block", block);
		model.addAttribute("no", no);
		model.addAttribute("pageNo", pageNo);

		return "member/myQuiz";
	}

	// 성헌) 나의 정답 확인하기
	@GetMapping("/myAnswer/{q_no}")
	public String myAnswer(@PathVariable int q_no, Model model, HttpSession session) {
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");

		// 0. 해당 퀴즈 정보 받아오기
		QuizDto quizDto = QuizDto.builder().q_no(q_no).build();
		quizDto = quizDao.get(quizDto);
		model.addAttribute("quizDto", quizDto);

		// 1. 해당 퀴즈의 퀘스쳔 대한 정보 가지고 오기
		List<ThisQuizDto> list = questionDao.getTQ(q_no);

		// 2. 나의 정답 가지고 오기
		MyAnswerDto myAnswerDto = MyAnswerDto.builder().member_no(userinfo.getMember_no()).q_no(q_no).build();
		List<MyAnswerDto> myAnswer = myAnswerDao.get(myAnswerDto);

		// 3. vo 에 퀴즈 정보와 나의 정답 합치기
		List<ThisQuizVo> thisQuizVo = new ArrayList<ThisQuizVo>();
		for (int i = 0; i < list.size(); i++) {
			ThisQuizVo vo = new ThisQuizVo(list.get(i)); // 해당 퀴즈의 퀘스쳔 별로 vo 에 담기

			if (myAnswer.size() > i) { // 나의 정답의 길이가 퀘스쳔 길이보다 짧을 경우
				vo.setMyAnswer(myAnswer.get(i).getMy_answer()); // 나의 정답 vo 에 담기
				vo.setCorrect(myAnswer.get(i).getResult());
			}

			thisQuizVo.add(vo);
		}
		model.addAttribute("thisQuizVo", thisQuizVo);
		return "member/myAnswer";
	}

	// 성헌) 나의 QNA 게시글 확인
	@GetMapping("/myQna/{pageNo}")
	public String myQna(@PathVariable int pageNo, HttpSession session, Model model) {
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");

		// 한 페이지에 출력될 게시글
		List<QnaDto> list = memberService.getMyQna(userinfo.getMember_no(), pageNo);

		// 해당 게시판의 페이지네이션 블럭
		List<Integer> block = memberService.getQnaBlock(userinfo.getMember_no(), pageNo);

		// 게시글 번호 뿌리기
		int count = qnadDao.countMyQna(userinfo.getMember_no());
		int no = paginationService.no(pageNo, count);

		model.addAttribute("qnaDto", list);
		model.addAttribute("block", block);
		model.addAttribute("no", no);
		model.addAttribute("pageNo", pageNo);

		return "member/myQna";
	}

	// 프로필 이미지 등록기능
	@PostMapping("/img/setting")
	public String imgCreate(MultipartHttpServletRequest file, HttpSession session, HttpServletResponse resp)
			throws Exception {
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");
		// 1. 해당 클래스에 이미지가 있는지 조회
		// 2. 이미지가 있다면 삭제
		// 3. 새로 들어온 이미지 등록
		imgService.removeAndInsert(userinfo.getMember_no(), NameConst.MEMBER, file);

		return "redirect:/member/myPage";
	}

}