package com.kh.arori.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.constant.NameConst;
import com.kh.arori.entity.study.NoticeDto;
import com.kh.arori.repository.admin.AdminNoticeDao;
import com.kh.arori.service.img.ImgService;
import com.kh.arori.service.pagination.PaginationService;
import com.kh.arori.service.toast.ToastService;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {

	@Autowired
	AdminNoticeDao adminNoticeDao;

	@Autowired
	private ToastService toastService;

	@Autowired
	private ImgService imgService;

	@Autowired
	private PaginationService paginationService;

	// Notice 리스트
	@Override
	public List<NoticeDto> adminNoticeList() {
		return adminNoticeDao.adminNoticeList();
	}

	// Notice 게시글 페이지 네이션 기능
	@Override
	public List<NoticeDto> getP(Map<String, String> map) {
		Map<String, Integer> pagination = paginationService.pagination("", 0, Integer.parseInt(map.get("pageNo")));
		String start = String.valueOf(pagination.get("start"));
		String finish = String.valueOf(pagination.get("finish"));

		map.put("start", start);
		map.put("finish", finish);

		List<NoticeDto> list = adminNoticeDao.getP(map);
		return list;
	}

	// Notice 게시글 관리자 수정
	@Override
	public String editNoticeAdmin(List<String> n_content, NoticeDto noticeDto) {
		// VIEW 에서 받아온 n_content 를 재가공하는 작업
		String content = toastService.content(n_content);

		noticeDto.setN_content(content);
		System.out.println("content : " + content);

		// 게시글 수정 후 반환 값으로 성공 / 실패 URL 전송
		int result = adminNoticeDao.editNoticeAdmin(noticeDto);
		System.out.println("result : " + result);
		
		int c_no = noticeDto.getC_no();
		int n_no = noticeDto.getN_no();

		// 성공
		if (result == 1) {
			return "redirect:/admin/noticeDetail/" +c_no+ "/" +n_no;
		}
		// 실패
		return "redirect:/admin/noticeList?fail";
	}

	// Notice 게시글 삭제 기능
	@Override
	public String deleteAdmin(NoticeDto noticeDto, int member_auth) {

		if (member_auth == 1) { // admin인지 검사
			imgService.delete(noticeDto.getN_no(), NameConst.NOTICE);
			adminNoticeDao.deleteAdmin(noticeDto);
			return "redirect:/admin/noticeList/1";
		} else {
			return "redirect:/admin/noticeList?fail";
		}
	}

	// 페이지 네이션 블럭
	@Override
	public List<Integer> block(int thisCount, int pageNo) {
		int count = thisCount;
		List<Integer> block = paginationService.paginationBlock(0, pageNo, count);
		return block;
	}

}
