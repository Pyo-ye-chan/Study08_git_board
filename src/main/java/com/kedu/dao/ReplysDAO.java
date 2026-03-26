package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.ReplysDTO;

@Repository
public class ReplysDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	public void insert(ReplysDTO dto) {
		String sql = "insert into replys values(replys_seq.nextval,?,?,sysdate,?)";
	}

}
