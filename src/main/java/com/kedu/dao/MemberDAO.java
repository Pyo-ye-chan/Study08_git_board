package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.MemberDTO;

@Repository
public class MemberDAO {
	@Autowired
	private JdbcTemplate jdbc;
	
	public boolean login(String id, String pw) {
		String sql = "select count(*) from member where id = ? and pw = ?";
		System.out.println(pw);
		int result = jdbc.queryForObject(sql,Integer.class,id,pw);
		if(result > 0) {
			return true;
		}else {
			return false;
		}
	}
	
public int addMember(MemberDTO dto) throws Exception {
		
		String sql = "insert into member values (?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		
		return jdbc.update(sql,dto.getId(), dto.getPw(), dto.getName(), dto.getPhone(),
				dto.getEmail(), dto.getZipcode(), dto.getAddress1(), dto.getAddress2());
		
	}
	
	
}
