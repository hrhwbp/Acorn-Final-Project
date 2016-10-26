package com.remind.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.remind.model.BoardDto;
import com.remind.model.DaoInter;
import com.remind.model.MemberDto;

@Controller
public class BoardController {
	@Autowired
	private DaoInter daoInter;
	
	@RequestMapping(value="snslist", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam("m_no") String m_no){
		List<BoardDto> list = daoInter.showBoard(m_no);
		return new ModelAndView("main","list",list);
	}
	@RequestMapping(value="showDetail", method=RequestMethod.GET)
	public BoardDto showDetail(@RequestParam("b_no1") String b_no1){
		return daoInter.showBoardDetail(b_no1);
	}
	
	@RequestMapping(value="write",method = RequestMethod.GET)
	public String write(){
		return "write";
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String writeSubmit(BoardBean bean){
		boolean b = daoInter.write(bean);
		if(b) return "redirect:/snslist"+bean.getB_mno();
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
		if(b){return "redirect:/snslist?m_no=" + bean.getB_mno();}
		else return "redirect:/error.jsp";
	}
	
	@RequestMapping(value="deleteBoard", method = RequestMethod.GET)
	public String deleteSubmit(@RequestParam("b_no1") String b_no1){
		boolean b = daoInter.eraseBoard(b_no1);
		BoardDto dto = daoInter.showBoardDetail(b_no1);
		if(b){return "redirect:/snslist?m_no=" + dto.getB_mno();}
		else return "redirect:/error.jsp";
	}
	
	
}
