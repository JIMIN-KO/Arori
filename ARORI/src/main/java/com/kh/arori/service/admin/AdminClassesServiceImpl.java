package com.kh.arori.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.constant.NameConst;
import com.kh.arori.entity.study.QnaDto;
import com.kh.arori.entity.study.QnaMemberDto;
import com.kh.arori.repository.admin.AdminClassesDao;
import com.kh.arori.service.img.ImgService;
import com.kh.arori.service.pagination.PaginationService;
import com.kh.arori.service.toast.ToastService;

@Service
public class AdminClassesServiceImpl implements AdminClassesService {

	@Autowired
	AdminClassesDao adminClassesDao;

	@Autowired
	private ToastService toastService;

	@Autowired
	private ImgService imgService;

	@Autowired
	private PaginationService paginationService;

	@Override
	public List<QnaMemberDto> adminQnaList() {
		return adminClassesDao.adminQnaList();
	}

	// QNA 게시글 페이지 네이션 기능
	@Override
	public List<QnaMemberDto> getP(Map<String, String> map) {
		Map<String, Integer> pagination = paginationService.pagination("", 0, Integer.parseInt(map.get("pageNo")));
		String start = String.valueOf(pagination.get("start"));
		String finish = String.valueOf(pagination.get("finish"));

		map.put("start", start);
		map.put("finish", finish);

		List<QnaMemberDto> list = adminClassesDao.getP(map);
		return list;
	}

	// QNA 게시글 관리자 수정
	@Override
	public String editQnaAdmin(List<String> qna_content, QnaDto qnaDto) {
		// VIEW 에서 받아온 qna_content 를 재가공하는 작업
		String content = toastService.content(qna_content);

		qnaDto.setQna_content(content);
		System.out.println("content : " + content);

		// 게시글 수정 후 반환 값으로 성공 / 실패 URL 전송
		int result = adminClassesDao.editQnaAdmin(qnaDto);
		System.out.println("result : " + result);
		
		int c_no = qnaDto.getC_no();
		int qna_no = qnaDto.getQna_no();

		// 성공
		if (result == 1) {
			return "redirect:/admin/qnaDetail/" +c_no+ "/" +qna_no;
		}
		// 실패
		return "redirect:/admin/qnaList?fail";
	}

	// QNA 게시글 삭제 기능
	@Override
	public String deleteAdmin(QnaDto qnaDto, int member_auth) {

		if (member_auth == 1) { // admin인지 검사
			imgService.delete(qnaDto.getQna_no(), NameConst.QNA);
			adminClassesDao.deleteAdmin(qnaDto);
			return "redirect:/admin/qnaList/1";
		} else {
			return "redirect:/admin/qnaList?fail";
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
