package com.kh.arori.repository.img;

import java.util.List;

import com.kh.arori.entity.img.All_imgDto;
import com.kh.arori.entity.img.This_imgDto;

public interface ImgDao {

	// 이미지 데이터 고유 번호 발급
	public int getSeq();

	// 전체 이미지 테이블 고유 번호 발급
	public int getSeq_all(String table_name);

	// 이미지 통합 테이블 데이터 추가
	public void insert(All_imgDto all_imgDto);

	// 이미지 오작교 데이터 추가
	public void insert2(This_imgDto this_imgDto);

	// 통합 이미지 테이블 데이터 조회
	public All_imgDto get(This_imgDto this_imgDto);
	
	// 오작교 테이블 THIS_NO  조회
	public List<This_imgDto> get2(This_imgDto this_imgDto);

	// 이미지 통합 테이블 데이터 삭제
	public void delete(All_imgDto all_imgDto);

	// 오작교 테이블 데이터 삭제
	public void delete2(This_imgDto this_imgDto);
}
