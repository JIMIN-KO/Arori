package com.kh.arori.service.email;

import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailService {
	
	@Autowired
	private JavaMailSender sender;

	// 이메일 전송
	@Override
	public void sendEmail(MimeMessage message) {
		sender.send(message);
	}

	// Mime 이메일 전송을 위한 도구 준비
	@Override
	public void sendPassword(Map<String, String> emailAndTempPw) throws Exception {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		String[] to = {emailAndTempPw.get("email")};
		helper.setTo(to);
		helper.setSubject("아로리 | 회원님의 임시 비밀번호입니다.");
		helper.setText("<h1>아로리 | 당신의 지식</h1><br><hr><br><h3>임시 비밀번호 발급 안내</h3><br><br><h5>임시 비밀번호 : " + emailAndTempPw.get("tempPw") + "</h5>", true);
		
		this.sendEmail(message);
	}

}
