package com.kh.arori.service.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.entity.member.IncomeVO;

import lombok.Setter;
import lombok.extern.java.Log;

@Service
@Log
public class IncomeServiceImpl implements IncomeService {

	@Setter(onMethod_=@Autowired)

	@Autowired
	private SqlSession sqlSession;
	

	@Override

	public List<IncomeVO> getIncome() {

		List<IncomeVO> list = sqlSession.selectList("IncomeMapper.getIncome");

		return list;
	}

	
}
