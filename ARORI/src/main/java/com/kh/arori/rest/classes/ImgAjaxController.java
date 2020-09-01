package com.kh.arori.rest.classes;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/imgAjax")
public class ImgAjaxController {

	@PostMapping("/upload")
	public void upload() {
		System.out.println("이미지 업로드 비동기!");
	}
	
	@GetMapping("/download")
	public void download() {
		
	}
}
