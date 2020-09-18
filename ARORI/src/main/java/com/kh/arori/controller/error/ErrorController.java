package com.kh.arori.controller.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

	@GetMapping("/error/error")
	public String error() {
		return "error/error";
	}
}
