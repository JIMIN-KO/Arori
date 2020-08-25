package com.kh.arori.service.email;

import java.util.Map;

import javax.mail.internet.MimeMessage;

public interface EmailService {

	// 이메일 전송 폼 
	public void sendEmail(MimeMessage message);
	
	// 임시 비밀번호 전송 
	public void sendPassword(Map<String, String> emailAndTempPw) throws Exception;
}
