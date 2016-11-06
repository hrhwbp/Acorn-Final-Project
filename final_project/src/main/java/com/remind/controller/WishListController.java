package com.remind.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.remind.model.AnnoInter;
import com.remind.model.DaoInter;
import com.remind.model.WishlistDto;

@Controller
public class WishListController {
	@Autowired
	private DaoInter daoInter;
	
	//Wishlist 보기
	@RequestMapping(value="showWishList", method = RequestMethod.GET)
	public ModelAndView showWishList(@RequestParam("w_mno")String w_mno){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("wishlist",daoInter.showWishList(w_mno));	
		modelAndView.addObject("wishgroup",daoInter.showWishGroup(w_mno));
		System.out.println("test : " + daoInter.showWishList(w_mno));
		
		modelAndView.setViewName("../../wishlist");
		return modelAndView;
	}

	//Wishlist 추가
	@RequestMapping(value="insertWishList", method = RequestMethod.GET)
	public String insertWishList(@RequestParam("w_mno")String w_mno){		
		return "insertWishList?w_mno="+w_mno;
		
	}
	@RequestMapping(value="insertWishList", method = RequestMethod.POST)
	public String insertWishListsubmit(WishlistBean bean){
		boolean b = daoInter.writeWishlist(bean);
		if(b)
			return "showWishList?w_mno=" +bean.getW_mno();
		else
			return "redirect:/error.jsp";
	}
	
	//Wishlist 변경
	@RequestMapping(value="updateWishList", method = RequestMethod.GET)
	public String updateWishList(@RequestParam("w_mno")String w_mno){
		return "insertWishList?w_mno="+w_mno;
		
	}
	@RequestMapping(value="updateWishList", method = RequestMethod.POST)
	public String updateWishListsubmit(WishlistBean bean){
		boolean b = daoInter.updateWishlist(bean);
		if(b)
			return "showWishList?w_mno=" + bean.getW_mno();
		else
			return "redirect:/error.jsp";
	}
	
	//Wishlist 물품삭제
	@RequestMapping(value="deleteWishList", method = RequestMethod.GET)
	public String deleteWishListsubmit(@RequestParam("w_mno")String w_mno){
		boolean b = daoInter.deleteWishlist(w_mno);
		if(b)
			return "showWishList?w_mno=" +w_mno;
		else
			return "redirect:/error.jsp";
	}
	
	//WishList Group 추가
	@RequestMapping(value="insertWishGroup", method = RequestMethod.POST)
	public String insertWishGroup(WishlistBean bean){	
		boolean b = daoInter.insertWishGroup(bean);
		String w_mno = bean.getW_mno();
		System.out.println(bean.getW_mno());
		System.out.println(b);
		if(b)
			return "redirect:/showWishList?w_mno=" + w_mno;  //"showWishList?w_mno=" + bean.getW_mno();
		else
			return	"redirect:/error.jsp";		
	}
	
	@RequestMapping(value="ReadWishGroupList4Edit", method = RequestMethod.GET)
	public Map<String, Object> ReadWishGroupList4Edit(@RequestParam("wg_no")String wg_no){
		List<Map<String, String>> dataList = new ArrayList<Map<String,String>>();
		Map<String, String> data = null;
		
		List<WishlistDto> wishGroup = daoInter.ReadWishGroupList4Edit(wg_no);
		
		for(WishlistDto w:wishGroup){
			data = new HashMap<String, String>();
			data.put("wg_no", w.getWg_no());
			data.put("wg_detail", w.getWg_detail());			
			dataList.add(data);
		}
		Map<String, Object> wishGroupData = new HashMap<String, Object>();
		wishGroupData.put("WishGroupData", dataList);
		return wishGroupData;
		
		return null;
	}
/*	
	//WishList Group 변경
	@RequestMapping(value="updateWishGroup", method = RequestMethod.POST)
	public ModelAndView updateWishGroup(@RequestParam("w_mno")String w_mno, WishlistBean bean){	
		boolean b = daoInter.insertWishGroup(bean);
		String w_mno = bean.getW_mno();
		System.out.println(bean.getW_mno());
		System.out.println(b);
		if(b)
			return ;
		else
			return	"redirect:/error.jsp";		
	}
	
	//ajax
	 * public Map<String, Object> sangpum(){
		List<Map<String, String>> dataList = new ArrayList<Map<String,String>>();
		Map<String, String> data = null;
		
		List<SangpumDto> sangList = inter.list();
		
		for(SangpumDto s:sangList){
			data = new HashMap<String, String>();
			data.put("code", s.getCode());
			data.put("sang", s.getSang());
			data.put("su", s.getSu());
			data.put("dan", s.getDan());
			dataList.add(data);
		}
		Map<String, Object> sangpumData = new HashMap<String, Object>();
		sangpumData.put("Datas", dataList);
		return sangpumData;
	}		
			
			
			
	
	
*/
	
}
