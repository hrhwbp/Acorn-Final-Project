package com.remind.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.remind.model.DaoInter;
import com.remind.model.FollowDto;

@Controller
public class FollowController {
	@Autowired
	private DaoInter daoInter;
	
	@RequestMapping(value="showMyFollower", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> showMyFollower(@RequestParam("m_no")String m_no){
		Map<String, Object> map = new HashMap<String, Object>();
		List<FollowDto> list = daoInter.showMyFollower(m_no);
		map.put("Mylist", list);
		return map;
	}
	@RequestMapping(value="showIFollow", method = RequestMethod.GET)
	public ModelAndView showIFollow(@RequestParam("m_no")String m_no){
		return new ModelAndView("showFollow", "wishlist" , daoInter.showIFollow(m_no));
	}
	@RequestMapping(value="follow", method = RequestMethod.POST)
	public void follow(FollowBean bean){
		daoInter.follow(bean);
		
	}
	@RequestMapping(value="followCancel", method = RequestMethod.POST)
	public void followCancel(FollowBean bean){
		daoInter.followCancel(bean);
		
	}
	
}
