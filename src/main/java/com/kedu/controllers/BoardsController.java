package com.kedu.controllers;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kedu.dao.BoardsDAO;
import com.kedu.dto.BoardsDTO;

@Controller
@RequestMapping("/boards")
public class BoardsController {
	
	@Autowired
	private BoardsDAO dao;
	
	@RequestMapping("/list")
	public String toList(Model model) {
		List<BoardsDTO> list = dao.selectAll();
		model.addAttribute("list", list);
		return "boards/list";
	}
	
	@RequestMapping("/detailContent")
	public String detailContent(int seq, Model model) {
		System.out.println("speContent");
		BoardsDTO dto = dao.selectByseq(seq);
		model.addAttribute("dto",dto);

		return "/boards/datail";
	}

	@RequestMapping("/inputGuestbook")
	public String inputGuestbook(Model model) {
		return "boards/inputguestbook";
	}
	
	@RequestMapping("/write")
	public String write(BoardsDTO dto) {
		dao.addlist(dto);
		return "redirect:/boards/list";
	}

}
