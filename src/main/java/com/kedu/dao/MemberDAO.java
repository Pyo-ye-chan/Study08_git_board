package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
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
	

	public MemberDTO select(String id){
		String sql = "select * from members where id = ?";
		return jdbc.queryForObject(sql, new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class), id);
	}
	
	public int update(MemberDTO dto){
		String sql = "update members set phone = ?, email = ?, zipcode = ?, address1 = ?, address2 = ? where id = ?";
		return jdbc.update(sql, dto.getPhone(), dto.getEmail(), dto.getZipcode(), 
				dto.getAddress1(), dto.getAddress2(), dto.getId() );
	}

	public int addMember(MemberDTO dto) throws Exception {
		
		String sql = "insert into member values (?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		
		return jdbc.update(sql,dto.getId(), dto.getPw(), dto.getName(), dto.getPhone(),
				dto.getEmail(), dto.getZipcode(), dto.getAddress1(), dto.getAddress2());
		
	}


	public int delete(String id){
		String sql = "delete from members where id = ?";
		return jdbc.update(sql, id);
	}
	

	
}
