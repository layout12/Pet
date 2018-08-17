package com.spring.edu.dao.Impl;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.spring.edu.dao.ScheduleDao;
import com.spring.edu.vo.ScheduleVo;
import com.spring.edu.vo.UsersVo;

@Repository
public class ScheduleDaoImpl implements ScheduleDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "schedule.";
	
	@Override
	//스케줄리스트 출력
	public List<ScheduleVo> scheduleList(){
		List<ScheduleVo> scheduleList = sqlSession.selectList(nameSpace + "scheduleList");
		return scheduleList;
	}
	//스케줄디테일 출력(상품번호,상품이름)
	public ScheduleVo scheduleOne(Map<Integer,String>map) {	
		ScheduleVo scheduleOne = sqlSession.selectOne(nameSpace + "scheduleOne", map);
		return scheduleOne;
	}
	//스케줄인서트
	public int scheduleInsert(ScheduleVo scheduleVo) {
		int scheduleInsert = sqlSession.insert(nameSpace + "scheduleInsert", scheduleVo);
		return scheduleInsert;
	}
	//user아이디 호출
	public List<UsersVo> userId() {
		List<UsersVo> userId = sqlSession.selectList(nameSpace+"userId");
		return userId;
	}
	//product이름 호출
	public String productName(int pdNo) {
		String productName = sqlSession.selectOne(nameSpace+"productName", pdNo);
		return productName;
	}
}
