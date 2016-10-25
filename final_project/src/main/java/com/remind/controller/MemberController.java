package com.remind.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.remind.model.DataInter;

@Controller
public class MemberController {
	@Autowired
	private	DataInter inter;
	
	@RequestMapping("list")
	public Model list(Model model){
		model.addAttribute("data", inter.memberList());
		return model;
	}
}
