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
		if(dto.getF_ms() != null){
			boolean b = daoInter.followUpdate(dto.getF_no(),"insert");
			if(b){
				bean.setF_sno(dto.getF_mno());
				bean.setF_mno(dto.getF_sno());
				bean.setF_ms("2");
				daoInter.follow(bean);
			}
			/*System.out.println("sno인 사람 f_ms업데이트 필요" + dto.getF_no());*/
		}else{
			String imsi = bean.getF_mno();
			bean.setF_mno(bean.getF_sno());
			bean.setF_sno(imsi);
			daoInter.follow(bean);
			/*System.out.println("내가 먼저 팔로우 하는경우");*/
		}
	}
	
	
	@RequestMapping(value="followCancel", method = RequestMethod.POST)
	@ResponseBody
	public void followCancel(FollowBean bean){
		FollowDto dto = daoInter.selectFollower(bean);
		if(dto != null){
			boolean b = daoInter.followUpdate(dto.getF_no(),"delete");
			if(b){
				bean.setF_sno(dto.getF_mno());
				bean.setF_mno(dto.getF_sno());
				daoInter.followCancel(bean);
			}
		}else{
			System.out.println("안옴 ?");
			String imsi = bean.getF_mno();
			bean.setF_mno(bean.getF_sno());
			bean.setF_sno(imsi);
			System.out.println(bean.getF_mno() + " 1 " + bean.getF_sno());
			daoInter.followCancel(bean);
		}
	}
	
}
