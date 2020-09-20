package com.kh.arori.service.today;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.stereotype.Service;

@Service
public class TodayServiceImpl implements TodayService {

	@Override
	public String today(int count) {
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
		
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.MONTH, count); // 몇 개월 단위 전 혹은 후로 설정할 것인지
		
		String today = format.format(cal.getTime());
		
		return today;
	}

}
