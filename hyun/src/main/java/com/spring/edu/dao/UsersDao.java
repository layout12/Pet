package com.spring.edu.dao;


import java.util.List;
import java.util.Map;

import com.spring.edu.utill.Criteria;
import com.spring.edu.vo.UsersVo;
import com.spring.edu.vo.form.UsersForm;
import com.spring.edu.vo.form.UsersLogin;

public interface UsersDao {
	
	int usersInsert(UsersForm usersVo);
	List<UsersVo> usersList(Criteria cri);
	int usersCount();
	UsersVo login(UsersLogin usersVo);
	int LoginCheck(UsersLogin usersVo);
	int UdundantInspection(Map<String,String> map);
	UsersVo usersDetail(int urNo);
	int usersDelete(int urNo);
	int usersUpdate(UsersForm usersVo);
	String UserPwSearch(UsersVo usersVo);
	int usersUpdatePassword(UsersVo usersVo);
	String usersIdSearch(UsersForm usersVo);
}
