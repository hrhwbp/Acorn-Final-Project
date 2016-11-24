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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.remind.model.AnniversaryDto;
import com.remind.model.DaoInter;

@Controller
public class AnniversaryController {
	@Autowired
	private DaoInter daoInter;
	@RequestMapping(value="showanniversary", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, String>> list(HttpSession session){
		String m_no = (String)session.getAttribute("mno");
		List<Map<String, String>> dataList = new ArrayList<Map<String,String>>();
		Map<String, String> data = null;
		List<AnniversaryDto> eventList = daoInter.showAnniversary(m_no);
		for(AnniversaryDto s: eventList){
			data = new HashMap<String,String>();
			data.put("A_date", s.getA_date());
			data.put("A_detail", s.getA_detail());
			data.put("A_mimage", s.getA_mimage());
			data.put("A_mname", s.getA_mname());
			dataList.add(data);
		}
		return dataList;
	}
	@RequestMapping(value="anniversary", method = RequestMethod.GET)
	public String list(){
	return 	"redirect:/calendar.jsp";
	}
}
