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
	
	@RequestMapping(value="showMyFollower", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showMyFollower(@RequestParam("m_no")String m_no){
		Map<String, Object> map = new HashMap<String, Object>();
		List<FollowDto> list = daoInter.showMyFollower(m_no);
		map.put("Mylist", list);
		map.put("m_no", m_no);
		return map;
	}
	@RequestMapping(value="showIFollow", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showIFollow(@RequestParam("m_no")String m_no){
		Map<String, Object> map = new HashMap<String, Object>();
		List<FollowDto> list = daoInter.showIFollow(m_no);
		map.put("Mylist", list);
		map.put("m_no", m_no);
		return map;
	}
	
	
	@RequestMapping(value="insertFollow", method = RequestMethod.POST)
	@ResponseBody
	public void follow(FollowBean bean){
		FollowDto dto = daoInter.selectFollower(bean);
		System.out.println(dto.getF_ms());
		if(dto.getF_ms().equals("1")){
			boolean b = daoInter.followUpdate(dto.getF_no());
			if(b){
				bean.setF_sno(dto.getF_mno());
				bean.setF_mno(dto.getF_sno());
				bean.setF_ms("2");
				
				daoInter.follow(bean);
			}
			/*System.out.println("sno인 사람 f_ms업데이트 필요" + dto.getF_no());*/
		}else{
			System.out.println("내가 먼저 팔로우 하는경우");
		}
	}
	
	
	@RequestMapping(value="followCancel", method = RequestMethod.POST)
	public void followCancel(FollowBean bean){
		daoInter.followCancel(bean);
		
	}
	
}
