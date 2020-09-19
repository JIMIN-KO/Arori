package com.kh.arori.service.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.arori.constant.NameConst;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.QnaDto;
import com.kh.arori.entity.study.QnaMemberDto;
import com.kh.arori.repository.admin.AdminClassesDao;
import com.kh.arori.service.img.ImgService;
import com.kh.arori.service.toast.ToastService;

@Service
public class AdminClassesServiceImpl implements AdminClassesService{
	
	@Autowired
	AdminClassesDao adminClassesDao;
	
	@Autowired
	private ToastService toastService;
	
	@Autowired
	private ImgService imgService;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<QnaMemberDto> adminQnaList() {
		return adminClassesDao.adminQnaList();
	}
	
	// QNA 게시글 페이지 네이션 기능
	@Override
	public List<QnaMemberDto> getP(int pageNo) {

		int pageSize = 20; // 한 페이지 넘버 당 게시글 개수 
		int finish = pageNo * pageSize; // 해당 페이지 번호의 마지막 번호
		int start = finish - (pageSize - 1);

		Map<String, String> pagination = new HashMap<String, String>();
		pagination.put("start", String.valueOf(start));
		pagination.put("finish", String.valueOf(finish));

		List<QnaMemberDto> list = adminClassesDao.getP(pagination);

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
		System.out.println("result : " +result);
					
		// 성공 
		if(result == 1) {
			return "redirect:/admin/qnaList"; 		
		}
		// 실패 
		return "redirect:/admin/qnaList?fail";				
	}
	
	// QNA 게시글 임시 데이터 저장 
//	@Override
//	@Transactional
//	public String createTempAdmin(List<String> qna_content, QnaDto qnaDto) {
//		//qna_content 이어붙이기 
//		String content = toastService.content(qna_content);
//					
//		// dto 에 content 삽입 
//		qnaDto.setQna_content(content);
//					
//		// QNA 게시글 임시 저장소에 데이터 저장 
//		adminClassesDao.createTempAdmin(qnaDto);
//				
//		return "redirect:" + qnaDto.getC_no();
//		}
	
	//  QNA 게시글 삭제 기능 
	@Override
	public String deleteAdmin(QnaDto qnaDto, int member_auth) {
		
					
		if(member_auth == 1) { //admin인지 검사
			imgService.delete(qnaDto.getQna_no(), NameConst.QNA);
			adminClassesDao.deleteAdmin(qnaDto);
			return "redirect:/admin/qnaList"; 
			} else {				
				return "redirect:/admin/qnaList?fail";
			}
	}

}
