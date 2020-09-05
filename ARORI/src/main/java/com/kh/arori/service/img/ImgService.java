package com.kh.arori.service.img;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ImgService {

	// 이미지 파일 등록(DB) 및 디스크에 저장 (파일 업로드)
	public int upload(MultipartHttpServletRequest req) throws Exception;

	// Readme 이미지 파일 등록(DB)
	public int insert(MultipartHttpServletRequest req, String table_name, int this_no) throws Exception;

	// 파일 다운로드
	public ResponseEntity<ByteArrayResource> download(int ai_no, String table_name) throws Exception;

	// 파일 삭제
	public void delete(int this_no, String table_name);
}
