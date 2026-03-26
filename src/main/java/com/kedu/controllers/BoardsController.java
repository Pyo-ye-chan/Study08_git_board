package com.kedu.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.dao.BoardsDAO;
import com.kedu.dto.BoardsDTO;

@Controller
@RequestMapping("/board")
public class BoardsController {
	
	@Autowired
	private BoardsDAO dao;
	
	@RequestMapping("/list")
	public String toList(Model model) {
		List<BoardsDTO> list = dao.selectAll();
		model.addAttribute("list", list);
		return "boards/list";
	}

}
