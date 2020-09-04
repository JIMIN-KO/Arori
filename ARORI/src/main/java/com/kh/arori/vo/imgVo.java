package com.kh.arori.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class imgVo {

	private MultipartFile img;

	public boolean isFileExist() {
		
		//  이미지 파일이 없는 경우 
		if (this.img == null)
			return false;
		
		// 이미지 파일의 사이즈가 0 일 경우 
		if (img.getSize() < 0)
			return false;
		
		// 이미지 파일의 첫 번째 인덱스가 비어있을 경우 
		if (img.isEmpty())
			return false;

		return true;
	}
}
