package com.kh.arori.service.study;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.arori.constant.NameConst;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.NoticeDto;
import com.kh.arori.entity.study.QnaDto;
import com.kh.arori.repository.study.ClassesDao;
import com.kh.arori.repository.study.QnaDao;
import com.kh.arori.service.img.ImgService;
import com.kh.arori.service.toast.ToastService;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	private ClassesDao classesDao;
	
	@Autowired
	private QnaDao qnaDao;
	
	@Autowired
	private ToastService toastService;
	
	@Autowired
	private ImgService imgService;
	
	@Autowired
	private HttpSession session;
	
	// QNA 새 글 작성
	@Override
	@Transactional
	public int create(String c_no, String member_no) {
		
		// QNA 게시글 고유번호 
		int qna_no = qnaDao.getSeg();
		
		 MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");
		
		QnaDto qnaDto = QnaDto.builder().c_no(Integer.parseInt(c_no)).member_no(userinfo.getMember_no())
						.qna_no(qna_no).qna_title(c_no + "-"  + qna_no + "Q&A 게시글 작성 중" )
						.qna_content(c_no + "-"  + qna_no + " Q&A 게시글 작성 중")
						.qna_state(0).group_no(qna_no).build();
				

		// QNA 게시글 작성
		qnaDto.setQna_no(qna_no);
		qnaDao.create(qnaDto);	
		return qna_no;	
	}
	
	// 답글 작성
	@Override
	@Transactional
	public int createReply(QnaDto qnaDto) {
		
		// QNA 게시글 고유번호 
		int reply_qna_no = qnaDao.getSeg();
		
		 MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");
			
		 
		QnaDto.builder().c_no(qnaDto.getC_no()).member_no(userinfo.getMember_no())
					.qna_no(reply_qna_no).qna_title(qnaDto.getC_no() + "-"  +  reply_qna_no + " Q&A 게시글 답글 작성 중" )
					.qna_content(qnaDto.getC_no() + "-"  +  reply_qna_no+ " Q&A 게시글 답글 작성 중")
					.qna_state(0).depth(qnaDto.getDepth()).super_no(qnaDto.getQna_no()).group_no(qnaDto.getGroup_no()).build();
			
			qnaDto.setDepth(qnaDto.getDepth() + 1 ); // depth +1 하고
			qnaDto.setGroup_no(qnaDto.getGroup_no()); // 그룹넘버는 부모한테 가져오고
			qnaDto.setSuper_no(qnaDto.getQna_no()); //부모 넘버는 부모 qna_no를 가져온다		
			
		
		// QNA 게시글 작성		
		qnaDto.setQna_no(reply_qna_no);
		qnaDao.createReply(qnaDto);
	
		return qnaDto.getQna_no();
	}
	
	// QNA 게시글 페이지 네이션 기능
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

		// 페이지네이션 계산 코드
		@Override
		public List<Integer> pagination(int c_no, int pageNo) {
			// 페이지 네비게이터 계산
			int pageSize = 10; // 한 페이지에 보여질 게시글 개수 -> 10개 
			int blockSize = 10; // 페이지네이션 블럭 개수 -> 10개
			int startBlock = (pageNo - 1) / blockSize * blockSize + 1; // 블럭 리스트 첫 번째 블럭 번호
			int finishBlock = startBlock + blockSize - 1; // 블럭 리스트 마지막 블럭 번호 
			int count = qnaDao.count(c_no); // 해당 클래스의 게시물 개수 
			int blockCount = (count + pageSize - 1) / pageSize; // 해당 클래스의 총 블럭 개수 

			// 만약 blockCount 가 finishBlock 보다 작다면 (ex. 10 > 2)
			if (finishBlock > blockCount)
				finishBlock = blockCount;

			// startBlock ~ finishBlock 만큼 반복 후 배열 객체화 
			List<Integer> block = new ArrayList<Integer>();

			for (int i = startBlock; i <= finishBlock; i++) {
				block.add(i);
			}
			return block;
		}

		// QNA 게시글 수정 기능 
		@Override
		public String edit(List<String> qna_content, QnaDto qnaDto) {
			// VIEW 에서 받아온 qna_content 를 재가공하는 작업 
			String content = toastService.content(qna_content);
			
//			if(qnaDto.getQna_state() == 0) { // 임시게시글이라면
//				qnaDto.setQna_state(1);			// 공개 게시글로 바꿔라
//			}
			
			if(qnaDto.getSuper_no() == 0) { // 부모가 없다면 (새글이라면)
				qnaDto.setDepth(0);
				qnaDto.setGroup_no(qnaDto.getQna_no());
				qnaDto.setSuper_no(0);
			}
		
			
			qnaDto.setQna_content(content);
			
			
			// 게시글 수정 후 반환 값으로 성공 / 실패 URL 전송 
			int result = qnaDao.edit(qnaDto);
			
			// 성공 
			if(result == 1) {
				return "redirect:" + qnaDto.getC_no() + "/1";
			}
			
			// 실패 
			return "redirect:" + qnaDto.getC_no() + "/1?fail";
		}
		
		// QNA 게시글 답글 수정 기능 
		@Override
		public String editReply(List<String> qna_content, QnaDto qnaDto) {
			// VIEW 에서 받아온 qna_content 를 재가공하는 작업 
			String content = toastService.content(qna_content);

			qnaDto.setQna_content(content);
			
			// 게시글 수정 후 반환 값으로 성공 / 실패 URL 전송 
			int result = qnaDao.edit(qnaDto);
			
			// 성공 
			if(result == 1) {
				return "redirect:" + qnaDto.getC_no() + "/1";
			}
			
			// 실패 
			return "redirect:" + qnaDto.getC_no() + "/1?fail";
		}
		

		@Override
		// QNA 게시글 삭제 기능 
		public String delete(QnaDto qnaDto, int member_no) {
			// 클래스 주인 검사 
			ClassesDto classesDto = ClassesDto.builder().member_no(member_no).c_no(qnaDto.getC_no()).build();
			ClassesDto checkM = classesDao.checkM(classesDto);
			
			if(checkM != null) {
				imgService.delete(qnaDto.getQna_no(), NameConst.QNA);
				qnaDao.delete(qnaDto); // 게시글 삭제 
				return "redirect:/classes/qna/" + qnaDto.getC_no() + "/1";
			}
			return "redirect:/classes/qna/" + qnaDto.getC_no() + "/1?fail";
		}

		// QNA 게시글 임시 데이터 저장 
		@Override
		@Transactional
		public String createTemp(List<String> qna_content, QnaDto qnaDto) {
			//qna_content 이어붙이기 
			String content = toastService.content(qna_content);
			
			// dto 에 content 삽입 
			qnaDto.setQna_content(content);
			
			// QNA 게시글 임시 저장소에 데이터 저장 
			qnaDao.createTemp(qnaDto);
			
			return "redirect:" + qnaDto.getC_no() + "/1";
		}

	

}
