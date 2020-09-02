package com.kh.arori.service.study;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.arori.entity.study.NoticeDto;
import com.kh.arori.repository.study.NoticeDao;
import com.kh.arori.service.toast.ToastService;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private ToastService toastService;

	// 공지 게시글 작성 
	@Override
	@Transactional
	public int create(List<String> n_content, String c_no, String n_title) {
		// 게시글 배열 합치기 
		String content = toastService.content(n_content);
		
		// 공지 게시글 고유 번호 발급
		int n_no = noticeDao.getSeq();
		NoticeDto noticeDto = NoticeDto.builder().c_no(Integer.parseInt(c_no)).n_no(n_no).n_title(n_title).n_content(content).build();
		// 공지 게시글 작성
		noticeDto.setN_no(n_no);
		noticeDao.create(noticeDto);
		
		return n_no;
	}

	
	// 공지 게시글 페이지 네이션 기능
	@Override
	public List<NoticeDto> getP(String c_no, String start, String finish) {

		Map<String, String> pagination = new HashMap<String, String>();
		pagination.put("c_no", c_no);
		pagination.put("start", start);
		pagination.put("finish", finish);
		
		List<NoticeDto> list = noticeDao.getP(pagination);
		
		return list;
	}
}
