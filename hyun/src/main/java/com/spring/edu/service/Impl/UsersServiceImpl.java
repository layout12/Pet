package com.spring.edu.service.Impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.edu.dao.Impl.UsersDaoImpl;
import com.spring.edu.service.UsersService;
import com.spring.edu.utill.Criteria;
import com.spring.edu.vo.UsersVo;
import com.spring.edu.vo.form.UsersForm;
import com.spring.edu.vo.form.UsersLogin;

@Service
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersDaoImpl dao;
	
	@Override
	public int usersInsert(UsersForm usersVo) {
		return dao.usersInsert(usersVo);
	}

	@Override
	public List<UsersVo> usersList(Criteria cri) {
		return dao.usersList(cri);
	}

	@Override
	public int usersCount() {
		return dao.usersCount();
	}

	@Override
	public UsersVo login(UsersLogin usersVo) {
		return dao.login(usersVo);
	}

	@Override
	public int LoginCheck(UsersLogin usersVo) {
		return dao.LoginCheck(usersVo);
	}
	
	@Override
	public int UdundantInspection(String column, String val) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("column", column);
		map.put("val", val);
		return dao.UdundantInspection(map);
	}

	@Override
	public UsersVo usersDetail(int urNo) {
		return dao.usersDetail(urNo);
	}

	@Override
	public int usersDelete(int urNo) {
		return dao.usersDelete(urNo);
	}

	@Override
	public int usersUpdate(UsersForm usersVo) {
		return dao.usersUpdate(usersVo);
	}

	@Override
	public String UserPwSearch(UsersVo usersVo) {
		return dao.UserPwSearch(usersVo);
	}

	@Override
	public int usersUpdatePassword(UsersVo usersVo) {
		return dao.usersUpdatePassword(usersVo);
	}

	@Override
	public String usersIdSearch(UsersForm usersVo) {
		return dao.usersIdSearch(usersVo);
	}
	
	
}
