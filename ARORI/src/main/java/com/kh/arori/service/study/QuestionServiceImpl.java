package com.kh.arori.service.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.constant.NameConst;
import com.kh.arori.entity.study.AllQuestionDto;
import com.kh.arori.entity.study.ExplainDto;
import com.kh.arori.entity.study.MultipleDto;
import com.kh.arori.entity.study.OxDto;
import com.kh.arori.entity.study.This_qDto;
import com.kh.arori.repository.study.QuestionDao;
import com.kh.arori.service.toast.ToastService;
import com.kh.arori.vo.ThisQuizVo;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private ToastService toastService;

	@Autowired
	private QuestionDao questionDao;

	// OX 퀘스쳔 만들기
	@Override
	public int createQuestion(List<String> content, AllQuestionDto allQuestionDto, OxDto oxDto) {
		// 1. All_Question 테이블 데이터 업데이트(수정 / 갱신)
		// 1-1. List 타입 content String 병합
		String aq_content = toastService.content(content);
		allQuestionDto.setAq_content(aq_content);
		allQuestionDto.setQt_no(1);

		// 1-2. 수정된 디티오 업데이트(수정 / 갱신)
		AllQuestionDto check = questionDao.get(allQuestionDto);

		if (check != null) {
			questionDao.updateAQuestion(allQuestionDto);
		} else {
			questionDao.createQuestion(allQuestionDto);
		}

		// 2. OX 정답 테이블 데이터 삽입
		// 2-1. 정답 테이블 시퀀스 번호 발급
		int ox_no = questionDao.getSeqOx();
		oxDto.setNo(ox_no);

		// 2-2. OX 정답 Dto 데이터 베이스에 삽입
		questionDao.createOx(oxDto);

		// 3. This_Q 테이블 오작교 연결
		// 3-1. This_Q 의 고유번호 발급
		int this_q_no = questionDao.getSeq2(NameConst.OX);
		// 3-2. This_Q dto > 위의 데이터를 객체화해서 만든다.
		This_qDto this_qDto = This_qDto.builder().no(this_q_no).question_no(allQuestionDto.getQuestion_no())
				.this_no(ox_no).table_name(NameConst.OX).build();

		// 3-3. This_Q 데이터 삽입
		questionDao.insertThis(this_qDto);

		// 4. 다음 퀘스쳔을 위한 데이터 생성
		// 4-1. 다음 퀘수쳔 고유 번호 발급
		int next_aqdto_no = questionDao.getSeq();

		// 다음 문제 번호 리턴
		return next_aqdto_no;
	}

	// 선다형 문제 만들기
	@Override
	public int createQuestion(List<String> content, AllQuestionDto allQuestionDto, MultipleDto multipleDto) {
		// 1. All_Question 테이블 데이터 업데이트(수정 / 갱신)
		// 1-1. List 타입 content String 병합
		String aq_content = toastService.content(content);
		allQuestionDto.setAq_content(aq_content);
		allQuestionDto.setQt_no(2);

		// 1-2. 수정된 디티오 업데이트(수정 / 갱신)
		AllQuestionDto check = questionDao.get(allQuestionDto);

		if (check != null) {
			questionDao.updateAQuestion(allQuestionDto);
		} else {
			questionDao.createQuestion(allQuestionDto);
		}

		// 2. 선다형 정답 테이블 데이터 삽입
		// 2-1. 정답 테이블 시퀀스 번호 발급
		int mul_no = questionDao.getSeqMul();
		multipleDto.setNo(mul_no);

		// 2-2. 선다형 정답 Dto 데이터 베이스에 삽입
		questionDao.createMul(multipleDto);

		// 3. This_Q 테이블 오작교 연결
		// 3-1. This_Q 의 고유번호 발급
		int this_q_no = questionDao.getSeq2(NameConst.MULTIPLE);
		// 3-2. This_Q dto > 위의 데이터를 객체화해서 만든다.
		This_qDto this_qDto = This_qDto.builder().no(this_q_no).question_no(allQuestionDto.getQuestion_no())
				.this_no(mul_no).table_name(NameConst.MULTIPLE).build();

		// 3-3. This_Q 데이터 삽입
		questionDao.insertThis(this_qDto);

		// 4. 다음 퀘스쳔을 위한 데이터 생성
		// 4-1. 다음 퀘수쳔 고유 번호 발급
		int next_aqdto_no = questionDao.getSeq();
		return next_aqdto_no;
	}

	// 단답형 문제 만들기

	@Override
	public int createQuestion(List<String> content, AllQuestionDto allQuestionDto, ExplainDto explainDto) {
		// 1. All_Question 테이블 데이터 업데이트(수정 / 갱신)
		// 1-1. List 타입 content String 병합
		String aq_content = toastService.content(content);
		allQuestionDto.setAq_content(aq_content);
		allQuestionDto.setQt_no(3);

		// 1-2. 수정된 디티오 업데이트(수정 / 갱신)
		AllQuestionDto check = questionDao.get(allQuestionDto);

		if (check != null) {
			questionDao.updateAQuestion(allQuestionDto);
		} else {
			questionDao.createQuestion(allQuestionDto);
		}

		// 2. 단답형 정답 테이블 데이터 삽입
		// 2-1. 정답 테이블 시퀀스 번호 발급
		int ex_no = questionDao.getSeqEx();
		explainDto.setNo(ex_no);

		// 2-2. 단답형 정답 Dto 데이터 베이스에 삽입
		questionDao.createEx(explainDto);

		// 3. This_Q 테이블 오작교 연결
		// 3-1. This_Q 의 고유번호 발급
		int this_q_no = questionDao.getSeq2(NameConst.EXPLAIN);
		// 3-2. This_Q dto > 위의 데이터를 객체화해서 만든다.
		This_qDto this_qDto = This_qDto.builder().no(this_q_no).question_no(allQuestionDto.getQuestion_no())
				.this_no(ex_no).table_name(NameConst.EXPLAIN).build();

		// 3-3. This_Q 데이터 삽입
		questionDao.insertThis(this_qDto);

		// 4. 다음 퀘스쳔을 위한 데이터 생성
		// 4-1. 다음 퀘수쳔 고유 번호 발급
		int next_aqdto_no = questionDao.getSeq();
		return next_aqdto_no;
	}

	// 기존 퀘스쳔 및 정답 수정
	@Override
	public void update(String path, ThisQuizVo thisQuizVo) {
		// ThisQuizVo -> ThisQuizDto
		// 1) 리스트로 받아온 데이터 > String 으로 변환
		thisQuizVo.setAq_content(toastService.content(thisQuizVo.getContent()));

		// question_no 를 이용, 정답 테이블 데이터 조회
		int this_no = questionDao.getAnswerNo(thisQuizVo.getQuestion_no());

		// ALL_QUESTION 객체화
		AllQuestionDto allQuestionDto = AllQuestionDto.builder().question_no(thisQuizVo.getQuestion_no())
				.q_no(thisQuizVo.getQ_no()).aq_content(thisQuizVo.getAq_content()).build();

		// ALL_QUESTION 수정
		questionDao.updateAQuestion(allQuestionDto);

		// 각 유형별로 정답 데이터 수정
		if (path.equals("ox")) {
			// OX 수정
			OxDto oxDto = OxDto.builder().no(this_no).o_content(thisQuizVo.getO_content())
					.x_content(thisQuizVo.getX_content()).ox_answer(Integer.parseInt(thisQuizVo.getOx_answer()))
					.build();
			questionDao.updateOx(oxDto);
		} else if (path.equals("multiple")) {
			// 선다형 수정
			MultipleDto multipleDto = MultipleDto.builder().no(this_no).multiple_one(thisQuizVo.getMultiple_one())
					.multiple_two(thisQuizVo.getMultiple_two()).multiple_three(thisQuizVo.getMultiple_three())
					.multiple_four(thisQuizVo.getMultiple_four())
					.multiple_answer(Integer.parseInt(thisQuizVo.getMultiple_answer())).build();
			questionDao.updateMul(multipleDto);
		} else {
			// 단답형 수정
			ExplainDto explainDto = ExplainDto.builder().no(this_no).explain_answer(thisQuizVo.getExplain_answer())
					.build();
			questionDao.updateEx(explainDto);
		}

	}

}
