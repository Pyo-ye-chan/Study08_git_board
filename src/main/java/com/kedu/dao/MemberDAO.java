package com.kedu.dao;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	private JdbcTemplate jdbc;
	
	public boolean login(String id, String pw) {
		String sql = "select count(*) from member where id = ? and pw = ?";
		int result = jdbc.queryForObject(sql,Integer.class,id,pw);
		if(result > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	
}
