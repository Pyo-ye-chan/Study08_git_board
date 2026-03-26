package com.kedu.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.dao.ReplysDAO;

@Controller
@RequestMapping("/replys")
public class ReplysController {
	
	@Autowired
	private ReplysDAO dao;

}
