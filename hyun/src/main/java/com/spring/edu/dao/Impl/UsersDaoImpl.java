package com.spring.edu.dao.Impl;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.edu.dao.UsersDao;
import com.spring.edu.utill.Criteria;
import com.spring.edu.vo.UsersVo;
import com.spring.edu.vo.form.UsersForm;
import com.spring.edu.vo.form.UsersLogin;

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


	@Override
	public List<UsersVo> usersList(Criteria cri) {
		List<UsersVo> res =sqlSession.selectList(nameSpace + "UsersList", cri);
		return res;
	}


	@Override
	public int usersCount() {
		int res = sqlSession.selectOne(nameSpace+"UsersCount");
		return res;
	}


	@Override
	public UsersVo login(UsersLogin usersVo) {
		UsersVo res = sqlSession.selectOne(nameSpace+"UsersLogin", usersVo);
		return res;
	}


	@Override
	public int LoginCheck(UsersLogin usersVo) {
		int res =sqlSession.selectOne(nameSpace+"UserCheck", usersVo);
		return res;
	}
	
	@Override
	public int UdundantInspection(Map<String,String> map) {
		System.out.println("dao"+map);
		int res = sqlSession.selectOne(nameSpace+"UdundantInspection", map);
		return res;
	}


	@Override
	public UsersVo usersDetail(int urNo) {
		UsersVo res = sqlSession.selectOne(nameSpace+"UsersDetail", urNo);
		return res;
	}


	@Override
	public int usersDelete(int urNo) {
		return sqlSession.update(nameSpace+"UsersDelete", urNo);
	}


	@Override
	public int usersUpdate(UsersForm usersVo) {
		return sqlSession.update(nameSpace+"UsersUpdate", usersVo);
	}


	@Override
	public String UserPwSearch(UsersVo usersVo) {
		return sqlSession.selectOne(nameSpace+"UsersPwSearch",usersVo);
	}


	@Override
	public int usersUpdatePassword(UsersVo usersVo) {
		return sqlSession.update(nameSpace+"UsersPwUpdate",usersVo);
	}


	@Override
	public String usersIdSearch(UsersForm usersVo) {
		return sqlSession.selectOne(nameSpace+"UserIdSearch",usersVo);
	}
	
	

}
