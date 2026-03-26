package com.kedu.controllers;

import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		System.out.println(pw);
		if(result) {
			session.setAttribute("loginId", id);
		}
		return "redirect:/";	
	}
	
	@RequestMapping("/join")
	public String join() {
		return "member/joinform";
	}

	@RequestMapping("/signup")
	public String singup(MemberDTO dto) throws Exception {
		String id = dto.getId();
		String pw = dto.getPw();
		EncryptionUtils util = new EncryptionUtils();
		pw = util.getSha512(pw);
		String name = dto.getName();
		String phone = dto.getPhone();
		String email = dto.getEmail();
		String zipcode = dto.getZipcode();
		String address1 = dto.getAddress1();
		String address2 = dto.getAddress2();
		Timestamp join_date = new Timestamp(System.currentTimeMillis());

		MemberDTO dto1 = new MemberDTO(id, pw, name, phone, email, zipcode, address1, address2, join_date);

		if(dao.addMember(dto1) > 0) {
			return "redirect:/";
		};
		return "redirect:members/error";
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}
