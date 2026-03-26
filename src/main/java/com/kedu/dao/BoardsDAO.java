package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.BoardsDTO;


@Repository
public class BoardsDAO {

	
	@Autowired
	private JdbcTemplate jdbc;
	
	public List<BoardsDTO> selectAll() {
		String sql = "select * from boards order by seq desc";
		return jdbc.query(sql, new BeanPropertyRowMapper<BoardsDTO>(BoardsDTO.class));		
	}

	public BoardsDTO selectByseq(int seq) {
		String sql = "select * from boards where seq=?";
		return jdbc.queryForObject(sql, new BeanPropertyRowMapper<BoardsDTO>(BoardsDTO.class),seq);
	}

	public int addlist(BoardsDTO dto) {
		String sql = "insert into boards " +
                "VALUES (boards_seq.nextval, ?, ?, ?,?, SYSDATE)";
		System.out.println(dto.getWriter());

		return jdbc.update(sql,dto.getWriter(),dto.getTitle() , dto.getContents(), 0);

	}

}
