package com.remind.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.remind.model.ParserDto;
import com.remind.model.ParserDao;
import com.remind.model.ParserDaoInter;


@Controller
public class ParserController {
	/*@Autowired(required=true)
	private UrlDao urldao;
	
	@RequestMapping("urltest")
	public ModelAndView selectSawon(UrlBean bean){
		ModelAndView modelAndView = new ModelAndView();
		List<ParsingDto> list = urldao.getData(bean.getUrl());
		
		modelAndView.addObject("productlist", list);
		modelAndView.setViewName("productlist");
		return modelAndView;
	}*/
	
	@Autowired
	private ParserDaoInter daoInter;
	
	@ModelAttribute
	public ParserBean urlBean(){
		return new ParserBean();
	}
	
	@RequestMapping(value="urltest",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectProduct(ParserBean bean){
		//System.out.println(bean.getUrl() + " @@@@@");
		List<Map<String, String>> productlist = new ArrayList<Map<String, String>>();
		Map<String, String> sData = null;
		
		List<ParserDto> list = daoInter.getData(bean.getUrl());
		
		for(ParserDto s:list){
			sData = new HashMap<String, String>();
			sData.put("name", s.getName());
			sData.put("price", s.getPrice());
			sData.put("image", s.getImage());
			productlist.add(sData);
		}
		
		Map<String, Object> productData = new HashMap<String, Object>();
		productData.put("productlist", productlist);
		return productData;
	}
	
}




















