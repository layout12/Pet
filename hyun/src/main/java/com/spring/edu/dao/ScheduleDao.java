package com.spring.edu.dao;

import java.util.List;
import java.util.Map;

import com.spring.edu.vo.ScheduleVo;
import com.spring.edu.vo.UsersVo;

public interface ScheduleDao {

	List<ScheduleVo> scheduleList();
	ScheduleVo scheduleOne(Map<Integer,String>map);
	int scheduleInsert(ScheduleVo scheduleVo); 
	List<UsersVo> userId();
	String productName(int pdNo);
	
}
