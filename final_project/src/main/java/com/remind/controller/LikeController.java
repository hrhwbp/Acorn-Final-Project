package com.remind.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.remind.model.DaoInter;
import com.remind.model.LikeDto;

@Controller
public class LikeController {
	@Autowired
	private DaoInter daoInter;
	
	/*@RequestMapping(value="insertReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> like(LikeBean bean){
		daoInter.like(bean);
		List<LikeDto> like = daoInter.showLike(bean.getL_bno());
		int countLike = daoInter.countLike(bean.getL_bno());
		int LikeYN = daoInter.likeYN(bean);
		
				
	}*/
}
