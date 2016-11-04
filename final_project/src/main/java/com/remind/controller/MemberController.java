package com.remind.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionAttributeStore;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.remind.model.DaoInter;
import com.remind.model.MemberDto;

@Controller
//@SessionAttributes("mno")
public class MemberController {
	@Autowired
	private DaoInter daoInter;
	@RequestMapping(value="showMyMain", method = RequestMethod.GET)
	public ModelAndView showMyMain(@RequestParam("b_mno") String b_mno){
		return new ModelAndView("myMain","myboard",daoInter.showMyMain(b_mno));
	}
	
	@RequestMapping(value="join", method= RequestMethod.POST)
	public String join(MemberBean bean){
		
		bean.setM_bdate(bean.getYear()+ "-" + bean.getMonth() + "-" + bean.getDay());
		boolean b = daoInter.joinMember(bean);
		if(b){
			MemberDto dto = daoInter.memberDetail(bean.getM_name());
			AnniversaryBean bean2 = new AnniversaryBean();
			bean2.setA_date(bean.getM_bdate());
			bean2.setA_detail("생일");
			bean2.setA_mno(dto.getM_no());
			daoInter.insertAnniversary(bean2);
			return "redirect:/index.jsp";
		}
		else return "redirect:/error.jsp";
	}
	@RequestMapping(value="out", method = RequestMethod.GET)
	public ModelAndView outConfirm(@RequestParam("m_no") String m_no){
		return new ModelAndView("deleteconfirm","m_no",m_no);
	}
	@RequestMapping(value="out", method= RequestMethod.POST)
	public String out(@RequestParam("m_no") String m_no){
		boolean b = daoInter.outMember(m_no);
		if(b)
			return "redirect:/index.jsp";
		else return "redirect:/error.jsp";
	}
	@RequestMapping(value="update", method=RequestMethod.GET)
	public ModelAndView updateMember(@RequestParam("m_no") String m_no){
		MemberDto dto = daoInter.showMemberDetail(m_no);
		return new ModelAndView("updateform","dto",dto);
	}
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String updateSubmit(MemberBean bean){
		boolean b = daoInter.updateMember(bean);
		if(b){return "redirect:/snslist?m_no=" + bean.getM_no();}
		else return "redirect:/error.jsp";
			
	}
	@RequestMapping(value="login", method = RequestMethod.POST)
	public String login(MemberBean bean, HttpSession session){
		MemberDto dto = daoInter.login(bean);
		
		
		if(dto.getM_no()!= null){
			session.setAttribute("mno", dto.getM_no());			
			return "redirect:/snslist";  //+ dto.getM_no()
		}else{
			return "login.jsp";
		}
	}
	
	@RequestMapping(value="logout", method = RequestMethod.GET)
	public String logoutConfirm(HttpSession session){		
		session.removeAttribute("mno");		
		return "../../index";
	}
	
}
