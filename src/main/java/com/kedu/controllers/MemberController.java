package com.kedu.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.commons.EncryptionUtils;
import com.kedu.dao.MemberDAO;
import com.kedu.dto.MemberDTO;

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
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/mypage")
	public String toMypage(HttpSession session, Model model) throws Exception{
		String id = (String)session.getAttribute("loginId");
		MemberDTO inform = dao.select(id);
		model.addAttribute("inform", inform);
		return "members/mypage";
	}
	
	@RequestMapping("/update")
	public String update(MemberDTO dto) {
		dao.update(dto);
		return "redirect:/members/mypage";
	}
}
