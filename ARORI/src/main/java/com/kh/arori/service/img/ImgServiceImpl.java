package com.kh.arori.service.img;

import java.io.File;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.arori.constant.NameConst;
import com.kh.arori.entity.img.All_imgDto;
import com.kh.arori.entity.img.This_imgDto;
import com.kh.arori.repository.img.ImgDao;

@Service
public class ImgServiceImpl implements ImgService {

	@Autowired
	private ImgDao imgDao;

	// 이미지 통합 업로드
	@Override
	public int upload(MultipartHttpServletRequest req) throws Exception {

		Iterator<String> file = req.getFileNames();
		int img_no = imgDao.getSeq(); // 이미지 고유 번호
		if (file.hasNext()) {
			MultipartFile mpf = req.getFile(file.next()); // 파일 변환

			// 데이터 객체화
			All_imgDto all_imgDto = All_imgDto.builder().img_no(img_no).img_name(mpf.getOriginalFilename())
					.img_type(mpf.getContentType()).img_size(mpf.getSize()).build();

			imgDao.insert(all_imgDto); // 이미지 통합 테이블에 데이터 등록

			// 파일 저장
			File target = new File(NameConst.imgPath, String.valueOf(img_no));
			mpf.transferTo(target);

		}
		return img_no;
	}

	// 이미지 파일 업로드 + 데이터 베이스 데이터 추가
	@Override
	@Transactional
	public int insert(MultipartHttpServletRequest req, String table_name, int this_no) throws Exception {
		int no = imgDao.getSeq_all(table_name); // 리드미 오작교 고유 번호
		int ai_no = this.upload(req); // 이미지 고유 번호 + 데이터 저장

		// 데이터 객체화
		This_imgDto this_imgDto = This_imgDto.builder().no(no).ai_no(ai_no).this_no(this_no).table_name(table_name)
				.build();

		imgDao.insert2(this_imgDto); // 리드미 오작교 테이블 데이터 등록

		return ai_no;
	}

	// 파일 다운로드
	@Override
	public ResponseEntity<ByteArrayResource> download(int ai_no, String table_name) throws Exception {
		// 매개 변수 데이터 객체화
		This_imgDto this_imgDto = This_imgDto.builder().ai_no(ai_no).table_name(table_name).build();
		// 데이터 정보 불러오기
		All_imgDto all_imgDto = imgDao.get(this_imgDto);

		if (all_imgDto == null) {
			return ResponseEntity.notFound().build();
		} else {
			File target = new File(NameConst.imgPath, String.valueOf(all_imgDto.getImg_no()));
			byte[] data = FileUtils.readFileToByteArray(target);
			ByteArrayResource res = new ByteArrayResource(data);

			return ResponseEntity.ok().contentType(MediaType.APPLICATION_OCTET_STREAM)
					.contentLength(all_imgDto.getImg_size())
					.header(HttpHeaders.CONTENT_DISPOSITION,
							"attachment; filename=\"" + URLEncoder.encode(all_imgDto.getImg_name(), "UTF-8") + "\"")
					.header(HttpHeaders.CONTENT_ENCODING, "UTF-8").body(res);
		}

	}

	// 파일 삭제
	@Override
	@Transactional
	public void delete(int this_no, String table_name) {
		// 해당 게시글 번호와 테이블 이름을 통해 객체화
		This_imgDto this_imgDto = This_imgDto.builder().this_no(this_no).table_name(table_name).build();
		// 해당 게시글에 속한 모든 이미지 리스트
		List<This_imgDto> img_list = imgDao.get2(this_imgDto);

		for (This_imgDto thisImg : img_list) {

			thisImg.setTable_name(table_name); // 해당 테이블의 이미지를 조회하기 위한 상수 입력

			// 이미지 통합 테이블의 해당 게시글의 이미지 조회
			All_imgDto all_imgDto = imgDao.get(thisImg);

			// 이미지 통합 테이블의 데이터 삭제
			imgDao.delete(all_imgDto);

			// 디스크에서 해당 이미지 파일 삭제
			File target = new File(NameConst.imgPath, String.valueOf(all_imgDto.getImg_no()));
			target.delete();
		}
		// 해당 게시글의 모든 데이터 삭제
		imgDao.delete2(this_imgDto);

	}

	// 이미지 검사 후 삭제 및 등록
	@Override
	@Transactional
	public void removeAndInsert(int this_no, String table_name, MultipartHttpServletRequest req) throws Exception {
		// 0. 이미지 존재 검사
		This_imgDto this_imgDto = This_imgDto.builder().this_no(this_no).table_name(table_name).build();
		List<This_imgDto> list = imgDao.get2(this_imgDto);
		boolean result = list != null;

		// 1. result 값으로 이미지 삭제할지 안할지 결정
		if (result) {
			// 이미지 삭제
			this.delete(this_no, table_name);
		}

		// 2. 삭제 후 혹은 result 값이 true 라면 이미지를 새로 등록
		this.insert(req, table_name, this_no);
	}

}
