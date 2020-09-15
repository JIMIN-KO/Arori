package com.kh.arori.service.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.arori.entity.study.MyAnswerDto;
import com.kh.arori.entity.study.MyQuizDto;
import com.kh.arori.entity.study.ThisQuizDto;
import com.kh.arori.repository.study.MyAnswerDao;
import com.kh.arori.repository.study.QuestionDao;
import com.kh.arori.repository.study.QuizDao;

@Service
public class MyAnswerServiceImpl implements MyAnswerService {

	@Autowired
	private MyAnswerDao myAnswerDao;

	@Autowired
	private QuizDao quizDao;

	@Autowired
	private QuestionDao questionDao;

	// 퀴즈 풀기
	@Override
	@Transactional
	public List<ThisQuizDto> play(int member_no, int q_no) {
		// 1. 퀴즈에 대한 퀘스쳔 받아오기
		List<ThisQuizDto> list = questionDao.getTQ(q_no);

		// 2. 해당 퀴즈를 내가 푼 퀴즈에 등록하기 > 처음이라면!

		MyQuizDto myQuizDto = MyQuizDto.builder().member_no(member_no).q_no(q_no).build();
		myQuizDto = quizDao.getMQ(myQuizDto);
		if (myQuizDto == null) {

			int mq_no = quizDao.getSeqMQ(); // 나의 퀴즈 고유 번호 발급

			// 2-1. 나의 퀴즈 객체화
			MyQuizDto newMyQuiz = MyQuizDto.builder().no(mq_no).member_no(member_no).q_no(q_no).build();

			// 2-2. 나의 퀴즈에 해당 퀴즈 등록
			quizDao.insertMQ(newMyQuiz);

			// 3. 퀘스쳔 개수만큼 나의 정답 테이블에 더미 데이터 추가
			for (ThisQuizDto question : list) {

				// 3-1. 해당 퀘스쳔에 대한 나의 정답 고유 번호
				int ma_no = myAnswerDao.getSeq();

				// 3-2. 해당 퀘스쳔의 정답 데이터 추출
				String question_answer;

				if (question.getQt_no() == 1) {
					// OX 일 경우의 답안
					question_answer = question.getOx_answer();
				} else if (question.getQt_no() == 2) {
					// 선다형일 경우의 답안
					question_answer = question.getMultiple_answer();
				} else {
					// 단답형일 경우의 답안
					question_answer = question.getExplain_answer();
				}

				// 3-4. 위의 데이터들을 객체화
				MyAnswerDto myAnswerDto = MyAnswerDto.builder().no(ma_no).member_no(member_no).q_no(question.getQ_no())
						.question_no(question.getQuestion_no()).question_answer(question_answer).build();

				// 3-5. myAnswerDto > 나의 정답 테이블에 삽입
				myAnswerDao.insert(myAnswerDto);

			}
		}

		return list;
	}

	// 퀴즈에 새로운 퀘스쳔으로 인해 회원 답안에 해당 퀘스쳔의 답안지가 없을 때
	@Override
	public void newAnswer(MyAnswerDto myAnswerDto) {
		// 해당 퀴즈의 새로운 퀘스쳔이 추가됐을 경우 || 해당 퀘스쳔이 회원 답안에 더미 데이터로 없는 경우
		int no = myAnswerDao.getSeq();
		ThisQuizDto thisQuizDto = questionDao.getTQ2(myAnswerDto.getQuestion_no());

		MyAnswerDto newAnswer = MyAnswerDto.builder().no(no).member_no(myAnswerDto.getMember_no())
				.q_no(myAnswerDto.getQ_no()).question_no(myAnswerDto.getQuestion_no()).build();

		if (thisQuizDto.getQt_no() == 1) {
			newAnswer.setQuestion_answer(thisQuizDto.getOx_answer());
		} else if (thisQuizDto.getQt_no() == 2) {
			newAnswer.setQuestion_answer(thisQuizDto.getMultiple_answer());
		} else {
			newAnswer.setQuestion_answer(thisQuizDto.getExplain_answer());
		}

		myAnswerDao.insert(newAnswer);

	}

	// 자동 채점 후 My_Quiz 테이블에 데이터 업데이트 하기
	@Override
	public void updateMyQuiz(MyAnswerDto myAnswerDto) {
		// 나의 정답 테이블에 있는 해당 퀴즈의 퀘스쳔 개수
		List<ThisQuizDto> get = questionDao.getTQ(myAnswerDto.getQ_no());
		int quizCount = get.size();

		// 해당 퀴즈의 퀘스쳔 당 점수 (만점 : 100점)
		double totalScore = (double) 100 / quizCount;

		// 나의 정답 테이블에 있는 해당 퀴즈의 정답 개수
		List<MyAnswerDto> getCur = myAnswerDao.getCur(myAnswerDto);
		double thisScore = (double) getCur.size();

		// 지금까지의 나의 점수
		int myScore = (int) (totalScore * thisScore);

		// 현재 맞은 개수 계산 후 나의 퀴즈 테이블의 점수 테이블 업데이트
		MyQuizDto myQuizDto = MyQuizDto.builder().score(myScore).member_no(myAnswerDto.getMember_no())
				.q_no(myAnswerDto.getQ_no()).build();
		quizDao.updateMQ(myQuizDto);

	}

}
