package com.kh.arori.rest.classes;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.SubscribeDto;
import com.kh.arori.repository.member.MemberDao;
import com.kh.arori.repository.study.ClassesDao;

@RestController
@RequestMapping("/subAjax")
public class SubAjaxController {

	@Autowired
	private ClassesDao classesDao;

	@RequestMapping("/subscribe")
	public int sub(Model model, HttpSession session, @ModelAttribute SubscribeDto subDto) {
	
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");

		// 클래스 넘버를 이용한 단일조회로 classesDto 보내기
		ClassesDto classesDto = classesDao.get(subDto.getC_no());
		
		// 해당 member_no와 c_no로 데이터 조회 
		SubscribeDto already = classesDao.checkSub(subDto);

		if (already != null) { // subDto에 데이터가 있으면(이미 구독 돼 있다면)

			// 삭제(구독자수 -1)
			classesDao.delSub(subDto);

		} else { // subDto에 데이터가 없으면(구독이 안 되어 있다면)
			// 시퀀스 발급
			int sub_no = classesDao.getsubSeq();
			subDto.setSub_no(sub_no);

			// 구독 (구독자수+1)
			classesDao.sub(subDto);

		}
		// c_subscribe(구독자수) 새로 갱신
		classesDao.subUpdate(classesDto);
		// 갱신된 classesDto 단일조회해서 classesDto 넘기기
		classesDto = classesDao.get(subDto.getC_no());
		model.addAttribute("classesDto", classesDto);
		// c_subscribe에 구독자수 저장
		int c_subscribe = classesDao.countSub(subDto);
		// 해당 변수를 다시 찐 c_subscribe에 저장
		classesDto.setC_subscribe(c_subscribe);
		
		return c_subscribe;
	}

}
