package com.kh.arori.service.study;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.entity.study.NoticeDto;
import com.kh.arori.entity.study.QnaDto;
import com.kh.arori.repository.study.ClassesDao;
import com.kh.arori.repository.study.QnaDao;
import com.kh.arori.service.toast.ToastService;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	private ClassesDao classesDao;
	
	@Autowired
	private QnaDao qnaDao;
	
	@Autowired
	private ToastService toastService;
	
	// QNA 새 글 작성
	@Override
	public int create(List<String> qna_content, String c_no, String qna_title, String member_no) {
		//
		String content = toastService.content(qna_content);
	
		// QNA 게시글 고유번호
		int qna_no = qnaDao.getSeg();
		QnaDto qnaDto = QnaDto.builder().c_no(Integer.parseInt(c_no)).member_no(Integer.parseInt(member_no))
				.qna_no(qna_no).qna_title(qna_title).qna_content(content).group_no(qna_no).build();
		
		// QNA 게시글 작성
		qnaDto.setQna_no(qna_no);
		qnaDao.create(qnaDto);	
		return qna_no;
	}
	
	// QNA 페이지 네이션
	@Override
	public List<QnaDto> getP(String c_no, int pageNo) {
		int pageSize = 10; // 한 페이지 넘버 당 게시글 개수 -> 10개
		int finish = pageNo * pageSize; // 해당 페이지 번호의 마지막 번호
		int start = finish - (pageSize - 1);

		Map<String, String> pagination = new HashMap<String, String>();
		pagination.put("c_no", c_no);
		pagination.put("start", String.valueOf(start));
		pagination.put("finish", String.valueOf(finish));

		List<QnaDto> list = qnaDao.getP(pagination);

		return list;
	}
	

}
