package com.spring.edu.dao.Impl;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.edu.dao.UsersDao;
import com.spring.edu.vo.form.UsersForm;

@Repository
public class UsersDaoImpl implements UsersDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "user.";

	
	@Override
	public int usersInsert(UsersForm usersVo) {
		int usersInsert = sqlSession.insert(nameSpace + "UsersInsert", usersVo);
		return usersInsert;
	}

}
