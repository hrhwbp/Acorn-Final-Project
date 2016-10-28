package com.remind.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.remind.model.DaoInter;
import com.remind.model.ReplyDto;

@Controller
public class ReplyController {
	@Autowired
	private DaoInter daoInter;
	@RequestMapping(value="insertReply", method=RequestMethod.POST)
	public String writeReply(ReplyBean bean){
		boolean b = daoInter.writeReply(bean);
		if(b) return "showDetail"+bean.getR_bno();
		else return "redirect:/error.jsp";
	}
	@RequestMapping(value="deleteReply", method = RequestMethod.GET)
	public String deleteReply(@RequestParam("r_no")String r_no){
		boolean b = daoInter.deleteReply(r_no);
		ReplyDto dto = daoInter.showReplyDetail(r_no);
		if(b) return "showDetail"+dto.getR_bno();
		else return "redirect:/error.jsp";
	}
	@RequestMapping(value="updateReply", method = RequestMethod.GET)
	@ResponseBody
	public ReplyDto replyDetail(@RequestParam("r_no")String r_no){
		return daoInter.showReplyDetail(r_no);
	}
	
	@RequestMapping(value="updateReply", method = RequestMethod.POST)
	public String updateReply(ReplyBean bean){
		boolean b = daoInter.updateReply(bean);
		if(b) return "showDetail"+bean.getR_bno();
		else return "redirect:/error.jsp";
	}
	
}
