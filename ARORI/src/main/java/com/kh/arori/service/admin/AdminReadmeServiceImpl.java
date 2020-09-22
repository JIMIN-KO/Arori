package com.kh.arori.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.constant.NameConst;
import com.kh.arori.entity.study.ReadmeDto;
import com.kh.arori.repository.admin.AdminReadmeDao;
import com.kh.arori.service.img.ImgService;
import com.kh.arori.service.pagination.PaginationService;
import com.kh.arori.service.toast.ToastService;

@Service
public class AdminReadmeServiceImpl implements AdminReadmeService {

	@Autowired
	AdminReadmeDao adminReadmeDao;

	@Autowired
	private ToastService toastService;

	@Autowired
	private ImgService imgService;

	@Autowired
	private PaginationService paginationService;

	// 리드미 리스트
	@Override
	public List<ReadmeDto> adminReadmeList() {
		return adminReadmeDao.adminReadmeList();
	}

	// 리드미 게시글 페이지 네이션 기능
	@Override
	public List<ReadmeDto> getP(Map<String, String> map) {
		Map<String, Integer> pagination = paginationService.pagination("", 0, Integer.parseInt(map.get("pageNo")));
		String start = String.valueOf(pagination.get("start"));
		String finish = String.valueOf(pagination.get("finish"));

		map.put("start", start);
		map.put("finish", finish);

		List<ReadmeDto> list = adminReadmeDao.getP(map);
		return list;
	}

	// 리드미 게시글 관리자 수정
	@Override
	public String editReadmeAdmin(List<String> r_content, ReadmeDto readmeDto) {
		// VIEW 에서 받아온 r_content 를 재가공하는 작업
		String content = toastService.content(r_content);

		readmeDto.setR_content(content);

		// 게시글 수정 후 반환 값으로 성공 / 실패 URL 전송
		int result = adminReadmeDao.editReadmeAdmin(readmeDto);
		
		int c_no = readmeDto.getC_no();
		int r_no = readmeDto.getR_no();

		// 성공
		if (result == 1) {
			return "redirect:/admin/readmeDetail/" +c_no+ "/" +r_no;
		}
		// 실패
		return "redirect:/admin/readmeList?fail";
	}

	// 리드미 게시글 삭제 기능
	@Override
	public String deleteAdmin(ReadmeDto readmeDto, int member_auth) {

		if (member_auth == 1) { // admin인지 검사
			imgService.delete(readmeDto.getR_no(), NameConst.README);
			adminReadmeDao.deleteAdmin(readmeDto);
			return "redirect:/admin/readmeList/1";
		} else {
			return "redirect:/admin/readmeList?fail";
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
