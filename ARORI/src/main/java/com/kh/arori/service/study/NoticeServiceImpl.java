package com.kh.arori.service.study;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.arori.constant.NameConst;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.NoticeDto;
import com.kh.arori.repository.study.ClassesDao;
import com.kh.arori.repository.study.NoticeDao;
import com.kh.arori.service.img.ImgService;
import com.kh.arori.service.pagination.PaginationService;
import com.kh.arori.service.toast.ToastService;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private ClassesDao classesDao;

	@Autowired
	private NoticeDao noticeDao;

	@Autowired
	private ImgService imgService;

	@Autowired
	private ToastService toastService;

	@Autowired
	private PaginationService paginationService;

	// 공지 게시글 작성
	@Override
	@Transactional
	public int create(String c_no) {

		// 공지 게시글 고유 번호 발급
		int n_no = noticeDao.getSeq();

		// 더미 데이터 삽입
		NoticeDto noticeDto = NoticeDto.builder().c_no(Integer.parseInt(c_no)).n_no(n_no)
				.n_title(c_no + "-" + n_no + " 공지 게시글 작성 중").n_content(c_no + "-" + n_no + " 공지 게시글 작성 중").build();
		// 공지 게시글 작성
		noticeDto.setN_no(n_no);
		noticeDao.create(noticeDto);

		return n_no;
	}

	// 공지 게시글 페이지 네이션 기능
	@Override
	public List<NoticeDto> getP(String c_no, int pageNo) {

		Map<String, Integer> pagination = paginationService.pagination("c_no", Integer.parseInt(c_no), pageNo);

		List<NoticeDto> list = noticeDao.getP(pagination);

		return list;
	}

	// 페이지네이션 계산 코드
	@Override
	public List<Integer> pagination(int c_no, int pageNo) {
		
		int count = noticeDao.count(c_no); // 해당 클래스의 게시물 개수
		List<Integer> block = paginationService.paginationBlock(c_no, pageNo, count);
		return block;
	}

	// 공지 게시글 수정 기능
	@Override
	public String edit(List<String> n_content, NoticeDto noticeDto) {
		// VIEW 에서 받아온 n_content 를 재가공하는 작업
		String content = toastService.content(n_content);

		// Controller 에서 미리 만든 객체에 n_content 삽입
		noticeDto.setN_content(content);

		// 게시글 수정 후 반환 값으로 성공 / 실패 URL 전송
		int result = noticeDao.edit(noticeDto);

		// 성공
		if (result == 1) {
			return "redirect:" + noticeDto.getC_no() + "/1";
		}

		// 실패
		return "redirect:" + noticeDto.getC_no() + "/1?fail";
	}

	@Override
	// 공지 게시글 삭제 기능
	public String delete(NoticeDto noticeDto, int member_no) {
		// 클래스 주인 검사
		ClassesDto classesDto = ClassesDto.builder().member_no(member_no).c_no(noticeDto.getC_no()).build();
		ClassesDto checkM = classesDao.checkM(classesDto);

		if (checkM != null) {
			imgService.delete(noticeDto.getN_no(), NameConst.NOTICE);
			noticeDao.delete(noticeDto); // 게시글 삭제
			return "redirect:/classes/notice/" + noticeDto.getC_no() + "/1";
		}
		return "redirect:/classes/notice/" + noticeDto.getC_no() + "/1?fail";
	}

	// 공지 게시글 임시 데이터 저장
	@Override
	@Transactional
	public String createTemp(List<String> n_content, NoticeDto noticeDto) {
		// n_content 이어붙이기
		String content = toastService.content(n_content);

		// dto 에 content 삽입
		noticeDto.setN_content(content);

		// 공지 게시글 임시 저장소에 데이터 저장
		noticeDao.createTemp(noticeDto);

		return "redirect:" + noticeDto.getC_no() + "/1";
	}
}
