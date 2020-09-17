package com.kh.arori.controller.admin;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.arori.HomeController;
import com.kh.arori.entity.member.AroriMemberDto;
import com.kh.arori.entity.member.IncomeVO;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.repository.admin.AdminDao;
import com.kh.arori.service.admin.AdminService;
import com.kh.arori.service.admin.IncomeService;

import lombok.Setter;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Controller
@Log
@RequestMapping("/admin")
public class IncomeController {
	@Inject
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private AdminDao adminDao;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
  @RequestMapping(value = "dateIncome", method = RequestMethod.GET)
  	public String home(Locale locale, Model model,@ModelAttribute MemberDto memberDto, @ModelAttribute AroriMemberDto aroriMemberDto)throws Exception {

	  int memberCount=adminService.memberCount(memberDto);
	  
	  int aroriCount=adminService.aroriCount(aroriMemberDto);
	  
  		

  		model.addAttribute("memberCount", memberCount);
  		model.addAttribute("aroriCount", aroriCount);

  		return "admin/dateIncome";

  	}
}
	
