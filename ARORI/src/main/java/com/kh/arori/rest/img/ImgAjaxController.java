package com.kh.arori.rest.img;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.arori.service.img.ImgService;

@RestController
@RequestMapping("/imgAjax")
public class ImgAjaxController {

	@Autowired
	private ImgService imgService;

	// 이미지 업로드
	@PostMapping("/{table_name}/upload/{this_no}")
	public int upload(@PathVariable String table_name, @PathVariable int this_no, MultipartHttpServletRequest req)
			throws Exception {
		// Http 프로토콜 Stream 에서 넘어온 byte[] 를 Iterator 반복자를 이용해 하나의 파일 객체로 합친다.
		int ai_no = imgService.insert(req, table_name, this_no);

		return ai_no;
	}

	// 이미지 다운로드
	@RequestMapping("/{table_name}/download/{ai_no}")
	public ResponseEntity<ByteArrayResource> download(@PathVariable String table_name,@PathVariable int ai_no) throws Exception {
		ResponseEntity<ByteArrayResource> download = imgService.download(ai_no, table_name);

		return download;
	}
}
