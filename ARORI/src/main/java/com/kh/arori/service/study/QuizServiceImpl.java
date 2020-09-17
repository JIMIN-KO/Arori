package com.kh.arori.service.study;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.arori.constant.NameConst;
import com.kh.arori.entity.study.QuizDto;
import com.kh.arori.entity.study.This_qDto;
import com.kh.arori.repository.study.QuestionDao;
import com.kh.arori.repository.study.QuizDao;
import com.kh.arori.service.img.ImgService;
import com.kh.arori.service.pagination.PaginationService;
import com.kh.arori.service.toast.ToastService;

@Service
public class QuizServiceImpl implements QuizService {

	@Autowired
	private ToastService toastService;

	@Autowired
	private ImgService imgService;

	@Autowired
	private QuizDao quizDao;

	@Autowired
	private QuestionDao questionDao;
	
	@Autowired
	private PaginationService paginationService;

	// 퀴즈 생성
	@Override
	@Transactional
	public int createQuiz(int c_no) {
		QuizDto quizDto = QuizDto.builder().c_no(c_no).q_title("이름없는 퀴즈").q_runtime(100).build();

		// 퀴즈 시퀀스 번호 발급
		int q_no = quizDao.getSeq();

		quizDto.setQ_no(q_no); // 퀴즈 번호
		quizDao.createQuiz(quizDto); // 퀴즈 생성

		return q_no;
	}

	// 퀴즈 수정 / 갱신
	@Override
	@Transactional
	public String update(List<String> content, QuizDto quizDto) {
		String q_content = toastService.content(content);

		quizDto.setQ_content(q_content);
		quizDto.setQ_open(quizDto.getQ_open().replace("T", " ") + ":00"); // 퀴즈 오픈 시간 포맷 수정
		quizDto.setQ_close(quizDto.getQ_close().replace("T", " ") + ":00"); // 퀴즈 클로스 시간 포맷 수정
		quizDto.setQ_score_open(quizDto.getQ_score_open().replace("T", " ") + ":00"); // 점수 오픈 시간 포맷 수정

		int result = quizDao.update(quizDto);
		if (result == 1) {
			return "redirect:/classes/quiz/detail/" + quizDto.getC_no() + "/" + quizDto.getQ_no();
		} else {
			return "redirect:/classes/quiz/detail/" + quizDto.getC_no() + "/" + quizDto.getQ_no() + "?fail";
		}

	}

	// 퀴즈 및 해당 퀴즈의 퀘스쳔 데이터 삭제
	@Override
	@Transactional
	public String delete(int c_no, int q_no) {
		// 해당 퀴즈 번호로 ALL_QUESTION 에서 QUESTION 번호 가지고 와야 함.
		List<Map<String, Integer>> this_q = quizDao.getThis_q(q_no);

		// 테이블 설정
		This_qDto this_qDto = This_qDto.builder().build();

		// question_type 번호에 따라 해당 정답 테이블 데이터 삭제
		for (Map<String, Integer> map : this_q) {
			int qt_no = Integer.parseInt(String.valueOf(map.get("qt_no")));
			if (qt_no == 1) {
				this_qDto.setTable_name(NameConst.OX);
			} else if (qt_no == 2) {
				this_qDto.setTable_name(NameConst.MULTIPLE);
			} else {
				this_qDto.setTable_name(NameConst.EXPLAIN);
			}

			this_qDto.setNo(Integer.parseInt(String.valueOf(map.get("this_no"))));
			imgService.delete(Integer.parseInt(String.valueOf(map.get("question_no"))), NameConst.QUESTION); // 퀘스쳔 번호를
																												// 이용해
																												// 해당
																												// 퀘스쳔의
																												// 이미지
																												// 삭제
			questionDao.deleteAnswer(this_qDto);
		}

		// 퀴즈 삭제 (퀴즈 데이터 삭제 시 해당 퀴즈의 오작교 테이블 데이터까지 삭제됨)
		QuizDto quizDto = QuizDto.builder().c_no(c_no).q_no(q_no).build();
		imgService.delete(q_no, NameConst.QUIZ); // 퀴즈 번호를 이용해 해당 퀴즈 이미지 전체 삭제
		quizDao.delete(quizDto);
		return "redirect:/classes/quiz/" + c_no;
	}

	// 퀴즈 날짜 형식 변환
	@Override
	public QuizDto dateFormat(QuizDto quizDto) throws Exception {
		// 날짜 형식 변환
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");
		// q_open
		Date date = format1.parse(quizDto.getQ_open());
		quizDto.setQ_open(format2.format(date));

		// q_close
		date = format1.parse(quizDto.getQ_close());
		quizDto.setQ_close(format2.format(date));

		// q_score_open
		date = format1.parse(quizDto.getQ_score_open());
		quizDto.setQ_score_open(format2.format(date));
		return quizDto;
	}

	// 퀴즈 페이지 네이션
	@Override
	public List<QuizDto> getQuiz(int c_no, int pageNo) {
		// 페이지 네이션 메소드를 이용해서 조회할 수 있는 숫자 계산
		Map<String, Integer> pagination = paginationService.pagination("c_no", c_no, pageNo);
		List<QuizDto> list = quizDao.getList(pagination);
		return list;
	}

	// 퀴즈 페이지 네이션
	@Override
	public List<Integer> getQuizBlock(int c_no, int pageNo) {
		int count = quizDao.getSize(c_no);
		List<Integer> block = paginationService.paginationBlock(c_no, pageNo, count);
		return block;
	}
}
