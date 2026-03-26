package com.kedu.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.dao.ReplysDAO;
import com.kedu.dto.ReplysDTO;

@Controller
@RequestMapping("/replys")
public class ReplysController {
	
	@Autowired
	private ReplysDAO dao;
	
	@RequestMapping("insert")
	public String insert(ReplysDTO dto)  {
		
		dao.insert(dto);
		return "redirect:/boards/detail";
		
	}
	@RequestMapping("/update")
	public String update(ReplysDTO dto) {
		dao.update(dto);
		
		return "redirect:/boards/detail";
	}
	@RequestMapping("/delete")
	public String delete(int seq) {
		dao.delete(seq);
		
		return "redirect:/boards/detail";
	}

}
