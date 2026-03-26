package com.kedu.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.commons.EncryptionUtils;
import com.kedu.dao.MemberDAO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberDAO dao;
	
	private EncryptionUtils eu = new EncryptionUtils();

	@RequestMapping("/login")
	public String login(String id, String pw,HttpSession session) {
		boolean result = dao.login(id,eu.getSha512(pw));
		if(result) {
			session.setAttribute("loginId", id);
		}
		return "redirect:/";	
	}
	
}
