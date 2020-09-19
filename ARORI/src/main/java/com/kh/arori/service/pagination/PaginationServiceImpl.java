package com.kh.arori.service.pagination;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class PaginationServiceImpl implements PaginationService {

	// 한 페이지에 나와야 하는 게시글
	@Override
	public Map<String, Integer> pagination(String this_no_name, int this_no, int pageNo) {
		int pageSize = 10; // 한 페이지 넘버 당 게시글 개수 -> 10개
		int finish = pageNo * pageSize; // 해당 페이지 번호의 마지막 번호
		int start = finish - (pageSize - 1);

		Map<String, Integer> pagination = new HashMap<String, Integer>();
		pagination.put(this_no_name, this_no);
		pagination.put("start", start);
		pagination.put("finish", finish);

		return pagination;
	}

	// 페이지 네이션 블록
	@Override
	public List<Integer> paginationBlock(int this_no, int pageNo, int thisCount) {
		// 페이지 네비게이터 계산
		int pageSize = 10; // 한 페이지에 보여질 게시글 개수 -> 10개
		int blockSize = 10; // 페이지네이션 블럭 개수 -> 10개
		int startBlock = (pageNo - 1) / blockSize * blockSize + 1; // 블럭 리스트 첫 번째 블럭 번호
		int finishBlock = startBlock + blockSize - 1; // 블럭 리스트 마지막 블럭 번호
		int count = thisCount; // 해당 클래스의 게시물 개수
		int blockCount = (count + pageSize - 1) / pageSize; // 해당 클래스의 총 블럭 개수

		// 만약 blockCount 가 finishBlock 보다 작다면 (ex. 10 > 2)
		if (finishBlock > blockCount)
			finishBlock = blockCount;

		// startBlock ~ finishBlock 만큼 반복 후 배열 객체화
		List<Integer> block = new ArrayList<Integer>();

		for (int i = startBlock; i <= finishBlock; i++) {
			block.add(i);
		}
		return block;
	}

	// 게시글 번호
	@Override
	public int no(int pageNo, int thisCount) {
		int count = thisCount;
		int no = count - ((10 * pageNo) - 10);

		return no;
	}

}
