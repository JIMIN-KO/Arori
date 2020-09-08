package com.kh.arori.entity.img;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class All_imgDto {
	
	private int img_no;
	private String img_name;
	private String img_type;
	private long img_size;
	
	public void settingDB(MultipartFile file) throws Exception {
		this.setImg_name(file.getOriginalFilename());
		this.setImg_type(file.getContentType());
		this.setImg_size(file.getSize());
	}

}
