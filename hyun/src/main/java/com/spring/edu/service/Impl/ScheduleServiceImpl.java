package com.spring.edu.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.edu.dao.Impl.ScheduleDaoImpl;
import com.spring.edu.service.ScheduleService;
import com.spring.edu.vo.ScheduleVo;
import com.spring.edu.vo.UsersVo;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleDaoImpl dao;
	
	@Override
	
	public List<ScheduleVo> scheduleList(){
		return dao.scheduleList();
	}
	
	public ScheduleVo scheduleOne(Map<Integer,String>map) {
		return dao.scheduleOne(map);
	}
	
	public int scheduleInsert(ScheduleVo scheduleVo) {
		return dao.scheduleInsert(scheduleVo);
	}
	
	public List<UsersVo> userId(){
		return dao.userId();
	}
	
	public String productName(int pdNo) {
		return dao.productName(pdNo);
	}

}
