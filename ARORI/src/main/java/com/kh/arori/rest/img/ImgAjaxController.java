package com.kh.arori.rest.img;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.arori.constant.NameConst;
import com.kh.arori.service.img.ImgService;

@RestController
@RequestMapping("/imgAjax")
public class ImgAjaxController {

	@Autowired
	private ImgService imgService;

	// 리드미 이미지 업로드
	@PostMapping("/readme/upload/{c_no}")
	public int upload(@PathVariable int c_no, MultipartHttpServletRequest req) throws Exception {
		// Http 프로토콜 Stream 에서 넘어온 byte[] 를 Iterator 반복자를 이용해 하나의 파일 객체로 합친다.
		int ai_no = imgService.readme_insert(req, c_no);

		return ai_no;
	}

	// 리드미 이미지 다운로드
	@RequestMapping("/readme/download/{ai_no}")
	public ResponseEntity<ByteArrayResource> download(@PathVariable int ai_no) throws Exception {
		ResponseEntity<ByteArrayResource> download = imgService.download(ai_no, NameConst.README);

		return download;
	}
}
