package com.kh.arori.service.pagination;

import java.util.List;
import java.util.Map;

public interface PaginationService {

	 public Map<String, Integer> pagination(String this_no_name, int this_no, int pageNo);
	 
	 public List<Integer> paginationBlock(int this_no, int pageNo, int count);
	 
	 public int no(int pageNo , int thisCount);
}
