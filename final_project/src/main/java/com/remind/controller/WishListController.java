package com.remind.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.remind.model.DaoInter;

@Controller
public class WishListController {
	@Autowired
	private DaoInter daoInter;
	
	@RequestMapping(value="showWishList", method = RequestMethod.GET)
	public ModelAndView showWishList(@RequestParam("w_mno")String w_mno){
		
		return new ModelAndView("showWishList","wishlist",daoInter.showWishList(w_mno));
	}
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
	@RequestMapping(value="updateWishList", method = RequestMethod.GET)
	public String updateWishList(@RequestParam("w_mno")String w_mno){
		return "insertWishList?w_mno="+w_mno;
		
	}
	@RequestMapping(value="updateWishList", method = RequestMethod.POST)
	public String updateWishListsubmit(WishlistBean bean){
		boolean b = daoInter.updateWishlist(bean);
		if(b)
			return "showWishList?w_mno=" +bean.getW_mno();
		else
			return "redirect:/error.jsp";
	}
	@RequestMapping(value="deleteWishList", method = RequestMethod.GET)
	public String deleteWishListsubmit(@RequestParam("w_mno")String w_mno){
		boolean b = daoInter.deleteWishlist(w_mno);
		if(b)
			return "showWishList?w_mno=" +w_mno;
		else
			return "redirect:/error.jsp";
	}
	
}