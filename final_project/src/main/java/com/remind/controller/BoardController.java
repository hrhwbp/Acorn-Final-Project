package com.remind.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.remind.model.BoardDto;
import com.remind.model.DaoInter;
import com.remind.model.LikeDto;
import com.remind.model.ReplyDto;

@Controller
public class BoardController {
	@Autowired
	private DaoInter daoInter;
	
	/*@RequestMapping(value="snslist", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam("mno") String m_no){
		List<BoardDto> list = daoInter.showBoard(m_no);
		ModelAndView model = new ModelAndView();
		
		model.addObject("list", list);
		model.addObject("reply",daoInter.showReplyall());
		model.setViewName("../../main");
		return model;
	}*/
	@RequestMapping(value="snslist", method = RequestMethod.GET)
	public ModelAndView list(HttpSession session){
		String m_no = (String) session.getAttribute("mno");
		ModelAndView model = new ModelAndView();
		List<BoardDto> list = daoInter.showBoard(m_no);
		for (int i = 0; i < list.size(); i++) {
			List<ReplyDto> reply = daoInter.showReply(list.get(i).getB_no());
			model.addObject("reply" + list.get(i).getB_no(), reply);	
		}
		for (int i = 0; i < list.size(); i++) {
			List<LikeDto> like = daoInter.showLike(list.get(i).getB_no());
			model.addObject("like" + list.get(i).getB_no(), like);	
		}
		for (int i = 0; i < list.size(); i++) {
			LikeBean bean = new LikeBean();
			bean.setL_bno(list.get(i).getB_no());
			bean.setL_mno(m_no);
			int likeYN = daoInter.likeYN(bean);
			model.addObject("likeYN" + list.get(i).getB_no(), likeYN);	
		}
		model.addObject("list", list);
		model.setViewName("../../main");
		return model;
	}
	/*@RequestMapping(value="snslist", method = RequestMethod.POST)
	public Map<String, Object> listPOST(@RequestParam("b_no") String b_no){
		System.out.println("snslist test" + b_no);
		List<ReplyDto> reply = daoInter.showReply(b_no);
		List<LikeDto> like = daoInter.showLike(b_no);
		List<Map<String, String>> replydataList = new ArrayList<Map<String, String>>();
		Map<String, String> replydata = null;
		for (ReplyDto dto:reply){
			replydata = new HashMap<String, String>();
			replydata.put("r_name", dto.getR_name());
			replydata.put("r_content",dto.getR_content());
			replydataList.add(replydata);
		}
		List<Map<String, String>> likeList = new ArrayList<Map<String, String>>();
		Map<String, String> likedata = null;
		for (LikeDto dto:like){
			likedata = new HashMap<String, String>();
			likedata.put("l_name", dto.getL_mname());
			likeList.add(likedata);
		}
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("replydata"+b_no,replydataList);
		data.put("likedata"+b_no, likeList);
		
		return data;
		
		
		
	}*/
	@RequestMapping(value="showDetail", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> ShowDetail(@RequestParam("b_no") String b_no){
		List<ReplyDto> listReply = daoInter.showReply(b_no);
		BoardDto showDetail =  daoInter.showBoardDetail(b_no);
	/*	List<Map<String, String>> replyList = new ArrayList<Map<String,String>>();
		Map<String, String> reply = null;
		for(ReplyDto dto:listReply){
			reply = new HashMap<String, String>();
			reply.put("r_no", dto.getR_no());
			reply.put("r_bno", dto.getR_bno());
			reply.put("r_mno", dto.getR_mno());
			reply.put("r_content", dto.getR_content());
			reply.put("r_date", dto.getR_date());
			replyList.add(reply);
		}
		Map<String, String> detail = new HashMap<String, String>();
		detail.put("b_no1", showDetail.getB_no1());
		detail.put("b_mno", showDetail.getB_mno());
		detail.put("b_image", showDetail.getB_image());
		detail.put("b_content", showDetail.getB_content());
		detail.put("b_date", showDetail.getB_date());
		detail.put("b_like", showDetail.getB_like());
		Map<String, Object> resultData = new HashMap<String, Object>();
		resultData.put("listReply", replyList);
		resultData.put("showDetail", detail);*/
		Map<String, Object> resultData = new HashMap<String, Object>();
		resultData.put("listReply", listReply);
		resultData.put("showDetail", showDetail);
		return resultData;
	}
	
	@RequestMapping(value="write",method = RequestMethod.GET)
	public String write(){
		return "write";
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String writeSubmit(BoardBean bean){
		boolean b = daoInter.write(bean);
		if(b) return "snslist"+bean.getB_mno();
		else return "redirect:/error.jsp";
	}
	@RequestMapping(value="updateBoard", method=RequestMethod.GET)
	public ModelAndView updateBoard(@RequestParam("b_no1") String b_no1){
		BoardDto dto = daoInter.showBoardDetail(b_no1);
		return new ModelAndView("updateboard","dto",dto);
	}
	@RequestMapping(value="updateBoard", method = RequestMethod.POST)
	public String updateSubmit(BoardBean bean){
		boolean b = daoInter.updateBoard(bean);
		if(b){return "snslist?m_no=" + bean.getB_mno();}
		else return "redirect:/error.jsp";
	}
	
	@RequestMapping(value="deleteBoard", method = RequestMethod.GET)
	public String deleteSubmit(@RequestParam("b_no1") String b_no1){
		boolean b = daoInter.eraseBoard(b_no1);
		BoardDto dto = daoInter.showBoardDetail(b_no1);
		if(b){return "snslist?m_no=" + dto.getB_mno();}
		else return "redirect:/error.jsp";
	}
	
	
}
