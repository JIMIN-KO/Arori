package com.kh.arori.rest.classes;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/readmeAjax")
public class ReadmeAjaxController {
	
	@PostMapping("create")
	public void readCreate() {
		System.out.println("비동기로 도착했어요!");
	}

}
